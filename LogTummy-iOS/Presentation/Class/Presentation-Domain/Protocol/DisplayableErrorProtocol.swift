import UIKit

protocol DisplayableErrorProtocol: Error {
    
    var title: String { get }
    var message: String { get }
    
    func alertController(okActionHandler: @escaping (() -> Void)) -> UIAlertController
}
