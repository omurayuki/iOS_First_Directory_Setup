import UIKit
import Firebase
import SwifteriOS
import RxSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        #if DEBUG
            let filePath = Bundle.main.path(forResource: "GoogleService-debug-Info", ofType: "plist")
        #else
            let filePath = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist")
        #endif
        let options = FirebaseOptions(contentsOfFile: filePath!)
        FirebaseApp.configure(options: options!)
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        self.window = window
        window.rootViewController = Inject.createInjectedStoryboardWithViewController(name: LoginViewController.className)
        
        return true
    }
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
            return Swifter.handleOpenURL(url, callbackURL: URL(string: "swifter-sqOi4qeOAFWf9kJwNw5RkveM6://")!)
    }
}
