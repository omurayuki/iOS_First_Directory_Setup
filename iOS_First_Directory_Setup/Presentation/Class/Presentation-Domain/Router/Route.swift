import UIKit

enum Route {
    
    case login
    
    func viewController() -> UIViewController {
        
        let viewController: UIViewController
        
        switch self {
        case .login:
//            viewController = Resources.ViewControllers.App.Login()
            break
        }
        
        return UIViewController()
    }
}
