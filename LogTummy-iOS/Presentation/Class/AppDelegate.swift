import UIKit
import Firebase
import SwifteriOS
import RxSwift
import Swinject
import SwinjectStoryboard

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var container: Container = {
        let container = Container()
        container.storyboardInitCompleted(LoginViewController.self) {
            $1.viewModel = $0.resolve(LoginViewModelProtocol.self)
        }
        container.register(LoginViewModelProtocol.self) { _ in LoginViewModel() }
        return container
    }()

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
        let storyboard = SwinjectStoryboard.create(name: "LoginViewController", bundle: nil, container: container)
        window.rootViewController = storyboard.instantiateInitialViewController()
        
        return true
    }
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
            return Swifter.handleOpenURL(url, callbackURL: URL(string: "swifter-sqOi4qeOAFWf9kJwNw5RkveM6://")!)
    }
}
