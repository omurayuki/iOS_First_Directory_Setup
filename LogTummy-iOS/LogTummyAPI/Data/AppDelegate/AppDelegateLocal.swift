import Foundation
import RxSwift

typealias TWUserKey = String

protocol AppDelegateLocalProtocol {
    
    func getTWUserToken() -> TWUserKey
}

final class AppDelegateLocal: AppDelegateLocalProtocol {
    
    func getTWUserToken() -> TWUserKey {
        guard let key = MobileAuth().getUserKey() else { return String.blank }
        return key
    }
}
