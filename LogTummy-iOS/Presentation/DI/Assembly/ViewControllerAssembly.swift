import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    
    final class ViewControllerAssembly: Assembly {
        
        func assemble(container: Container) {
            container.storyboardInitCompleted(LoginViewController.self) {
                $1.viewModel = $0.resolve(LoginViewModelProtocol.self)
            }
        }
    }
}
