import UIKit

protocol RouterProtocol {
    func push(_ route: Route, from: UIViewController, animated: Bool)
    func present(_ route: Route, from: UIViewController, presentationStyle: UIModalPresentationStyle?, animated: Bool, completion: (() -> Void)?)
    func dismiss(_ vc: UIViewController, animated: Bool, completion: (() -> Void)?)
}

final class Router: RouterProtocol {
    
    func push(_ route: Route, from: UIViewController, animated: Bool) {
        let destinationVC = route.viewController()
        from.navigationController?.pushViewController(destinationVC, animated: animated)
    }
    
    func present(_ route: Route, from: UIViewController, presentationStyle: UIModalPresentationStyle?, animated: Bool, completion: (() -> Void)?) {
        let destinationVC = route.viewController()
        from.present(destinationVC, animated: animated, completion: completion)
    }
    
    func dismiss(_ vc: UIViewController, animated: Bool, completion: (() -> Void)?) {
        if let nc = vc.navigationController, nc.viewControllers.count > 1 {
            nc.popViewController(animated: animated)
        } else {
            vc.dismiss(animated: animated, completion: completion)
        }
    }
}
