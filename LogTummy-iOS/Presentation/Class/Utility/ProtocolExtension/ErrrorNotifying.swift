import UIKit
import RxSwift
import RxRelay

protocol ErrorNotifying { }

extension ErrorNotifying where Self: AppDelegate {
    
    func showErrorMessage(_ error: Error?, dialogButtonTapped: (() -> Void)? = nil) {
        guard let viewController = window?.rootViewController else { return }
        showErrorMessage(viewController: viewController, error: error, dialogButtonTapped: dialogButtonTapped)
    }
}

extension ErrorNotifying where Self: UIViewController {
    
    func showErrorMessage(_ error: Error, dialogButtonTapped: (() -> Void)? = nil) {
        showErrorMessage(viewController: self, error: error, dialogButtonTapped: dialogButtonTapped)
    }
}

fileprivate extension ErrorNotifying {
    
    func showErrorMessage(viewController: UIViewController, error: Error?, dialogButtonTapped: (() -> Void)? = nil) {
        guard let error = error else { return }
        #warning("!error.isOfflineError")
        guard true else {
            viewController.present(AppError.offlineError(resolution: nil).alertController(okActionHandler: dialogButtonTapped ?? {}), animated: true, completion: nil)
            return
        }
        guard let displayableError = error as? DisplayableErrorProtocol else {
            // Fallback
            viewController.present(AppError.standardError().alertController(okActionHandler: dialogButtonTapped ?? {}), animated: true, completion: nil)
            return
        }
        viewController.present(displayableError.alertController(okActionHandler: dialogButtonTapped ?? {}), animated: true, completion: nil)
    }
}
