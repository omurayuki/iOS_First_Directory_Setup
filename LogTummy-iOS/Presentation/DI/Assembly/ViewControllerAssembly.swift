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
        
        container.register(CalendarViewController.self) { _ in
            let vc = SwinjectStoryboard.create(vc: CalendarViewController.self)
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
        let name = type.className
        let storyboard = SwinjectStoryboard.create(name: name, bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: name) as? T else {
            Logger.error("can't instantiate \(name)")
            fatalError()
        }
        return vc
    }
}
