import UIKit

@IBDesignable
open class IBDesignableTextField: UITextField {
    public override init(frame: CGRect) {
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

open class PaddingTextField: IBDesignableTextField {

    static let defaultPadding = UIMarginResource.small

    /*
     MARK: - Padding Adjustment
     */
    @IBInspectable var padding: CGFloat = defaultPadding {
        didSet {
            self.paddingRect = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        }
    }

    @IBInspectable var paddingRect: UIEdgeInsets = UIEdgeInsets(top: defaultPadding, left: defaultPadding, bottom: defaultPadding, right: defaultPadding) {
        didSet {
            self.setNeedsLayout()
        }
    }

    /*
     MARK: - Layout
     */
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: paddingRect)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: paddingRect)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: paddingRect)
    }
}
