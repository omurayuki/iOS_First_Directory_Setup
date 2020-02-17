import UIKit

@IBDesignable
open class IBDesignableLabel: UILabel {
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    open func commonInit() {
        #if TARGET_INTERFACE_BUILDER
        self.setNeedsLayout()
        self.setNeedsDisplay()
        #endif
    }
}


@IBDesignable
open class PaddingLabel: IBDesignableLabel {

    @IBInspectable open var topInset: CGFloat = 5.0 { didSet { self.setNeedsInvalidateMetrics() } }
    @IBInspectable open var bottomInset: CGFloat = 5.0 { didSet { self.setNeedsInvalidateMetrics() } }
    @IBInspectable open var leftInset: CGFloat = 7.0 { didSet { self.setNeedsInvalidateMetrics() } }
    @IBInspectable open var rightInset: CGFloat = 7.0 { didSet { self.setNeedsInvalidateMetrics() } }

    open func setNeedsInvalidateMetrics() {
        self.invalidateIntrinsicContentSize()
        self.setNeedsDisplay()
    }

    /* "Steal" this from: https://stackoverflow.com/questions/21167226/resizing-a-uilabel-to-accommodate-insets */
    override open func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        let insetRect = bounds.inset(by: insets)
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -topInset, left: -leftInset, bottom: -bottomInset, right: -rightInset)
        return textRect.inset(by: invertedInsets)
    }

    override open func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
}
