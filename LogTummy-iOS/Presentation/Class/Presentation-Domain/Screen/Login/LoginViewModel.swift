import Foundation
import RxSwift
import RxCocoa

protocol LoginViewModelProtocol: ViewModelProtocol {
}

final class LoginViewModel: LoginViewModelProtocol {
    
}

extension LoginViewModel {
    
    final class InputInherits: Input {
        
    }
    
    final class OutputInherits: Output {
        
    }
    
    func transform(input: Input) -> Output {
        return Output()
    }
}
