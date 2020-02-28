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
            
//            func RootTabBar() -> RootTabBarController {
//                .createInstance()
//            }
            
            func Login() -> LoginViewController {
                guard let vc = resolver.resolve(LoginViewController.self) else {
                    Logger.error("can't instantiate \(LoginViewController.self)")
                    fatalError()
                }
                return vc
            }
            
            func calendar() -> CalendarViewController {
                guard let vc = resolver.resolve(CalendarViewController.self) else {
                    Logger.error("can't instantiate \(CalendarViewController.self)")
                    fatalError()
                }
                return vc
            }
            
            func timeline() -> TimelineViewController {
                guard let vc = resolver.resolve(TimelineViewController.self) else {
                    Logger.error("can't instantiate \(TimelineViewController.self)")
                    fatalError()
                }
                return vc
            }
        }
    }
}
