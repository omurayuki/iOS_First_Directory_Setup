import UIKit

enum Route {
    
    case login
    case calendar
    case timeline
    
    func viewController() -> UIViewController {
        
        let viewController: UIViewController
        
        switch self {
        case .login:
            viewController = Resources.ViewControllers.App.Login()
        case .calendar:
            viewController = Resources.ViewControllers.App.calendar()
        case .timeline:
            viewController = Resources.ViewControllers.App.timeline()
        }
        
        return viewController
    }
}
