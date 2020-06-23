import Foundation
import UIKit

protocol EntranceViewModelProtocol { }

final class LoginViewModel: EntranceViewModelProtocol {
    
    private let usecase: EntranceUsecaseProtocol

    init(usecase: EntranceUsecaseProtocol) {
        self.usecase = usecase
    }
}
