import RxSwift
import RxRelay

protocol ErroMappingUsecaseProtocolExtension { }

extension ErroMappingUsecaseProtocolExtension {
    
    func mapError(error: Error, retryBlock: VoidBlock? = nil, errorMessage: String? = nil) -> AppError {
        #warning("APIErrorハンドリング記載")
        #warning("オフラインかどうか")
        #warning("テストする")
        return retryBlock != nil ? AppError.standardErrorWithRetry(resolution: retryBlock) : AppError.standardError()
    }
}

//extension Error {
//    var isOfflineError: Bool {
//        guard let error = self as? APIError, let errorCode = ErrorCode(rawValue: error.code) else {
//            return false
//        }
//        return errorCode == .offline
//    }
//}
