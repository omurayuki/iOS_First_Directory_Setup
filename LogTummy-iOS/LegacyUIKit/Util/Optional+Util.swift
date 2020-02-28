import Foundation

extension Optional {
    var isNone: Bool {
        return self == nil
    }
    
    var isSome: Bool {
        return self != nil
    }
}
