import Foundation
import UIKit

extension UIPageViewController {
    
    // swiftlint:enable:next shorthand_operator
    static func generateViewController(viewControllerBefore: UIViewController,
                                       viewControllers: [UIViewController]) -> UIViewController? {
        var index = viewControllerBefore.view.tag
        index = index - 1
        if index < 0 { return nil }
        return viewControllers[index]
    }
    
    static func generateViewController(viewControllerAfter: UIViewController,
                                       viewControllers: [UIViewController]) -> UIViewController? {
        var index = viewControllerAfter.view.tag
        if index == viewControllers.count - 1 { return nil }
        index = index + 1
        return viewControllers[index]
    }
}
