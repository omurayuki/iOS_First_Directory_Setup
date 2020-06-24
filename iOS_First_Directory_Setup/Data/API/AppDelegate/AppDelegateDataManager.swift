import Foundation

protocol AppDelegateDataManagerProtocol { }

final class AppDelegateDataManager: AppDelegateDataManagerProtocol {
    
    private let local: AppDelegateLocal = AppDelegateLocal()
}
