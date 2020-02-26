import Foundation
import RxSwift
import RxCocoa

protocol AppDelegateUsecaseProtocol {
    
    var isExistTWUserToken: BehaviorRelay<Bool> { get }
    
    func getTWUserToken()
    func getIsExistTWUserToken() -> Observable<Bool>
}

final class AppDelegateUsecase: AppDelegateUsecaseProtocol {
    
    private let appDelegateDataManager: AppDelegateDataManagerProtocol = AppDelegateDataManager()
    
    private(set) var isExistTWUserToken: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    func getTWUserToken() {
        appDelegateDataManager.getTWUserToken()
            .subscribe(onSuccess: { [weak self] key in
                if let key = key, !key.isEmpty {
                    self?.isExistTWUserToken.accept(true)
                } else {
                    self?.isExistTWUserToken.accept(false)
                }
            })
            .disposed(by: disposeBag)
    }
    
    func getIsExistTWUserToken() -> Observable<Bool> {
        return isExistTWUserToken.asObservable()
    }
}
