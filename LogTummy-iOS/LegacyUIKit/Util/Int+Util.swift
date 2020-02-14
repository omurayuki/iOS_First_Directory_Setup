import Foundation

public extension Int {
    func boolValue() -> Bool {
        return self == 1
    }
}

public extension Optional where Wrapped == Int {
    var orZero: Int {
        return self ?? 0
    }
}
