import Swinject

final class RoutingAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(LoginRoutingProtocol.self) { _ in
            return LoginRouting()
        }
        
        container.register(RootTabBarRoutingProtocol.self) { _ in
            return RootTabBarRouting()
        }
        
        container.register(TweetLogRoutingProtocol.self) { _ in
            return TweetLogRouting()
        }
    }
}
