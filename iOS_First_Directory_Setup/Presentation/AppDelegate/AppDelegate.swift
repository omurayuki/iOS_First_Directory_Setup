import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private let usecase: AppDelegateUsecaseProtocol = AppDelegateUsecase()
    private let router: Router = Router()
    
    override init() { }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppConfigurator.setupFirebase()
        return true
    }
}
