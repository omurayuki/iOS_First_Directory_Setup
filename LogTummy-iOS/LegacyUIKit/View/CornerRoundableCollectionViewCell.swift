import UIKit

open class CornerRoundableCollectionViewCell: IBDesignableCollectionViewCell {
    
    @IBInspectable var cornerRadius: CGFloat = 15 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
    
    override open func commonInit() {
        super.commonInit()
        refreshCorners(value: cornerRadius)
    }
    
    private func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
}

open class CornerRoundableCollectionView: IBDesignableCollectionView {
    
    @IBInspectable var cornerRadius: CGFloat = 15 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
    
    override open func commonInit() {
        super.commonInit()
        refreshCorners(value: cornerRadius)
    }
    
    private func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
}
