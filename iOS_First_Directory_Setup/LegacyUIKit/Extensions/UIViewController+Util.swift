import Accounts
import CoreLocation
import Foundation
import Social
import MessageUI
import UIKit.UIViewController

extension UIViewController {
    
    func dismissOrPopViewController() {
        guard self.navigationController?.viewControllers.count != 1 else {
            self.navigationController?.dismiss(animated: true)
            return
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    func dismissAndEndEditing() {
        view.endEditing(true)
        dismiss(animated: true)
    }
    
    func setBackButton(title: String) {
        let backButton = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    func setUserInteraction(enabled: Bool) {
        view.isUserInteractionEnabled = enabled
        if let navi = navigationController {
            navi.view.isUserInteractionEnabled = enabled
        }
    }
    
    func showError(message: String) {
        let alert = UIAlertController.createSimpleOkMessage(title: "R.string.localizable.error_title()", message: message)
        present(alert, animated: true)
    }
    
    func showSuccess(message: String) {
        let alert = UIAlertController.createSimpleOkMessage(title: "R.string.localizable.success_title()", message: message)
        present(alert, animated: true)
    }
    
    func showAttentionAlert(message: String) {
        let alert = UIAlertController.createSimpleOkMessage(title: "R.string.localizable.attention_title()", message: message)
        self.present(alert, animated: true)
    }
    
    func showAlertSheet(title: String, message: String, actionTitle: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default) { _ -> Void in
            completion?()
        }
        let cancelAction = UIAlertAction(title: "R.string.localizable.frame_selected_action_sheet_cancel()", style: .cancel, handler: nil)
        alert.addAction(action)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func validatePasswordMatch(pass: String, rePass: String, completion: @escaping (_ pass: String?) -> Void) {
        pass == rePass ? completion(pass) : completion(nil)
    }
    
    func clearNavBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func undoNavBar() {
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }
    
    func coloringAppMainNavBar() {
        #warning("アプリのメインカラーに設定")
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func showActionSheet(title: String, message: String, completion: @escaping () -> Void) {
        let alert = UIAlertController.createActionSheet(title: title,
                                                        message: message,
                                                        okCompletion: {
                                                            completion()
        })
        present(alert, animated: true)
    }
    
    func getStreetAddress(placemark: CLPlacemark) -> String {
        guard
            let administrativeArea = placemark.administrativeArea,
            let locality = placemark.locality,
            let thoroughfare = placemark.thoroughfare,
            let subThoroughfare = placemark.subThoroughfare
            else { return "R.string.localizable.could_not_get()" }
        return "\(administrativeArea)\(locality)\(thoroughfare)\(subThoroughfare)"
    }
    
    func showAutomaticallyDisappearAlert(title: String, message: String, deadline: DispatchTime) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.present(alert, animated: true, completion: {
            DispatchQueue.main.asyncAfter(deadline: deadline, execute: {
                alert.dismiss(animated: true, completion: nil)
            })
        })
    }
}

extension UIViewController: Initializable { }
