extension StringResources {
    
    var App: Application.Type { return Application.self }
    
    struct Application {
        
        private typealias Internal = R.string
        
        struct Error {
            static var standardErrorTitle: String { return Internal.localizable.text_error() }
            static var standardErrorMessage: String { return Internal.localizable.text_app_error_general() }
            static func standardErrorMessageWithFormat(_ arg: String) -> String { return Internal.localizable.text_app_error_occurred_with_code(arg) }
            static var retryAction: String { return Internal.localizable.retry_action() }
            static var noNetworkConnection: String { return Internal.localizable.text_no_network_connection() }
        }
        
        struct General {
            static var okButtonTitle: String { return Internal.localizable.ok_button_title() }
        }
        
        struct Title {
            static var titleLogin: String { return Internal.localizable.title_login() }
            static var titleCalendar: String { return Internal.localizable.title_calendar() }
            static var titleTimeline: String { return Internal.localizable.title_timeline() }
            static var titleWriteMemo: String { return Internal.localizable.title_write_memo() }
        }
        
        struct Time {
            static var timeYearAgo: String { return Internal.localizable.time_year_ago() }
            static var timeMonthAgo: String { return Internal.localizable.time_month_ago() }
            static var timeWeekAgo: String { return Internal.localizable.time_week_ago() }
            static var timeDayAgo: String { return Internal.localizable.time_day_ago() }
            static var timeHourAgo: String { return Internal.localizable.time_hour_ago() }
            static var timeMinutesAgo: String { return Internal.localizable.time_minutes_ago() }
            static var timeSecondAgo: String { return Internal.localizable.time_second_ago() }
            static var timeCurrent: String { return Internal.localizable.time_current() }
        }
    }
}
