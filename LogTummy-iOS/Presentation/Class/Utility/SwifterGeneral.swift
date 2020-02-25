import Foundation
import SwifteriOS

enum SwifterGeneral: CustomStringConvertible {
    
    case TWITTER_CONSUMER_KEY
    case TWITTER_CONSUMER_SECRET
    case CALLBACK_URL
    
    var description: String {
        switch self {
        case .TWITTER_CONSUMER_KEY:
            return "sqOi4qeOAFWf9kJwNw5RkveM6"
        case .TWITTER_CONSUMER_SECRET:
            return "UtYIzFwCtb2fpJvUw4FYI6CJ8dgDqRGZ7NjCp1CdXz0pfjxIBP"
        case .CALLBACK_URL:
            return "swifter-sqOi4qeOAFWf9kJwNw5RkveM6://"
        }
    }
    
    static func handleOpenURL(url: URL) -> Bool {
        return Swifter.handleOpenURL(url, callbackURL: URL(string: SwifterGeneral.CALLBACK_URL.description)!)
    }
}
