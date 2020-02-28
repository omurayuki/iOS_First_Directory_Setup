import SwifteriOS

protocol ErrorMappingUsecaseProtocolExtension { }

extension ErrorMappingUsecaseProtocolExtension {
    /**
     APIError caseが増えた時のた事前対応必須
     */
    func mapSwifterError(error: Error, retryBlock: VoidBlock? = nil, errorMessage: String? = nil) -> AppError {
        if let error = error as? SwifterError {
            if SwifterError.isOffline(error.kind) {
                return AppError.offlineError(resolution: retryBlock)
            }
            
            if let errorMessage = errorMessage {
                return AppError(title: StringResources.Application.Error.standardErrorTitle,
                                message: errorMessage)
            }
        }
        return retryBlock != nil ? AppError.standardErrorWithRetry(resolution: retryBlock) : AppError.standardError()
    }
}
