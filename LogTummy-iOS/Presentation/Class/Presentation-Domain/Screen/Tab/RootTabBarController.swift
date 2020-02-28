import Foundation
import UIKit

class RootTabBarController: UITabBarController {
    
    var routing: RootTabBarRoutingProtocol?
    
    override func loadView() {
        super.loadView()
        routing?.setupViewControllers(from: self)
    }
}
