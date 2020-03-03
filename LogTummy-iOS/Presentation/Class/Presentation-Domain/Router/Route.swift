import UIKit

protocol VisibleTitle {
    
    typealias Title = String
    
    func getVisibleTitle() -> Title
}

enum Route {
    
    case login
    case rootTab
    case calendar
    case timeline
    
    func viewController() -> UIViewController {
        
        let viewController: UIViewController
        
        switch self {
        case .login:
            viewController = Resources.ViewControllers.App.Login()
        case .rootTab:
            viewController = Resources.ViewControllers.App.RootTabBar()
        case .calendar:
            viewController = Resources.ViewControllers.App.tweetLog()
        case .timeline:
            viewController = Resources.ViewControllers.App.timeline()
        }
        
        return viewController
    }
}

extension Route: VisibleTitle {
    
    typealias Title = StringResources.Application.Title
    func getVisibleTitle() -> String {
        let title: String
        
        switch self {
        case .login:
            title = Title.titleLogin
        case .rootTab:
            title = String.blank
        case .calendar:
            title = Title.titleCalendar
        case .timeline:
            title = Title.titleTimeline
        }
        
        return title
    }
}
