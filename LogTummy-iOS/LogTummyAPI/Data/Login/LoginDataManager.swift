import Foundation
import RxSwift
import RxRelay

protocol LoginDataManagerProtocol { }

final class LoginDataManager: LoginDataManagerProtocol {
    
    private let remote: LoginRemote = LoginRemote()
}
