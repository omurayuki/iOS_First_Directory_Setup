import Foundation

protocol LoginUsecaseProtocol { }

final class LoginUsecase: LoginUsecaseProtocol {
    
    private let loginDataManager: LoginDataManagerProtocol
    
    init(loginDataManager: LoginDataManagerProtocol) {
        self.loginDataManager = loginDataManager
    }
}
