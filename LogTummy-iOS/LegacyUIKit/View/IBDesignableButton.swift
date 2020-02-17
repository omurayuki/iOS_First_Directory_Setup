import UIKit

@IBDesignable
extension UIButton {}

open class IBDesignableButton: UIButton {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public convenience init(type buttonType: UIButton.ButtonType) {
        self.init(frame: .zero)
        commonInit()
    }

    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
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
