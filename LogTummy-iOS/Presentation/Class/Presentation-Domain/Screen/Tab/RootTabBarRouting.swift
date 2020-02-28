import UIKit

protocol RootTabBarRoutingProtocol: Routing {
    
    func setupViewControllers(from: UITabBarController)
}

final class RootTabBarRouting: RootTabBarRoutingProtocol {
    
    func setupViewControllers(from: UITabBarController) {
        router.setupViewControllers([.calendar, .timeline], from: from)
    }
}
