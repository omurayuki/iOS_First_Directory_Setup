import Foundation
import UIKit

class KeyboardNotifier: NSObject {
    
    var keyboardPresent: ((_ height: CGFloat) -> Void)?
    var keyboardDismiss: ((_ hieght: CGFloat) -> Void)?
    
    func listenKeyboard() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillChangeFramex(_:)),
                                               name: UIApplication.keyboardWillChangeFrameNotification,
                                               object: nil)
    }
    
    @objc func keyboardWillChangeFramex(_ notification: Notification) {
        if let endFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = UIScreen.main.bounds.height - endFrame.origin.y
            if #available(iOS 11, *) {
                if keyboardHeight > 0 {
                    self.keyboardPresent?(keyboardHeight)
                } else {
                    self.keyboardDismiss?(keyboardHeight)
                }
            }
        }
    }
}

protocol KeyboardListener {
    
    var keyboardNotifier: KeyboardNotifier! { get set }
    
    func keyboardPresent(_ height: CGFloat)
    func keyboardDismiss(_ height: CGFloat)
}

extension KeyboardListener {
    
    func listenKeyboard(keyboardNotifier: KeyboardNotifier) {
        keyboardNotifier.listenKeyboard()
        keyboardNotifier.keyboardPresent = { height in
            self.keyboardPresent(height)
        }
        keyboardNotifier.keyboardDismiss = { height in
            self.keyboardDismiss(height)
        }
    }
}

protocol KeyboardHandler {
    
    var messageBarBottomConstraint: NSLayoutConstraint! { get }
    var bottomInset: CGFloat { get }
}

extension KeyboardHandler where Self: UIViewController {
    
    // swiftlint:enable:next discarded_notification_center_observer
    func addKeyboardObservers(_ completion: ((_ response: Bool) -> Void)?  = nil) {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                               object: nil,
                                               queue: nil) { [weak self] notification in
            let notification = notification
            self?.handleKeyboard(notification: notification)
            completion?(true)
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                               object: nil,
                                               queue: nil) { [weak self] notification in
            let notification = notification
            self?.handleKeyboard(notification: notification)
            completion?(false)
        }
    }
    
    private func handleKeyboard(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        messageBarBottomConstraint.constant = notification.name == UIResponder.keyboardWillHideNotification ? 0 : keyboardFrame.height - view.safeAreaInsets.bottom
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}
