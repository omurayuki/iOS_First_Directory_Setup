import Foundation
import UIKit

final public class AppError: DisplayableErrorProtocol {
    
    private typealias ErrorStrings = StringResources.Application.Error
    private typealias GeneralStrings = StringResources.Application.General
    
    enum ResolutionType {
        case none
        case retry
        case forceRetry
    }
    
    private(set) var resolutionType: ResolutionType = .none
    private(set) var message: String = String.blank
    private(set) var title: String = String.blank
    private(set) var resolution: (() -> Void)?
    
    init(error: Error, resolutionType: ResolutionType = .none, resolution: VoidBlock? = nil) {
        
        if let displayableError = error as? DisplayableErrorProtocol {
            self.title = displayableError.title
            self.message = displayableError.message
        } else {
            self.title = ErrorStrings.standardErrorMessage
            self.message = error.localizedDescription
        }
        
        self.resolution = resolution
        self.resolutionType = resolutionType
    }
    
    init(title: String, message: String, resolutionType: ResolutionType = .none, resolution: VoidBlock? = nil) {
        self.title = title
        self.message = message
        self.resolution = resolution
        self.resolutionType = resolutionType
    }
    
    private init() { }
}

extension AppError {
    /**

     # Standard Error Message and Title
     ## All Paramaters are Optional.

      - Parameters:

         - resolutionType:
            provides different default methods for user to retry
            the action; this affects ui button layout but its the
            programmers responsibility to make sure the specific
            action is taken care of properly.

         - retryable:
            if this action is retryable, this method will set the
            text on the message indicating that it is retryable.

         - localizedRetryMessage:
            in the case that an error is `retryable` = true, this
            localized message is also included in the displayed
            error, otherwise it is ignored.

         - resolution:
            a colsure provided to run in the case that the error
            is to be tried to recover or not. this can escape the
            enclosing space so it may be a good idea to reference
            `self` weakly within the closure unless there is a
            specific need to do otherwise...
     */
    
    static func standardError(resolvedBy resolutionType: ResolutionType = .none, retryable: Bool = false, localizedRetryMessage: String = String.blank, errorCode: String = String.blank, resolution: VoidBlock? = nil) -> AppError {

        let retryMessageOrEmpty = (retryable && !localizedRetryMessage.isEmpty) ? String(format: " %@", localizedRetryMessage) : String.blank
        let standardMessage = errorCode.isEmpty ? ErrorStrings.standardErrorMessage : ErrorStrings.standardErrorMessageWithFormat(errorCode)
        let message = String(format: "%@%@", standardMessage, retryMessageOrEmpty)

        let title = ErrorStrings.standardErrorTitle
        let body = message

        let appError = AppError()
        appError.resolutionType = resolutionType
        appError.resolution = resolution
        appError.message = body
        appError.title = title

        return appError
    }
    
    static func standardErrorWithRetry(resolution: VoidBlock?, localizedRetryMessage: String = String.blank) -> AppError {

        return standardError(resolvedBy: .retry,
                             retryable: true,
                             localizedRetryMessage: localizedRetryMessage,
                             resolution: resolution)
    }
    
    static func blockingErrorWithRetry(resolution: VoidBlock?, localizedRetryMessage: String = String.blank) -> AppError {
        
        return standardError(resolvedBy: .forceRetry,
                             retryable: true,
                             localizedRetryMessage: localizedRetryMessage,
                             resolution: resolution)
    }

    static func standardError(from error: Error, retryWith retry: (() -> Void)?) -> AppError {

        if let retry = retry {
            return standardErrorWithRetry(resolution: retry, localizedRetryMessage: error.localizedDescription)
        }

        let standardError = AppError.standardError()
        standardError.message = error.localizedDescription

        return standardError
    }

    static func offlineError(resolution: VoidBlock?) -> AppError {
        let resolutionType: ResolutionType = resolution != nil ? .retry : .none
        return AppError(title: ErrorStrings.standardErrorTitle,
                        message: ErrorStrings.noNetworkConnection,
                        resolutionType: resolutionType,
                        resolution: resolution)
    }
    
    static func blockingOfflineErrorWithRetry(resolution: VoidBlock?) -> AppError {
        
        return AppError(title: ErrorStrings.standardErrorTitle,
                        message: ErrorStrings.noNetworkConnection,
                        resolutionType: .forceRetry,
                        resolution: resolution)
    }
}

extension AppError {
    /**
     Convenience Method to Get Alert Controller for Retry Action or Simple Display
     */
    func alertController(okActionHandler: @escaping (() -> Void) = {}) -> UIAlertController {

        let title = self.title
        let message = self.message
        let resolution = self.resolution

        let retryActionTitle: String?
        let closeActionTitle: String
        let retryActionHandler: (() -> ())?
        let closeActionHandler: () -> ()

        switch self.resolutionType {
            case .none:
                closeActionTitle = GeneralStrings.okButtonTitle
                closeActionHandler = okActionHandler
                retryActionTitle = nil
                retryActionHandler = nil

            case .retry:
                closeActionTitle = GeneralStrings.okButtonTitle
                closeActionHandler = okActionHandler
                retryActionTitle = ErrorStrings.retryAction
                retryActionHandler = { resolution?() }

            case .forceRetry:
                closeActionTitle = ErrorStrings.retryAction
                closeActionHandler = { resolution?(); okActionHandler(); }
                retryActionTitle = nil
                retryActionHandler = nil
        }

        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: closeActionTitle, style: .default) { _ in closeActionHandler() }
        alertController.addAction(closeAction)

        if let retryActionTitle = retryActionTitle, let retryActionHandler = retryActionHandler {
            let additionalAction = UIAlertAction(title: retryActionTitle, style: .default) { _ in retryActionHandler() }
            alertController.addAction(additionalAction)
        }

        return alertController
    }
}
