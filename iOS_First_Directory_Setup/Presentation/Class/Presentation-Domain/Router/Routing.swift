import UIKit

protocol Routing {
    
    var router: Router { get }
}

extension Routing {
    
    var router: Router {
        Router()
    }
}
