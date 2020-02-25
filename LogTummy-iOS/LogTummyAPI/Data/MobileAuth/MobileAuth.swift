import Foundation
import KeychainAccess

class MobileAuth {
    
    // MARK: - Set
    
    func setUserData(key: String, secret: String, verifier: String?, screenName: String?, userId: String?) {
        setUserKey(key: key)
        setUserSecret(secret: secret)
        setVerifier(verifier: verifier)
        setScreenName(screenName: screenName)
        setUserId(userId: userId)
    }
    
    func setUserKey(key: String) {
        try? Keychain().set(key, key: Config.keychainKeys.userKey)
    }
    
    func setUserSecret(secret: String) {
        try? Keychain().set(secret, key: Config.keychainKeys.userSecret)
    }
    
    func setVerifier(verifier: String?) {
        guard let verifier = verifier else { return }
        try? Keychain().set(verifier, key: Config.keychainKeys.verifier)
    }
    
    func setScreenName(screenName: String?) {
        guard let screenName = screenName else { return }
        try? Keychain().set(screenName, key: Config.keychainKeys.screenName)
    }
    
    func setUserId(userId: String?) {
        guard let userId = userId else { return }
        try? Keychain().set(userId, key: Config.keychainKeys.userId)
    }
    
    // MARK: - Get
    
    func getUserKey() -> String? {
        return try? Keychain().getString(Config.keychainKeys.userKey)
    }
    
    func getUserSecret() -> String? {
        return try? Keychain().getString(Config.keychainKeys.userSecret)
    }
    
    func getVerifier() -> String? {
        return try? Keychain().getString(Config.keychainKeys.verifier)
    }
    
    func getScreenName() -> String? {
        return try? Keychain().getString(Config.keychainKeys.screenName)
    }
    
    func getUserId() -> String? {
        return try? Keychain().getString(Config.keychainKeys.userId)
    }
    
    // MARK: - Remove
    func removeUserData() {
        removeUserKey()
        removeUserSecret()
        removeVerifier()
        removeScreenName()
        removeUserId()
    }
    
    func removeUserKey() {
        try? Keychain().remove(Config.keychainKeys.userKey)
    }
    
    func removeUserSecret() {
        try? Keychain().remove(Config.keychainKeys.userSecret)
    }
    
    func removeVerifier() {
        try? Keychain().remove(Config.keychainKeys.verifier)
    }
    
    func removeScreenName() {
        try? Keychain().remove(Config.keychainKeys.screenName)
    }
    
    func removeUserId() {
        try? Keychain().remove(Config.keychainKeys.userId)
    }
}
