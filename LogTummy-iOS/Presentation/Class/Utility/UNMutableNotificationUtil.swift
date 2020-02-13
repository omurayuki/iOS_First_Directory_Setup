import Foundation
import UserNotifications

extension UNMutableNotificationContent {
    
    func createLocalNotification(title: String,
                                 content: String,
                                 sound: UNNotificationSound,
                                 resource: (image: String, type: String)? = nil,
                                 requestIdentifier: String,
                                 notificationHandler: @escaping () -> Void) {
        self.title = title
        self.body = content
        self.sound = sound
        if let image = resource?.image, let type = resource?.type {
            if let path = Bundle.main.path(forResource: image, ofType: type) {
                if let imageAttachment = try? UNNotificationAttachment(identifier: image,
                                                                    url: URL(fileURLWithPath: path),
                                                                    options: nil) {
                    self.attachments = [imageAttachment]
                }
            }
        }
        let request = UNNotificationRequest(identifier: requestIdentifier, content: self, trigger: nil)
        UNUserNotificationCenter.current().add(request) { _ in
            notificationHandler()
        }
    }
}
