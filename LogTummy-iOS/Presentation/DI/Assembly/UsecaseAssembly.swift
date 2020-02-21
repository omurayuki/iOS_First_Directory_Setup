import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    
    final class UsecaseAssembly: Assembly {
        
        func assemble(container: Container) {
            container.register(LoginUsecaseProtocol.self) {
                let loginDataManager = $0.resolve(LoginDataManagerProtocol.self)!
                return LoginUsecase(loginDataManager: loginDataManager)
            }
        }
    }
}
