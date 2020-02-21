import RxSwift
import RxCocoa

protocol LoginUsecaseProtocol {
    
    func hoge()
}

final class LoginUsecase: LoginUsecaseProtocol {
    
    private let loginDataManager: LoginDataManagerProtocol
    
    init(loginDataManager: LoginDataManagerProtocol) {
        self.loginDataManager = loginDataManager
    }
    
    func hoge() {
        loginDataManager.hoge()
    }
}
