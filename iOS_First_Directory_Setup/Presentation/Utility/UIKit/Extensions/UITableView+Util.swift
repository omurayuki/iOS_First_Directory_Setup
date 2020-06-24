import UIKit.UITableView

public extension UITableView {
    

    #warning("0.15 = TimeDelayResource作成")
    /*
     public struct TimeDelayResource {
         /** 0.00 Sec */
         public var now: DispatchTime { return .now() + Hoge.Sizes.Duration.none }
     */
    func deselect(_ indexPath: IndexPath, after delay: DispatchTime = .now() + 0.15, completion: (() -> Void)? = nil) {
        DispatchQueue.main.asyncAfter(deadline: delay) {
            self.deselectRow(at: indexPath, animated: true)
            completion?()
        }
    }

    func setContentOffsetY(contentOffsetY: CGFloat) {
        self.setContentOffset(CGPoint(x: 0, y: contentOffsetY), animated: false)
    }
}
