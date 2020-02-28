import Foundation
import RxSwift

protocol LoginLocalProtocol {
    
    func saveUserEntity(entity: TWUserEntity)
}

final class LoginLocal: LoginLocalProtocol {
    
    func saveUserEntity(entity: TWUserEntity) {
        MobileAuth().setUserData(key: entity.key, secret: entity.secret,
                                 verifier: entity.verifier, screenName: entity.screenName,
                                 userId: entity.userId)
    }
}
