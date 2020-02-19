import RxSwift
import UIKit

struct Container: Resolver {
    
    let factories: [AnyServiceFactory]
    
    init() {
        self.factories = []
    }
    
    private init(factories: [AnyServiceFactory]) {
        self.factories = factories
    }
    
    func register<T>(_ interface: T.Type, instance: T) -> Container {
        return register(interface) { _ in instance }
    }
    
    func register<ServiceType>(_ type: ServiceType.Type, _ factory: @escaping (Resolver) -> ServiceType) -> Container {
        assert(!factories.contains(where: { $0.supports(type) }))
        
        let newFactory = BasicServiceFactory<ServiceType>(type, factory: { resolver in
            factory(resolver)
        })
        return .init(factories: factories + [AnyServiceFactory(newFactory)])
    }
    
    func resolve<ServiceType>(_ type: ServiceType.Type) -> ServiceType {
        guard let factory = factories.first(where: { $0.supports(type) }) else {
            fatalError("No suitable factory found")
        }
        return factory.resolve(self)
    }
    
    func factory<ServiceType>(for type: ServiceType.Type) -> () -> ServiceType {
        guard let factory = factories.first(where: { $0.supports(type) }) else {
            fatalError("No suitable factory found")
        }
        
        return { factory.resolve(self) }
    }
}
