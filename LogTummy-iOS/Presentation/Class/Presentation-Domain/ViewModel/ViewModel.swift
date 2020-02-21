import Foundation

protocol ViewModelProtocol {
    
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}

class ViewModel<Input, Output>: ViewModelProtocol {
    
    init<X: ViewModelProtocol>(_ base: X) where X.Input == Input, X.Output == Output
    {
        _transform = { base.transform(input: $0) }
    }
    
    func transform(input: Input) -> Output {
        _transform(input)
    }
    
    private let _transform: (Input) -> Output
}
