import UIKit

extension Resources {
    
    static var ViewControllers: ViewController {
        ViewController()
    }
    
    struct ViewController {
        
        var App: AppControllers {
            AppControllers()
        }

        struct AppControllers {
            
            func entrance() -> EntranceViewController {
                let vc = EntranceViewController()
                vc.routing = EntranceRouting()
                return vc
            }
        }
    }
}
