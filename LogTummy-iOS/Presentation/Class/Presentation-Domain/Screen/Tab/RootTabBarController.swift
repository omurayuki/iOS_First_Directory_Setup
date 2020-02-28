import Foundation
import UIKit

class RootTabBarController: UITabBarController {
    
    struct TabModel {
        let instance: UIViewController?
        let title: String
        let icon: UIImage?
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        let tabs = getTabBarItems()
        let viewControllers = tabs.enumerated()
            .map { (index, tab) -> UIViewController in

                let tabBarItem = UITabBarItem(title: tab.title, image: tab.icon, selectedImage: nil)
                guard let vc = tab.instance else { return UIViewController() }
                vc.tabBarItem = tabBarItem
                return vc
            }
        setViewControllers(viewControllers, animated: false)
    }
}

extension RootTabBarController {
    
    private var calendarTab: TabModel {
        let instance: UIViewController = resolver.resolve(CalendarViewController.self)!
        let title: String = "calendar"
        let icon: UIImage? = nil
        return TabModel(instance: instance, title: title, icon: icon)
    }
    
    private var timelineTab: TabModel {
        let instance: UIViewController = resolver.resolve(TimelineViewController.self)!
        let title: String = "timeline"
        let icon: UIImage? = nil
        return TabModel(instance: instance, title: title, icon: icon)
    }
    
    func getTabBarItems() -> [TabModel] {
        let tabs = [
            calendarTab,
            timelineTab
        ]

        return tabs
    }
}
