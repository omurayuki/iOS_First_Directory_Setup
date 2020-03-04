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

extension UICollectionView {

    /// 枠線の色
    @IBInspectable var borderColor: UIColor? {
        get {
            return layer.borderColor.map { UIColor(cgColor: $0) }
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }

    /// 枠線のWidth
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    /// 角丸の大きさ
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

  /// 影の色
  @IBInspectable var shadowColor: UIColor? {
    get {
      return layer.shadowColor.map { UIColor(cgColor: $0) }
    }
    set {
      layer.shadowColor = newValue?.cgColor
      layer.masksToBounds = false
    }
  }

  /// 影の透明度
  @IBInspectable var shadowAlpha: Float {
    get {
      return layer.shadowOpacity
    }
    set {
      layer.shadowOpacity = newValue
    }
  }

  /// 影のオフセット
  @IBInspectable var shadowOffset: CGSize {
    get {
     return layer.shadowOffset
    }
    set {
      layer.shadowOffset = newValue
    }
  }

  /// 影のぼかし量
  @IBInspectable var shadowRadius: CGFloat {
    get {
     return layer.shadowRadius
    }
    set {
      layer.shadowRadius = newValue
    }
  }

}
