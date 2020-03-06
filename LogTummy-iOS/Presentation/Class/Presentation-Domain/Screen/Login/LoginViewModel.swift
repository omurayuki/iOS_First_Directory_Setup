import Foundation
import RxSwift
import RxCocoa
import UIKit

typealias ErrorAndCompleteLoginViewModelProtocol = ErrorViewModelProtocol & CompleteViewModelProtocol

protocol LoginViewModelProtocol: ErrorAndCompleteLoginViewModelProtocol {
    
    func oAuthLogin(presentingForm: UIViewController?)
    func getTWUserBusinessModel() -> Observable<TWUserBusinessModel?>
}

final class LoginViewModel: LoginViewModelProtocol {
    
    private let usecase: LoginUsecaseProtocol & ErrorUsecaseProtocol & CompleteUsecaseProtocol
    
    private let errorSubject: BehaviorSubject<Error?> = BehaviorSubject(value: nil)
    private let completeSubject: BehaviorSubject<Bool?> = BehaviorSubject(value: nil)
    private let disposeBag: DisposeBag = DisposeBag()

    init(usecase: LoginUsecaseProtocol & ErrorUsecaseProtocol & CompleteUsecaseProtocol) {
        self.usecase = usecase
        bindUsecase()
    }
    
    private func bindUsecase() {
        
        usecase.error
            .bind(to: errorSubject)
            .disposed(by: disposeBag)
        
        usecase.complete
            .bind(to: completeSubject)
            .disposed(by: disposeBag)
    }
    
    func oAuthLogin(presentingForm: UIViewController?) {
        return usecase.oAuthLogin(presentingForm: presentingForm)
    }
    
    func getTWUserBusinessModel() -> Observable<TWUserBusinessModel?> {
        return usecase.getTWUserBusinessModel()
    }
}

extension LoginViewModel {
    
    var error: Observable<Error?> {
        return errorSubject.asObservable()
    }
    
    var complete: Observable<Bool?> {
        return completeSubject.asObservable()
    }
}
