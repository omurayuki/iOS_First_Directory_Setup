import Foundation
import UIKit

protocol LoginViewModelProtocol { }

final class LoginViewModel: LoginViewModelProtocol {
    
    private let usecase: LoginUsecaseProtocol

    init(usecase: LoginUsecaseProtocol) {
        self.usecase = usecase
    }
}
