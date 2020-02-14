import Foundation
import UIKit

extension UIAlertController {
    
    class func createTwoButton(title: String?,
                               message: String,
                               left: String,
                               right: String,
                               leftCompletion: (() -> Void)? = nil,
                               rightCompletion: (() -> Void)? = nil) -> UIAlertController {
        
        let alert = UIAlertController(
            title: title ?? "",
            message: message,
            preferredStyle: .alert)
        
        let leftAction = UIAlertAction(title: left, style: .default) { _ -> Void in
            if let completion = leftCompletion {
                completion()
            }
        }
        
        let rightAction = UIAlertAction(title: right, style: .default) { _ -> Void in
            if let completion = rightCompletion {
                completion()
            }
        }
        
        alert.addAction(leftAction)
        alert.addAction(rightAction)
        
        return alert
    }
    
    class func createOneButton(title: String?,
                               message: String,
                               button: String,
                               completion: (() -> Void)? = nil) -> UIAlertController {
        
        let alert = UIAlertController(
            title: title ?? "",
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: button, style: .default) { _ -> Void in
            if let completion = completion {
                completion()
            }
        }
        
        alert.addAction(action)
        return alert
    }
    
    class func createSimpleOkMessage(title: String?,
                                     message: String,
                                     completion: (() -> Void)? = nil) -> UIAlertController {
        return createOneButton(title: title,
                               message: message,
                               button: "R.string.localizable.ok()",
                               completion: completion)
    }
    
    class func createNetworkError() -> UIAlertController {
        return createSimpleOkMessage(title: "R.string.localizable.error_title()",
                                     message: "R.string.localizable.error_message_network()",
                                     completion: nil)
    }
    
    class func createScoreEditActionSheet(tappedEditScore: @escaping () -> Void,
                                          tappedUseGnpScore: @escaping () -> Void) -> UIAlertController {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let editScoreAction = UIAlertAction(title: "R.string.localizable.frame_selected_action_sheet_edit()", style: .default) { _ -> Void in
            tappedEditScore()
        }
        
        let useGnpScoreAction = UIAlertAction(title: "R.string.localizable.frame_selected_action_sheet_edit()", style: .default) { _ -> Void in
            tappedUseGnpScore()
        }
        
        let cancelAction = UIAlertAction(title: "R.string.localizable.frame_selected_action_sheet_cancel()", style: .cancel)
        
        alert.addAction(editScoreAction)
        alert.addAction(useGnpScoreAction)
        alert.addAction(cancelAction)
        
        return alert
    }
    
    class func createActionSheet(title: String,
                                 message: String,
                                 okCompletion: (() -> Void)? = nil,
                                 cancelCompletion: (() -> Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        let defaultAction = UIAlertAction(title: "R.string.localizable.ok()",
                                          style: UIAlertAction.Style.default,
                                          handler: { _ -> Void in
            if let completion = okCompletion {
                completion()
            }
        })
        let cancelAction = UIAlertAction(title: "R.string.localizable.frame_selected_action_sheet_cancel()",
                                         style: .cancel,
                                         handler: { _ -> Void in
            if let completion = cancelCompletion {
                completion()
            }
        })
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        return alert
    }
    
    /// UIAlertActionを追加して返す。
    /// 各引数はUIAlertActionのinitと同じ。
    ///
    /// - SeeAlso: UIAlertAction
    @discardableResult
    func addAction(title: String?, style: UIAlertAction.Style = .default, handler: ((UIAlertAction) -> Swift.Void)? = nil) -> UIAlertAction {
        let action = UIAlertAction(title: title, style: style, handler: handler)
        self.addAction(action)
        return action
    }
}
