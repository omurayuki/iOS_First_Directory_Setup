import RxSwift
import RxRelay

protocol CompleteUsecaseProtocol {
    var complete: Observable<Bool?> { get }
}
