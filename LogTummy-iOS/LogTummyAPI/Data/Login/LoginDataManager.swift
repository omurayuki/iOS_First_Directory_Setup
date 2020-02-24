import Foundation
import RxSwift
import RxRelay
import UIKit

protocol LoginDataManagerProtocol {
    func oAuthLogin(presentingForm: UIViewController?) -> Single<TWUserEntity>
}

final class LoginDataManager: LoginDataManagerProtocol {
    
    private let remote: LoginRemote = LoginRemote()
    
    func oAuthLogin(presentingForm: UIViewController?) -> Single<TWUserEntity> {
        return remote.oAuthLogin(presentingForm: presentingForm)
            .do(onSuccess: { entity in
                print(entity)
            })
    }
}
