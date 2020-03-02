import UIKit

protocol RouterProtocol {
    func push(_ route: Route, from: UIViewController, animated: Bool)
    func present(_ route: Route, from: UIViewController, presentationStyle: UIModalPresentationStyle?, animated: Bool, completion: (() -> Void)?)
    func dismiss(_ vc: UIViewController, animated: Bool, completion: (() -> Void)?)
    func setupViewControllers(_ routes: [Route], from: UITabBarController)
    func initialWindow(_ route: Route, window: UIWindow)
}

final class Router: RouterProtocol {
    
    func push(_ route: Route, from: UIViewController, animated: Bool) {
        let destinationVC = route.viewController()
        from.navigationController?.pushViewController(destinationVC, animated: animated)
    }
    
    func present(_ route: Route, from: UIViewController, presentationStyle: UIModalPresentationStyle?, animated: Bool, completion: (() -> Void)?) {
        let destinationVC = route.viewController()
        destinationVC.modalPresentationStyle = presentationStyle ?? .none
        from.present(destinationVC, animated: animated, completion: completion)
    }
    
    func dismiss(_ vc: UIViewController, animated: Bool, completion: (() -> Void)?) {
        if let nc = vc.navigationController, nc.viewControllers.count > 1 {
            nc.popViewController(animated: animated)
        } else {
            vc.dismiss(animated: animated, completion: completion)
        }
    }
    
    func setupViewControllers(_ routes: [Route], from: UITabBarController) {
        let viewControllers = routes
            .map {
                TabModel(instance: $0.viewController(),
                         title: $0.getVisibleTitle(),
                         icon: nil)
            }
            .enumerated()
            .map { idx, tab -> UIViewController in
                let tabBarItem = UITabBarItem(title: tab.title,
                                              image: tab.icon,
                                              selectedImage: nil)
                guard let vc = tab.instance else { return UIViewController() }
                vc.tabBarItem = tabBarItem
                return vc
            }
        from.setViewControllers(viewControllers, animated: false)
    }
    
    func initialWindow(_ route: Route, window: UIWindow) {
        let vc = route.viewController()
        window.rootViewController = vc
    }
}
