import Foundation
import UIKit

extension DateFormatter {
    
    func convertToMonthAndYears(_ date: Date?) -> String {
        guard let date = date else { return "" }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        return formatter.string(from: date)
    }
    
    func convertToTime(_ date: Date?, second: Int = 1) -> String {
        guard let date = date else { return "" }
        let calcDate = NSDate(timeInterval: TimeInterval(second), since: date)
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm"
        return formatter.string(from: calcDate as Date)
    }
    
    static func acquireCurrentTime() -> String {
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let time = formatter.string(from: now)
        return time
    }
}
