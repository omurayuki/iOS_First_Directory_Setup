import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    
    final class RoutingAssembly: Assembly {
        
        func assemble(container: Container) {
            container.register(LoginRoutingProtocol.self) { _ in
                return LoginRouting()
            }
        }
    }
}
