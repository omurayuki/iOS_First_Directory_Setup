import RxSwift
import UIKit

protocol VCInjectable {
    
    associatedtype Routing
    associatedtype ViewModel
    
    var routing: Routing? { get set }
    var viewModel: ViewModel? { get set }
    var disposeBag: DisposeBag! { get set }
    
    func setupConfig()
    
    mutating func inject(
        routing: Routing?,
        viewModel: ViewModel?,
        disposeBag: DisposeBag)
}

extension VCInjectable where Self: UIViewController {
    
    mutating func inject(
        routing: Routing? = nil,
        viewModel: ViewModel? = nil,
        disposeBag: DisposeBag) {
        self.routing = routing
        self.viewModel = viewModel
        self.disposeBag = disposeBag
    }
}
