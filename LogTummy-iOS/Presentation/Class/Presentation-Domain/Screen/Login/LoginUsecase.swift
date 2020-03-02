import RxSwift
import RxCocoa
import UIKit

typealias ErrorAndCompleteLoginUsecaseProtocol = ErrorUsecaseProtocol & CompleteUsecaseProtocol

protocol LoginUsecaseProtocol: ErrorAndCompleteLoginUsecaseProtocol {
    
    func oAuthLogin(presentingForm: UIViewController?)
    func getTWUserBusinessModel() -> Observable<TWUserBusinessModel?>
}

final class LoginUsecase: LoginUsecaseProtocol {
    
    private let loginDataManager: LoginDataManagerProtocol
    
    private var twuserBusinessModel: BehaviorRelay<TWUserBusinessModel?> = BehaviorRelay(value: nil)
    
    private let errorSubject: BehaviorSubject<Error?> = BehaviorSubject(value: nil)
    private let completeSubject: BehaviorSubject<Bool?> = BehaviorSubject(value: nil)
    private let disposeBag: DisposeBag = DisposeBag()
    
    init(loginDataManager: LoginDataManagerProtocol) {
        self.loginDataManager = loginDataManager
    }
    
    func oAuthLogin(presentingForm: UIViewController?) {
        loginDataManager.oAuthLogin(presentingForm: presentingForm)
            .subscribe(onSuccess: { [weak self] entity in
                let businessModel = TWUserBusinessModel(verifier: entity.verifier, screenName: entity.screenName, userId: entity.userId)
                self?.twuserBusinessModel.accept(businessModel)
                self?.completeSubject.onNext(true)
            }) { error in
                let mappedError = self.mapSwifterError(error: error)
                self.errorSubject.onNext(mappedError)
                self.completeSubject.onNext(false)
            }.disposed(by: disposeBag)
    }
    
    func getTWUserBusinessModel() -> Observable<TWUserBusinessModel?> {
        return twuserBusinessModel.asObservable()
    }
}

extension LoginUsecase {
    
    var error: Observable<Error?> {
        return errorSubject.asObservable()
    }
    
    var complete: Observable<Bool?> {
        return completeSubject.asObserver()
    }
}
