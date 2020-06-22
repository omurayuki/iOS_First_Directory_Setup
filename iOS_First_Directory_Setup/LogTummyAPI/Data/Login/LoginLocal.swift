import Foundation

protocol LoginLocalProtocol { }

final class LoginLocal: LoginLocalProtocol {
    
    func saveUserEntity(entity: TWUserEntity) {
        MobileAuth().setUserData(key: entity.key, secret: entity.secret,
                                 verifier: entity.verifier, screenName: entity.screenName,
                                 userId: entity.userId)
    }
}
