import UIKit

@IBDesignable
open class IBDesignableView: UIView {

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

    public init() {
        super.init(frame: CGRect.zero)
        self.commonInit()
    }

    open func commonInit() {
        #if TARGET_INTERFACE_BUILDER
        self.setNeedsLayout()
        self.setNeedsDisplay()
        #endif
    }
}

open class DrawableUIView: IBDesignableView {

    typealias Drawable
        = (_ rect: CGRect, _ self: DrawableUIView) -> Void

    var paint: Drawable = { _,_ in }
    var paintsAll: Bool = false

    override open func draw(_ rect: CGRect) {
        if !paintsAll {
            super.draw(rect)
        }
        self.paint(rect, self)
    }
}
