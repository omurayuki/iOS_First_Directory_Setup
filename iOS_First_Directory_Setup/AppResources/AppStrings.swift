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
    }
}
