import Foundation
import RxSwift
import RxCocoa

protocol LoginViewModelProtocol {
}

final class LoginViewModel: LoginViewModelProtocol {
    
    private var usecase: LoginUsecaseProtocol?
}
