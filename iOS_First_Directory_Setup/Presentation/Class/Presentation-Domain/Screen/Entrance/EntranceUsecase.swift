import Foundation

protocol EntranceUsecaseProtocol { }

final class EntranceUsecase: EntranceUsecaseProtocol {
    
    private let loginDataManager: EntranceDataManagerProtocol
    
    init(loginDataManager: EntranceDataManagerProtocol) {
        self.loginDataManager = loginDataManager
    }
}
