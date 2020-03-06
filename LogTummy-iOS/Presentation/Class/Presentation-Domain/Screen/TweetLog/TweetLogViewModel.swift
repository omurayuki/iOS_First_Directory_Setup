import Foundation
import RxSwift
import RxCocoa

struct TweetLogCellData {
    var accountName: String?
    var accountProfileImage: String?
    var accountLink: String?
    var posted: Bool
    var ownDate: String
    var postDate: String?
    var postTime: String?
    var postLink: String?
}

protocol TweetLogViewModelProtocol: ErrorViewModelProtocol {
    func getTWAccountData()
    func getTweetLogData()
    var tweetLogCellData: TweetLogCellData? { get set }
    func getTweetLogCellData() -> TweetLogCellData
}

final class TweetLogViewModel: TweetLogViewModelProtocol {
    
    private let usecase: TweetLogUsecaseProtocol & ErrorUsecaseProtocol
    
    private let errorSubject: BehaviorSubject<Error?> = BehaviorSubject(value: nil)
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    internal var tweetLogCellData: TweetLogCellData?

    init(usecase: TweetLogUsecaseProtocol & ErrorUsecaseProtocol) {
        self.usecase = usecase
        getTweetLogCellDataStream()
    }
    
}

extension TweetLogViewModel {
    
    private func getTweetLogCellDataStream() {
        Observable
            .zip(usecase.getTWAccountStream(), usecase.getTweetLogStream())
            .subscribe(onNext: { [weak self] accountBusinessModel, tweetLogBusinessModel in
                guard let tweetLogBusinessModel = tweetLogBusinessModel else { return }
                let cellData = TweetLogCellData(accountName: accountBusinessModel?.name,
                                                accountProfileImage: accountBusinessModel?.profileImage,
                                                accountLink: accountBusinessModel?.accountLink,
                                                posted: tweetLogBusinessModel.posted,
                                                ownDate: tweetLogBusinessModel.ownDate,
                                                postDate: tweetLogBusinessModel.postDate,
                                                postTime: tweetLogBusinessModel.postTime,
                                                postLink: tweetLogBusinessModel.postLink)
                self?.tweetLogCellData = cellData
                
            }).disposed(by: disposeBag)
            // usecaseから取得 bindingでpostentityとaccountentitiyを取得してviewmodelプロパティにセット そしてそのプロパティをcombinelatestで常に監視してcelldataにセット そしてvcからはそのcelldataを取得してデータとして渡す
    }
    
    func getTWAccountData() {
        usecase.getTWAccountData()
    }
    
    func getTweetLogData() {
        usecase.getTweetLogData()
    }
    
    func getTweetLogCellData() -> TweetLogCellData {
        guard let cellData = tweetLogCellData else {
            Logger.error("can't get tweetLogCellData")
            fatalError()
        }
        return cellData
    }
}

extension TweetLogViewModel {
    
    var error: Observable<Error?> {
        return errorSubject.asObservable()
    }
}
