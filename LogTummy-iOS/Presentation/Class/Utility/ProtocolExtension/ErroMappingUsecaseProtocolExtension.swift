
protocol ErroMappingUsecaseProtocolExtension { }

extension ErroMappingUsecaseProtocolExtension {
    /**
     APIError caseが増えた時のた事前対応必須
     */
    func mapError(error: APIError, retryBlock: VoidBlock? = nil, errorMessage: String? = nil) -> AppError {
        if case .swifterError = error {
            
            if DeviceInfo().isOffline {
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
