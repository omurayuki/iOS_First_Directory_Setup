import Foundation
import RxSwift
import RxCocoa

protocol LoginViewModelProtocol { }

final class LoginViewModel: LoginViewModelProtocol, ViewModel {
    
}

extension LoginViewModel {
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(input: Input) -> Output {
        print("inject成功")
        return Output()
    }
}
