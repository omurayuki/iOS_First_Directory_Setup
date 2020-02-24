import Foundation

/**
 Credentialな情報なのでコピー量産できないように参照方でもつ
 */
class TWUserEntity {
    
    let key: String
    let secret: String
    let verifier: String?
    let screenName: String?
    let userId: String?
    
    init(key: String, secret: String, verifier: String?, screenName: String?, userId: String?) {
        self.key = key
        self.secret = secret
        self.verifier = verifier
        self.screenName = screenName
        self.userId = userId
    }
}
