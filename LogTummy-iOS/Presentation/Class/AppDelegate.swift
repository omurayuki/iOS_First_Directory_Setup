import UIKit
import Firebase
import SwifteriOS
import RxSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        AppConfigurator.setupFirebase()
        driveMainInterface()
        return true
    }
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        Logger.info("open web URL")
        return SwifterGeneral.handleOpenURL(url: url)
    }
}

extension AppDelegate {
    
    private func driveMainInterface() {
        #warning("keychain見に行って条件分岐")
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        self.window = window
        window.rootViewController = Inject.createInjectedStoryboardWithViewController(name: LoginViewController.className)
    }
}
