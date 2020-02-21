import RxSwift
import RxCocoa

protocol LoginUsecaseProtocol {
    
}

final class LoginUsecase: LoginUsecaseProtocol {
    
    private var loginDataManager: LoginDataManagerProtocol?
}
