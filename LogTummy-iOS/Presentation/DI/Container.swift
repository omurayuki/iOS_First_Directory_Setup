import Swinject
import SwinjectStoryboard

extension Container {
    
    static let shared = assembler.resolver
    
    private static let assembler = Assembler([
        DataManagerAssembly(),
        UsecaseAssembly(),
        ViewModelAssembly(),
        RoutingAssembly(),
        ViewControllerAssembly()
    ])
}

var resolver: Resolver {
    return Container.shared
}
