import UIKit

protocol EntranceRoutingProtocol: Routing {
    
    func fuga(vc: UIViewController)
}

final class EntranceRouting: EntranceRoutingProtocol {
    
    func fuga(vc: UIViewController) { }
}
