import Swinject

final class DataManagerAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(LoginDataManagerProtocol.self) { _ in
            LoginDataManager()
        }
    }
}
