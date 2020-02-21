import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    
    final class ViewModelAssembly: Assembly {
        
        func assemble(container: Container) {
            container.register(LoginViewModelProtocol.self) {
                let usecase = $0.resolve(LoginUsecaseProtocol.self)!
                return LoginViewModel(usecase: usecase)
            }
        }
    }
}
