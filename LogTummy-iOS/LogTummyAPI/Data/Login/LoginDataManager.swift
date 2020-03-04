import Foundation
import RxSwift
import RxRelay
import UIKit

protocol LoginDataManagerProtocol {
    func oAuthLogin(presentingForm: UIViewController?) -> Single<TWUserEntity>
}

final class LoginDataManager: LoginDataManagerProtocol {
    
    private let remote: LoginRemoteProtocol = LoginRemote()
    private let local: LoginLocalProtocol = LoginLocal()
    
    func oAuthLogin(presentingForm: UIViewController?) -> Single<TWUserEntity> {
        return remote.oAuthLogin(presentingForm: presentingForm)
            .do(onSuccess: { [weak self] entity in
                self?.local.saveUserEntity(entity: entity)
            })
    }
}
