import Swinject
import UIKit
import SwinjectStoryboard

final class ViewControllerAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(LoginViewController.self) { r in
            let storyboard = SwinjectStoryboard.create(name: "LoginViewController", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { fatalError() }
            vc.viewModel = r.resolve(LoginViewModelProtocol.self)
            vc.routing = r.resolve(LoginRoutingProtocol.self)
            return vc
        }
        
        container.register(CalendarViewController.self) { _ in
        let storyboard = SwinjectStoryboard.create(name: "CalendarViewController", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "CalendarViewController") as? CalendarViewController else { fatalError() }
            return vc
        }
        
        container.register(TimelineViewController.self) { _ in
        let storyboard = SwinjectStoryboard.create(name: "TimelineViewController", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "TimelineViewController") as? TimelineViewController else { fatalError() }
            return vc
        }
    }
}
