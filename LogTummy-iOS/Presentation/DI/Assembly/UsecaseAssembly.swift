import Swinject

final class UsecaseAssembly: Assembly {

    func assemble(container: Container) {
        container.register(LoginUsecaseProtocol.self) { _ in
            let loginDataManager = container.resolve(LoginDataManagerProtocol.self)!
            return LoginUsecase(loginDataManager: loginDataManager)
        }
    }
}
