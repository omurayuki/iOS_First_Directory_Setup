import RxSwift
import RxRelay

protocol ErrorViewModelProtocol {
    var error: Observable<Error?> { get }
}
