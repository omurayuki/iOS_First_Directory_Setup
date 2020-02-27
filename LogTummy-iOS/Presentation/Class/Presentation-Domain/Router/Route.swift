import UIKit

enum Route {
    
    case login
    case calendar
    case timeline
    
    func viewController() -> UIViewController {
        
        let viewController: UIViewController
        
        switch self {
        case .login:
            viewController = resolver.resolve(LoginViewController.self)!
            #warning("assosiated valueとして遷移時に値を渡す場合があるから、frみたいにresourceクラスでinitializaをまとめる")
        case .calendar:
            viewController = resolver.resolve(CalendarViewController.self)!
        case .timeline:
            viewController = resolver.resolve(TimelineViewController.self)!
        }
        
        return viewController
    }
}
