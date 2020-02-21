import UIKit

protocol LoginRoutingProtocol: Routing {
    
    func fuga()
}

final class LoginRouting: LoginRoutingProtocol {
    
    var viewController: UIViewController?
    
    func fuga() {
        print("routing")
    }
}
