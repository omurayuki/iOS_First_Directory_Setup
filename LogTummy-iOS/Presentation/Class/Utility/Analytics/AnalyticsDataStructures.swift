import Foundation

struct AnalyticsEvent {
    static let defaultEventValue = NSNumber(integerLiteral: 1)
    
    var category: AnalyticsCategory
    var action: AnalyticsAction
    var label: String
    var value: (NSNumber?)
    var eventValue: AppAnalyticsInfoType?
    var hashMemberId: String?
    var customDimensionValue: String?
}

struct AnalyticsScreenView {
    let screenName: AnalyticsScreenName
    let hasGuestMemberId: String?
}
