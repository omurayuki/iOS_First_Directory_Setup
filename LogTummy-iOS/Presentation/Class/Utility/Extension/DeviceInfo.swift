import UIKit
import RxSwift
import RxRelay
import Reachability

#warning("テスト実施")

protocol DeviceInfoProtocol {
    
    var screenBounds: CGRect { get }
}

class DeviceInfo: DeviceInfoProtocol {
    
    private var internetReachability: Reachability?
    
    init() {
        do {
            if let reachability = try? Reachability() {
                internetReachability = reachability
                try internetReachability?.startNotifier()
            }
        } catch {
            Logger.error("can't instantiate Reachability")
        }
    }
    
    var screenBounds: CGRect {
        return UIScreen.main.bounds
    }
    
    var isOffline: Bool {
        guard let internetReachability = internetReachability else { return false }
        return !mapInternetReachability(reachability: internetReachability)
    }
    
    var internetReachabilityStream: Observable<Bool> {
        guard let internetReachability = internetReachability else { return Observable.just(false) }
        let isConnectedToInternet = mapInternetReachability(reachability: internetReachability)
        let initialReachability = Observable<Bool>.just(isConnectedToInternet)

        let notificationMapper = { (notification: Notification) -> Bool in
            guard let reachability = notification.object as? Reachability else {
                return false
            }
            let isConnectedToInternet = self.mapInternetReachability(reachability: reachability)
            return isConnectedToInternet
        }

        let notificationStream = NotificationCenter.default.rx.notification(NSNotification.Name.reachabilityChanged)
        let sequentialReachability = notificationStream.map(notificationMapper)

        let concat = Observable.of(initialReachability, sequentialReachability).concat()
        return concat
    }
    
    private func mapInternetReachability(reachability: Reachability) -> Bool {
        let status = reachability.connection
        switch status {
        case .cellular, .wifi:
            return true
        default:
            return false
        }
    }
}
