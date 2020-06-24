import Foundation
import KeychainAccess

class MobileAuth {
    
    private var keychain: Keychain {
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
        do {
            try keychain.set(key, key: Config.keychainKeys.userKey)
        } catch {
            Logger.error("can't set \(Config.keychainKeys.userKey)")
        }
    }
    
    func setUserSecret(secret: String) {
        do {
            try keychain.set(secret, key: Config.keychainKeys.userSecret)
        } catch {
            Logger.error("can't set \(Config.keychainKeys.userSecret)")
        }
    }
    
    func setVerifier(verifier: String?) {
        guard let verifier = verifier else { return }
        do {
            try keychain.set(verifier, key: Config.keychainKeys.verifier)
        } catch {
            Logger.error("can't set \(Config.keychainKeys.verifier)")
        }
    }
    
    func setScreenName(screenName: String?) {
        guard let screenName = screenName else { return }
        do {
            try keychain.set(screenName, key: Config.keychainKeys.screenName)
        } catch {
            Logger.error("can't set \(Config.keychainKeys.screenName)")
        }
    }
    
    func setUserId(userId: String?) {
        guard let userId = userId else { return }
        do {
            try keychain.set(userId, key: Config.keychainKeys.userId)
        } catch {
            Logger.error("can't set \(Config.keychainKeys.userId)")
        }
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
        do {
            try keychain.remove(Config.keychainKeys.userKey)
        } catch {
            Logger.error("can't remove \(Config.keychainKeys.userKey)")
        }
    }
    
    func removeUserSecret() {
        do {
            try keychain.remove(Config.keychainKeys.userSecret)
        } catch {
            Logger.error("can't remove \(Config.keychainKeys.userSecret)")
        }
    }
    
    func removeVerifier() {
        do {
            try keychain.remove(Config.keychainKeys.verifier)
        } catch {
            Logger.error("can't remove \(Config.keychainKeys.verifier)")
        }
    }
    
    func removeScreenName() {
        do {
            try keychain.remove(Config.keychainKeys.screenName)
        } catch {
            Logger.error("can't remove \(Config.keychainKeys.screenName)")
        }
    }
    
    func removeUserId() {
        do {
            try keychain.remove(Config.keychainKeys.userId)
        } catch {
            Logger.error("can't remove \(Config.keychainKeys.userId)")
        }
    }
}
