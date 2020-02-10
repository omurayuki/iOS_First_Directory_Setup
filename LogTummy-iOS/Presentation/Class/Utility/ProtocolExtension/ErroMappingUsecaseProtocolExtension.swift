import RxSwift
import RxRelay

public typealias VoidBlock = () -> Void

protocol ErroMappingUsecaseProtocolExtension { }

extension ErroMappingUsecaseProtocolExtension {
    
    func mapError(error: Error, retryBlock: VoidBlock? = nil, errorMessage: String? = nil) -> 
}
