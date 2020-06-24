import Foundation

enum AnalyticsScreenName: String {
    case calendar = "Calendar"
    case list = "List"
}

enum AnalyticsCategory: String {
    case appLaunch = "AppLaunch"
    case login = "Login"
}

enum AnalyticsAction: String {
    case tap
//    case tap~~
    case display
}
