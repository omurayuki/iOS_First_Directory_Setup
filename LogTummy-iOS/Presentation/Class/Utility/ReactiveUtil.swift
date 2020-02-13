import RxCocoa
import RxSwift
import UIKit

extension Reactive where Base: UILabel {
    
    var isTextEmpty: Driver<Bool> {
        return observe(String.self, #keyPath(UILabel.text)).asDriver(onErrorJustReturn: nil)
            .map { text in
                guard let text = text else { return false }
                return !text.isEmpty
            }
    }
    
    var observeText: Driver<String> {
        return observe(String.self, #keyPath(UILabel.text)).asDriver(onErrorJustReturn: nil)
            .map { text in
                guard let text = text else { return "" }
                return text
            }
    }
}
