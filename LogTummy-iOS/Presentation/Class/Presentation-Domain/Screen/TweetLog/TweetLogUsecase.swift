import RxSwift
import RxCocoa

protocol TweetLogUsecaseProtocol: ErrorUsecaseProtocol {
    
    func getTWAccountData()
    func getTweetLogData()
    func getTWAccountStream() -> Observable<TWAccountBusinessModel?>
    func getTweetLogStream() -> Observable<TweetLogBusinessModel?>
}

final class TweetLogUsecase: TweetLogUsecaseProtocol {
    
    private let tweetLogDataManager: TweetLogDataManagerProtocol
    
    private var twaccountBusinessModel: BehaviorRelay<TWAccountBusinessModel?> = BehaviorRelay<TWAccountBusinessModel?>(value: nil)
    private var tweetLogBusinessModel: BehaviorRelay<TweetLogBusinessModel?> = BehaviorRelay<TweetLogBusinessModel?>(value: nil)
    private let errorSubject: BehaviorSubject<Error?> = BehaviorSubject(value: nil)
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    init(tweetLogDataManager: TweetLogDataManagerProtocol) {
        self.tweetLogDataManager = tweetLogDataManager
    }
}

extension TweetLogUsecase {
    
    func getTWAccountData() {
        // fetchしてbusinessModelに変換
    }
    
    func getTweetLogData() {
        // fetchしてbusinessModelに変換
    }
    
    func getTWAccountStream() -> Observable<TWAccountBusinessModel?> {
        return twaccountBusinessModel.asObservable()
    }
    
    func getTweetLogStream() -> Observable<TweetLogBusinessModel?> {
        return tweetLogBusinessModel.asObservable()
    }
}

extension TweetLogUsecase {
    
    var error: Observable<Error?> {
        return errorSubject.asObservable()
    }
}
