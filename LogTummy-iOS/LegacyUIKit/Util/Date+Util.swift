import Foundation

extension Date {
    static func dateFromString(_ string: String, format: String? = nil) -> Date? {
        let dateFormat = format != nil ? (format ?? "") : "yyyy.MM.dd"
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        return formatter.date(from: string)
    }
    
    static func stringFromDate(_ date: Date, format: String? = nil) -> String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale.current
        formatter.dateFormat = format ?? "yyyy.MM.dd"
        return formatter.string(from: date)
    }
    
    var day: Int {
        return parse(format: "dd")
    }
    
    var month: Int {
        return parse(format: "MM")
    }
    
    var year: Int {
        return parse(format: "yyyy")
    }
    
    var timeInterval: UInt64 {
        let nineHours: Double = 9 * 60 * 60 * 1_000
        return UInt64(timeIntervalSince1970 * 1_000 + nineHours)
    }
    
    private func parse(format: String) -> Int {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        guard let value = Int(formatter.string(from: self)) else { return Int() }
        return value
    }
}

extension Date {
    
    func offsetFrom() -> String {
        if yearsFrom() > 0       { return "\(yearsFrom())年前" }
        if monthsFrom() > 0      { return "\(monthsFrom())ヶ月前" }
        if weeksFrom() > 0       { return "\(weeksFrom())週間前" }
        if daysFrom() > 0        { return "\(daysFrom())日前" }
        if hoursFrom() > 0       { return "\(hoursFrom())時間前" }
        if minutesFrom() > 0     { return "\(minutesFrom())分前" }
        if secondsFrom() > 0     { return "\(secondsFrom())秒前" }
        return "現在"
    }
    
    func yearsFrom() -> Int {
        return Calendar.current.dateComponents([.year], from: self, to: Date()).year ?? 0
    }
    func monthsFrom() -> Int {
        return Calendar.current.dateComponents([.month], from: self, to: Date()).month ?? 0
    }
    func weeksFrom() -> Int {
        return Calendar.current.dateComponents([.weekOfYear], from: self, to: Date()).weekOfYear ?? 0
    }
    func daysFrom() -> Int {
        return Calendar.current.dateComponents([.day], from: self, to: Date()).day ?? 0
    }
    func hoursFrom() -> Int {
        return Calendar.current.dateComponents([.hour], from: self, to: Date()).hour ?? 0
    }
    func minutesFrom() -> Int {
        return Calendar.current.dateComponents([.minute], from: self, to: Date()).minute ?? 0
    }
    func secondsFrom() -> Int {
        return Calendar.current.dateComponents([.second], from: self, to: Date()).second ?? 0
    }
}

extension Date {
    /// 日付→文字列に変換する
    /// - Parameter format: フォーマット
    /// - Returns: 変換後の文字列
    public func toString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: format,
                                                        options: 0,
                                                        locale: Locale(identifier: "ja_JP"))
        return formatter.string(from: self)
    }
}

#warning("ローカライズ")
