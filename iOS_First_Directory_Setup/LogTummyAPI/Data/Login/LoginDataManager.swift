import Foundation

protocol LoginDataManagerProtocol { }

final class LoginDataManager: LoginDataManagerProtocol {
    
    private let remote: LoginRemote = LoginRemote()
    private let local: LoginLocal = LoginLocal()
}
