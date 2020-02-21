import Foundation
import RxSwift
import RxRelay

protocol LoginDataManagerProtocol {
    func hoge()
}

final class LoginDataManager: LoginDataManagerProtocol {
    
    private let remote: LoginRemote = LoginRemote()
    
    func hoge() {
        print("datamanager")
    }
}
