import RxSwift
import RxCocoa

protocol TweetLogUsecaseProtocol: ErrorUsecaseProtocol {
    
}

final class TweetLogUsecase: TweetLogUsecaseProtocol {
    
    private let tweetLogDataManager: TweetLogDataManagerProtocol
    
    private let errorSubject: BehaviorSubject<Error?> = BehaviorSubject(value: nil)
    private let disposeBag: DisposeBag = DisposeBag()
    
    init(tweetLogDataManager: TweetLogDataManagerProtocol) {
        self.tweetLogDataManager = tweetLogDataManager
    }
}

extension TweetLogUsecase {
    
    var error: Observable<Error?> {
        return errorSubject.asObservable()
    }
}
