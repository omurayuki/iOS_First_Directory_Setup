import Foundation
import UIKit

/**
 Convenience Function to Convert Int <-> CGFloat
 */
public extension Int {
    var cgFloatValue: CGFloat {
        return CGFloat(self)
    }
    var absoluteValue: Int {
        return abs(self)
    }
    var uIntValue: UInt {
        return UInt(self.absoluteValue)
    }
}

public extension UInt {
    var cgFloatValue: CGFloat {
        return CGFloat(self)
    }
    var intValue: Int {
        return Int(self)
    }
}

public extension Float {
    var intValue: Int {
        return Int(self)
    }
    var absoluteValue: Float {
        return abs(self)
    }
}

public extension CGFloat {
    var intValue: Int {
        return Int(self)
    }
    var uIntValue: UInt {
        let isNonNormal: Bool = (self.isNaN || self.isInfinite || self.isSubnormal || self < 0.0)
        return UInt(isNonNormal ? 0 : self)
    }
    var absoluteValue: CGFloat {
        return abs(self)
    }
}

public extension Bool {
    var intValue: Int {
        switch self {
        case true:
            return 1
        case false:
            return 0
        }
    }
}

func max<T: Comparable>(_ a: T?, _ b: T?) -> T? {
    guard let a = a, let b = b else {
        return nil
    }
    return max(a, b)
}

func min<T: Comparable>(_ a: T?, _ b: T?) -> T? {
    guard let a = a, let b = b else {
        return nil
    }
    return min(a, b)
}
