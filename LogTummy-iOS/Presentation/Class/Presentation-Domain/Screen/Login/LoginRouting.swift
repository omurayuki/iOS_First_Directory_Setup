import UIKit

protocol LoginRoutingProtocol: Routing {
    
    func showMainContents(vc: UIViewController)
}

final class LoginRouting: LoginRoutingProtocol {
    
    func showMainContents(vc: UIViewController) {
        router.present(.rootTab, from: vc, presentationStyle: .fullScreen, animated: true, completion: nil)
    }
}
