import Foundation
import RxSwift
import RxCocoa

protocol TweetLogViewModelProtocol: ErrorViewModelProtocol {
    
}

final class TweetLogViewModel: TweetLogViewModelProtocol {
    
    private let usecase: TweetLogUsecaseProtocol & ErrorUsecaseProtocol
    
    private let errorSubject: BehaviorSubject<Error?> = BehaviorSubject(value: nil)
    private let disposeBag: DisposeBag = DisposeBag()

    init(usecase: TweetLogUsecaseProtocol & ErrorUsecaseProtocol) {
        self.usecase = usecase
    }
}

extension TweetLogViewModel {
    
    var error: Observable<Error?> {
        return errorSubject.asObservable()
    }
}
