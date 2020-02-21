import Foundation
import RxSwift
import RxCocoa

protocol LoginViewModelProtocol {
    func transform()
}

final class LoginViewModel: LoginViewModelProtocol, ViewModelProtocol {
    
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
    
    func transform() {
        print("injectinject!!")
    }
}
