import UIKit

protocol LoginRoutingProtocol: Routing {
    
    func fuga(vc: UIViewController)
}

final class LoginRouting: LoginRoutingProtocol {
    
    func fuga(vc: UIViewController) {
        router.present(.calendar, from: vc, presentationStyle: nil, animated: true, completion: nil)
    }
}
