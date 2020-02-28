import Foundation
import UIKit

public struct SizeResources {
    public var Duration: AnimationDurationResource = AnimationDurationResource()
    public var Margins: UIMarginResource = UIMarginResource()
    public var timeInterval: DispatchTimeIntervalResource = DispatchTimeIntervalResource()
    public init() {}
}

/**
 MARK: - UI Margins
 */

public struct UIMarginResource {
    /** 0.0 */
    public static var none: CGFloat = 0.00

    /** 2.0 */
    public static var smallest: CGFloat = 2.0

    /** 4.0 */
    public static var smaller: CGFloat = 4.0

    /** 8.0 */
    public static var small: CGFloat = 8.0

    /** 12.0 */
    public static var medium: CGFloat = 12.0

    /** 18.0 */
    public static var large: CGFloat = 18.0

    /** 24.0 */
    public static var larger: CGFloat = 24.0

    /** 32.0 */
    public static var largest: CGFloat = 32.0
    public init() {}
}

/**
 MARK: - Animation Duration
 */

public struct AnimationDurationResource {
    /** 0.00 Sec */
    public var none: TimeInterval = 0.00

    /** 0.01 Sec */
    public var almostNone: TimeInterval = 0.01

    /** 0.035 Sec */
    public var fastest: TimeInterval = 0.035

    /** 0.07 Sec */
    public var faster: TimeInterval = 0.07

    /** 0.15 Sec */
    public var fast: TimeInterval = 0.15

    /** 0.30 Sec */
    public var normal: TimeInterval = 0.3

    /** 0.60 Sec */
    public var slow: TimeInterval = 0.6

    /** 1.2 Sec */
    public var slower: TimeInterval = 1.2

    /** 2.4 Sec */
    public var slowest: TimeInterval = 2.4
    public init() {}
}

public struct DispatchTimeIntervalResource {
    
    public var fast: DispatchTimeInterval = .milliseconds(25)
    
    public var normal: DispatchTimeInterval = .milliseconds(50)
    
    public var slow: DispatchTimeInterval = .milliseconds(75)
    
    #warning("intervalテスト")
}
