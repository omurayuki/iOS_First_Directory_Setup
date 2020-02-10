import UIKit
import RxSwift
import RxRelay

protocol ErrorNotifying { }

extension ErrorNotifying where Self: AppDelegate {
    
    func showErrorMessage(_ error: Error?, dialogButtonTapped: (() -> Void)? = nil) {
        guard let viewController = window.rootViewController else { return }
        
    }
}

extension ErrorNotifying where Self: UIViewController {
    
    func showErrorMessage(_ error: Error, dialogButtonTapped: (() -> Void)? = nil) {
        
    }
}

fileprivate extension ErrorNotifying {
    
    func showErrorMessage(viewController: UIViewController, error: Error?, dialogButtonTapped: (() -> Void)? = nil) {
        guard let error = error else { return }
        guard !error.isOfflineError
    }
}
