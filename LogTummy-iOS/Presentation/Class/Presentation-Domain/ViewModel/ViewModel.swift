import Foundation

class Input { }
class Output { }

protocol ViewModelProtocol {
    
    func transform(input: Input) -> Output
}
