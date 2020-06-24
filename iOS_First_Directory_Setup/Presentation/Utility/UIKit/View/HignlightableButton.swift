import UIKit

public struct HighlightableButtonConstants {
    static public let highlightScale: CGFloat = 0.9
    static public let expandDistance: CGFloat = 4.0
    static public let animationDuration: Double = 0.5
    static public let animationDamping: CGFloat = 1
    static public let springVelocity: CGFloat = 0.5
}

open class HighlightableButton: IBDesignableButton {

    var wantsHighlight: Bool = true
    var defaultBorderWidth: CGFloat = 0
    var defaultBackgroundColor: UIColor?
    var highlightedBackgroundColor: UIColor?

    override open var isHighlighted: Bool {
        didSet {
            guard wantsHighlight else { return }
            if isHighlighted {
                backgroundColor = highlightedBackgroundColor
            } else {
                backgroundColor = defaultBackgroundColor
            }
        }
    }
    
    open override var isEnabled: Bool {
        didSet {
            if isEnabled {
                if wantsHighlight {
                    backgroundColor = defaultBackgroundColor
                }
                layer.borderWidth = defaultBorderWidth
            } else {
                if wantsHighlight {
                    backgroundColor = defaultBackgroundColor?.withAlphaComponent(0.5)
                }
                layer.borderWidth = 0
            }
        }
    }

    public func configureCornerRadius(radius: CGFloat = 0) {
        layer.cornerRadius = radius
    }

    public func configureBorder(width: CGFloat, color: UIColor) {
        defaultBorderWidth = width
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }

    /**
     Creates a highlighted color derived from default color, or a custom highlight color if provided.
     Set `wantsHighlight` to false to supress this behavior completely.
     */
    public func configureColor(defaultColor: UIColor?, highlightColor: UIColor? = nil, highlightScale: CGFloat = HighlightableButtonConstants.highlightScale) {

        highlightedBackgroundColor = highlightColor
            ?? defaultColor?.scaled(scale: highlightScale)

        defaultBackgroundColor = defaultColor
        backgroundColor = defaultColor
    }

    open override func commonInit() {
        super.commonInit()
        configureCornerRadius()
        configureColor(defaultColor: backgroundColor)
        self.isOpaque = false
        addTarget(self, action: #selector(animateRecoil), for: UIControl.Event.touchUpInside)
        addTarget(self, action: #selector(simulatePress), for: UIControl.Event.touchDown)
        addTarget(self, action: #selector(resetTransform), for: UIControl.Event.touchDragOutside)
        addTarget(self, action: #selector(resetTransform), for: UIControl.Event.touchCancel)
    }

    @objc
    func animateRecoil() {
        let maxSide = max(bounds.width, bounds.height)
        let expandRatio = (maxSide - HighlightableButtonConstants.expandDistance) / maxSide

        transform = CGAffineTransform(scaleX: expandRatio, y: expandRatio)
        UIView.animate(withDuration: HighlightableButtonConstants.animationDuration,
                       delay: 0.1,
                       usingSpringWithDamping: HighlightableButtonConstants.animationDamping,
                       initialSpringVelocity: HighlightableButtonConstants.springVelocity,
                       options: UIView.AnimationOptions.allowUserInteraction,
                       animations: { () -> Void in
                        self.transform = .identity
        })
    }

    @objc
    func simulatePress() {
        let maxSide = max(bounds.width, bounds.height)
        let contractRatio = (maxSide - HighlightableButtonConstants.expandDistance) / maxSide

        transform = CGAffineTransform(scaleX: contractRatio, y: contractRatio)
    }

    @objc
    func resetTransform() {
        transform = .identity
    }
}
