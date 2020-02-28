import UIKit.UIView

extension UIView {
    
    class Animator {
        
        // swiftlint:disable all
        typealias Animations = () -> Void
        typealias Completion = (Bool) -> Void
        
        private var animations: Animations
        private var completion: Completion?
        private let duration: TimeInterval
        private let delay: TimeInterval?
        private let options: UIView.AnimationOptions?
        
        init(duration: TimeInterval, delay: TimeInterval? = 0.0, options: UIView.AnimationOptions? = .curveEaseInOut) {
            self.animations = {}
            self.completion = nil
            self.duration = duration
            self.delay = delay
            self.options = options
        }
        
        func animations(_ animations: @escaping Animations) -> Self {
            self.animations = animations
            return self
        }
        
        func completion(_ completion: @escaping Completion) -> Self {
            self.completion = completion
            return self
        }
        
        func animate() {
            UIView.animate(withDuration: duration,
                           delay: delay ?? 0.0,
                           options: options ?? .curveEaseInOut,
                           animations: animations,
                           completion: completion)
        }
    }
    
    class SpringAnimator {
        
        typealias Animations = () -> Void
        typealias Completion = (Bool) -> Void
        
        private var animations: Animations
        private var completion: Completion?
        private let duration: TimeInterval
        private let delay: TimeInterval?
        private var damping: CGFloat
        private var velocity: CGFloat
        private let options: UIView.AnimationOptions?
        
        init(duration: TimeInterval,
             delay: TimeInterval? = 0.0,
             damping: CGFloat,
             velocity: CGFloat,
             options: UIView.AnimationOptions? = .curveEaseInOut) {
            self.animations = {}
            self.completion = nil
            self.duration = duration
            self.delay = delay
            self.damping = damping
            self.velocity = velocity
            self.options = options
        }
        
        func animations(_ animations: @escaping Animations) -> Self {
            self.animations = animations
            return self
        }
        
        func completion(_ completion: @escaping Completion) -> Self {
            self.completion = completion
            return self
        }
        
        func animate() {
            UIView.animate(withDuration: duration,
                           delay: delay ?? 0.0,
                           usingSpringWithDamping: damping,
                           initialSpringVelocity: velocity,
                           options: options ?? .curveEaseInOut,
                           animations: animations,
                           completion: completion)
        }
    }
}

enum FadeType: TimeInterval {
    case
    normal = 0.2,
    slow = 1.0
}

extension UIView {
    
    func fadeIn(type: FadeType = .normal, completed: (() -> ())? = nil) {
        fadeIn(duration: type.rawValue, completed: completed)
    }
    
    /** For typical purpose, use "public func fadeIn(type: FadeType = .Normal, completed: (() -> ())? = nil)" instead of this */
    func fadeIn(duration: TimeInterval = FadeType.slow.rawValue, completed: (() -> ())? = nil) {
        alpha = 0
        isHidden = false
        UIView.animate(withDuration: duration,
                       animations: {
            self.alpha = 1
        }) { finished in
            completed?()
        }
    }
    
    func fadeOut(type: FadeType = .normal, completed: (() -> ())? = nil) {
        fadeOut(duration: type.rawValue, completed: completed)
    }
    
    /** For typical purpose, use "public func fadeOut(type: FadeType = .Normal, completed: (() -> ())? = nil)" instead of this */
    func fadeOut(duration: TimeInterval = FadeType.slow.rawValue, completed: (() -> ())? = nil) {
        UIView.animate(withDuration: duration,
                       animations: {
            self.alpha = 0
        }) { [weak self] finished in
            self?.isHidden = true
            self?.alpha = 1
            completed?()
        }
    }
    
    func changeAppearanceWithAlphaAnimation(_ duration: Double, completion: (() -> Void)? = nil) {

        let transition = CATransition()
        transition.duration = duration
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade

        let key = "transition"
        layer.removeAnimation(forKey: key)
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        layer.add(transition, forKey: key)
        CATransaction.commit()

    }
}
