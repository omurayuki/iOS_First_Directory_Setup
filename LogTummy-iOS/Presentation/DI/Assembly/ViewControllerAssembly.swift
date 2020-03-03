import Swinject
import SwinjectStoryboard

final class ViewControllerAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(LoginViewController.self) { r in
            let vc = SwinjectStoryboard.create(vc: LoginViewController.self)
            vc.viewModel = r.resolve(LoginViewModelProtocol.self)
            vc.routing = r.resolve(LoginRoutingProtocol.self)
            return vc
        }
        
        container.register(RootTabBarController.self) { r in
            let vc = SwinjectStoryboard.create(vc: RootTabBarController.self)
            vc.routing = r.resolve(RootTabBarRoutingProtocol.self)
            return vc
        }
        
        container.register(TweetLogViewController.self) { _ in
            let vc = SwinjectStoryboard.create(vc: TweetLogViewController.self)
            return vc
        }
        
        container.register(TimelineViewController.self) { _ in
            let vc = SwinjectStoryboard.create(vc: TimelineViewController.self)
            return vc
        }
    }
}

extension SwinjectStoryboard {
    
    static func create<T: UIViewController>(vc type: T.Type) -> T {
        /**
         https://github.com/Swinject/Swinject/issues/218
         Currently it does not work well with SwinjectStoryboard, as discussed in #213
         Simplest workaround for now would be to disable this feature by setting `Container.loggingFunction = nil`
         */
        Container.loggingFunction = nil
        
        let name = type.className
        let storyboard = SwinjectStoryboard.create(name: name, bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: name) as? T else {
            Logger.error("can't instantiate \(name)")
            fatalError()
        }
        return vc
    }
}
