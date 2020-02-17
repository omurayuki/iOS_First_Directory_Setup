import UIKit

@IBDesignable
open class IBDesignableCollectionViewCell: UICollectionViewCell {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()
    }

    public init() {
        super.init(frame: CGRect.zero)
        self.commonInit()
    }

    open func commonInit() {
        #if TARGET_INTERFACE_BUILDER
        self.backgroundColor = .clear
        setNeedsLayout()
        setNeedsDisplay()
        #endif
    }
}

open class IBDesignableCollectionView: UICollectionView {
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        commonInit()
    }

    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()
    }

    open func commonInit() {
        #if TARGET_INTERFACE_BUILDER
        setNeedsLayout()
        setNeedsDisplay()
        #endif
    }
}
