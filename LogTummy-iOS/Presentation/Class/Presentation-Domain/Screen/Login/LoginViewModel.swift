import Foundation
import RxSwift
import RxCocoa

final class LoginViewModel: ViewModel {
    
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
