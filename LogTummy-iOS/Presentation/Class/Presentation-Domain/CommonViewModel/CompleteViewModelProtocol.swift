import RxSwift
import RxRelay

protocol CompleteViewModelProtocol {
    var complete: Observable<Bool?> { get }
}
