import Foundation
import KeychainAccess

class MobileAuth {
    
    var keychain: Keychain {
        guard
            let identifier = Bundle.main.object(forInfoDictionaryKey: Config.bundleKeys.bundleIdentifier) as? String
        else { return Keychain(service: String.blank) }
        return Keychain(service: identifier)
    }
    
    // MARK: - Set
    func setUserData(key: String, secret: String, verifier: String?, screenName: String?, userId: String?) {
        setUserKey(key: key)
        setUserSecret(secret: secret)
        setVerifier(verifier: verifier)
        setScreenName(screenName: screenName)
        setUserId(userId: userId)
    }
    
    func setUserKey(key: String) {
        try? keychain.set(key, key: Config.keychainKeys.userKey)
    }
    
    func setUserSecret(secret: String) {
        try? keychain.set(secret, key: Config.keychainKeys.userSecret)
    }
    
    func setVerifier(verifier: String?) {
        guard let verifier = verifier else { return }
        try? keychain.set(verifier, key: Config.keychainKeys.verifier)
    }
    
    func setScreenName(screenName: String?) {
        guard let screenName = screenName else { return }
        try? keychain.set(screenName, key: Config.keychainKeys.screenName)
    }
    
    func setUserId(userId: String?) {
        guard let userId = userId else { return }
        try? keychain.set(userId, key: Config.keychainKeys.userId)
    }
    
    // MARK: - Get
    func getUserKey() -> String? {
        return try? keychain.getString(Config.keychainKeys.userKey)
    }
    
    func getUserSecret() -> String? {
        return try? keychain.getString(Config.keychainKeys.userSecret)
    }
    
    func getVerifier() -> String? {
        return try? keychain.getString(Config.keychainKeys.verifier)
    }
    
    func getScreenName() -> String? {
        return try? keychain.getString(Config.keychainKeys.screenName)
    }
    
    func getUserId() -> String? {
        return try? keychain.getString(Config.keychainKeys.userId)
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
        try? keychain.remove(Config.keychainKeys.userKey)
    }
    
    func removeUserSecret() {
        try? keychain.remove(Config.keychainKeys.userSecret)
    }
    
    func removeVerifier() {
        try? keychain.remove(Config.keychainKeys.verifier)
    }
    
    func removeScreenName() {
        try? keychain.remove(Config.keychainKeys.screenName)
    }
    
    func removeUserId() {
        try? keychain.remove(Config.keychainKeys.userId)
    }
}
