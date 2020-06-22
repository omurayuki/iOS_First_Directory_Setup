import UIKit

protocol Initializable: class { }

extension Initializable {
    /**
     Shared property for dynamic resource lookup.

     - Returns: the classname (without its module).
     */
    static var className: String {
        return String(describing: self)
    }
    
    static var resourceName: String {
        let thisType = type(of: self)
        return String(describing: thisType)
    }
    
    /**
     Shared property for general segue methods.

     - Note: generally, a segue with a certain
     view controller will have its segue named
     to the same as its class. (for now)
     */
    var segueName: String {
        let thisType = type(of: self)
        return String(describing: thisType)
    }

    static var segueName: String {
        return self.className
    }
}
