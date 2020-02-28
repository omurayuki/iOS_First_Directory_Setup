import UIKit.UISearchBar

extension UISearchBar {
    
    func setSearchText(fontSize: CGFloat) {
        if #available(iOS 13.0, *) {
            let font = searchTextField.font
            searchTextField.font = font?.withSize(fontSize)
        } else {
            guard let textField = value(forKey: "_searchField") as? UITextField else { return }
            textField.font = textField.font?.withSize(fontSize)
        }
    }
}
