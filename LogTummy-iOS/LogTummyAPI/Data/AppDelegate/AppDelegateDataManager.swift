import Foundation
import RxSwift
import RxRelay
import UIKit

protocol AppDelegateDataManagerProtocol {
    
    func getTWUserToken() -> Single<TWUserKey?>
}

final class AppDelegateDataManager: AppDelegateDataManagerProtocol {
    
    private let local: AppDelegateLocal = AppDelegateLocal()
    
    func getTWUserToken() -> Single<TWUserKey?> {
        return Single.create { [weak self] observer -> Disposable in
            let key = self?.local.getTWUserToken()
            observer(.success(key))
            return Disposables.create()
        }
    }
}
