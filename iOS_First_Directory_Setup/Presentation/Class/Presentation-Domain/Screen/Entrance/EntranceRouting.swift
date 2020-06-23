import UIKit

protocol EntranceRoutingProtocol: Routing {
    
    func fuga(vc: UIViewController)
}

final class LoginRouting: EntranceRoutingProtocol {
    
    func fuga(vc: UIViewController) { }
}
