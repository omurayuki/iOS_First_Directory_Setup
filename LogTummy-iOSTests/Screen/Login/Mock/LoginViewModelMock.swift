import UIKit
import RxSwift
@testable import LogTummy_iOS

class LoginUsecaseMock: LoginUsecaseProtocol {
    
    private let errorSubject: BehaviorSubject<Error?> = BehaviorSubject(value: nil)
    
    func oAuthLogin(presentingForm: UIViewController?) { }
    
    func getTWUserBusinessModel() -> Observable<TWUserBusinessModel?> {
        return Observable.create { observer -> Disposable in
            observer.on(.next(TWUserBusinessModel(verifier: "verifier",
                                                  screenName: "screenName",
                                                  userId: "12345")))
            return Disposables.create()
        }
    }
    
    var error: Observable<Error?> {
        return errorSubject.asObserver()
    }
}
