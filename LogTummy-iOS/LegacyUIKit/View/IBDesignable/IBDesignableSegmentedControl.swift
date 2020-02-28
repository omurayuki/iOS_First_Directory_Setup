import UIKit

@IBDesignable
extension UISegmentedControl {}

open class IBDesignableSegmentedControl: UISegmentedControl {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()
    }

    override public init(items: [Any]?) {
        super.init(items: items)
        commonInit()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    open func commonInit() {
        #if TARGET_INTERFACE_BUILDER
        setNeedsLayout()
        setNeedsDisplay()
        #endif
    }
}
