import UIKit
import RxSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private let usecase: AppDelegateUsecaseProtocol = AppDelegateUsecase()
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    override init() {
        usecase.getTWUserToken()
    }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppConfigurator.setupFirebase()
        bindUsecase()
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
    
    private func bindUsecase() {
        usecase.getIsExistTWUserToken()
            .subscribe(onNext: { [weak self] isExistTWUserKey in
                isExistTWUserKey ?
                    self?.drive(to: LoginViewController.className) :
                    self?.drive(to: LoginViewController.className)
            })
            .disposed(by: disposeBag)
    }
    
    private func drive(to firstInterface: String) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        self.window = window
        window.rootViewController = Inject.createInjectedStoryboardWithViewController(name: firstInterface)
    }
}
