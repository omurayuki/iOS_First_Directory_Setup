import Swinject

final class ViewModelAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(LoginViewModelProtocol.self) { _ in
            let usecase = container.resolve(LoginUsecaseProtocol.self)!
            return LoginViewModel(usecase: usecase)
        }
        
        container.register(TweetLogViewModelProtocol.self) { _ in
            let usecase = container.resolve(TweetLogUsecaseProtocol.self)!
            return TweetLogViewModel(usecase: usecase)
        }
    }
}
