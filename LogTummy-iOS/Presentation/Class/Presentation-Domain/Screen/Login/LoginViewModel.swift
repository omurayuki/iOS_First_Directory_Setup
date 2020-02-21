import Foundation
import RxSwift
import RxCocoa

protocol LoginViewModelProtocol {
    
    func hoge()
}

final class LoginViewModel: LoginViewModelProtocol {
    
    private let usecase: LoginUsecaseProtocol

    init(usecase: LoginUsecaseProtocol) {
        self.usecase = usecase
    }
    
    func hoge() {
        usecase.hoge()
    }
}
