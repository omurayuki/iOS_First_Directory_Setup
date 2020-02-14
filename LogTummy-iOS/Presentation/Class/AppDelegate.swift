import UIKit
import Firebase

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
        
        return true
    }
}
