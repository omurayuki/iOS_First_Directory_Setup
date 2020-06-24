import Foundation

protocol AnalyticsServiceProtocol {
    var analyticsIdentifier: AnalyticsService { get }
    func sendEvent(_ event: AnalyticsEvent)
    func sendScreen(_ screenWith: AnalyticsScreenView)
}

enum AnalyticsService {
    case firebase
}
