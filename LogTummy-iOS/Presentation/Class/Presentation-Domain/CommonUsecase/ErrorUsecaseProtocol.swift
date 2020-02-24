import RxSwift
import RxRelay

protocol ErrorUsecaseProtocol: ErrorMappingUsecaseProtocolExtension {
    var error: Observable<Error?> { get }
}
