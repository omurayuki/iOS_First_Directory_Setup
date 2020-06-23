import Foundation

struct StringResources {
        
    private typealias Internal = R.string

    struct App { }
    
    struct General {
        static var yes: String { return Internal.localizable.yes() }
        static var no: String { return Internal.localizable.no() }
        static var ok: String { return Internal.localizable.ok() }
        static var cancel: String { return Internal.localizable.cancel() }
        static var attension: String { return Internal.localizable.attension() }
        static var success: String { return Internal.localizable.success() }
        static var okButtonTitle: String { return Internal.localizable.ok_button_title() }
    }
    
    struct Error {
        static var displayTitle: String { return Internal.localizable.error_title() }
        static var noNetworkConnection: String { return Internal.localizable.text_no_network_connection() }
        static var standardErrorTitle: String { return Internal.localizable.text_error() }
        static var standardErrorMessage: String { return Internal.localizable.text_app_error_general() }
        static func standardErrorMessageWithFormat(_ arg: String) -> String { return Internal.localizable.text_app_error_occurred_with_code(arg) }
        static var retryAction: String { return Internal.localizable.retry_action() }
    }
}
