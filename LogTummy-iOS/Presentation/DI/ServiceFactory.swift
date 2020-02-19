protocol Resolver {
    func resolve<ServiceType>(_ type: ServiceType.Type) -> ServiceType
}

protocol ServiceFactory {
    associatedtype ServiceType
    
    func resolve(_ resolver: Resolver) -> ServiceType
}

final class AnyServiceFactory {
    private let _resolve: (Resolver) -> Any
    private let _supports: (Any.Type) -> Bool
    
    init<T: ServiceFactory>(_ serviceFactory: T) {
        self._resolve = { resolver -> Any in
            serviceFactory.resolve(resolver)
        }
        self._supports = { $0 == T.ServiceType.self }
    }
    
    func resolve<ServiceType>(_ resolver: Resolver) -> ServiceType {
        return _resolve(resolver) as! ServiceType
    }
    
    func supports<ServiceType>(_ type: ServiceType.Type) -> Bool {
        return _supports(type)
    }
}

struct BasicServiceFactory<ServiceType>: ServiceFactory {
    private let factory: (Resolver) -> ServiceType
    
    init(_ type: ServiceType.Type, factory: @escaping (Resolver) -> ServiceType) {
        self.factory = factory
    }
    
    func resolve(_ resolver: Resolver) -> ServiceType {
        return factory(resolver)
    }
}
