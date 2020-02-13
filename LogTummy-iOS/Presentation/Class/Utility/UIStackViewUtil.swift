import Foundation
import UIKit

extension UIStackView {
    
    static func setupStack(lhs: UIView, rhs: UIView, spacing: CGFloat) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: [
            lhs,
            rhs
        ])
        stack.spacing = spacing
        
        return stack
    }
    
    static func setupVerticalStack(lhs: UIView, rhs: UIView, spacing: CGFloat) -> UIStackView {
        let stack = VerticalStackView(arrangeSubViews: [
            lhs,
            rhs
        ], spacing: spacing)
        
        return stack
    }
}
