import Foundation

final class CalendarUtil {
    enum Weekday: Int {
        case sun = 1
        case mon = 2
        case tue = 3
        case wed = 4
        case thu = 5
        case fri = 6
        case sat = 7
    }

    static func getWeekDay(date: Date) -> CalendarUtil.Weekday? {
        let cal = Calendar.current
        let comp = cal.dateComponents([.weekday], from: date)
        guard let weekday = comp.weekday else { return nil }
        return CalendarUtil.Weekday(rawValue: weekday)
    }
}
