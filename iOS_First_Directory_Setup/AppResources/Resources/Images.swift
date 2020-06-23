import Foundation
import UIKit

struct ImageResources {
        
    private typealias Internal = R.image
    
    static var chat: UIImage? { return Internal.chat() }
    static var video: UIImage? { return Internal.video() }
    static var guide: UIImage? { return Internal.guide() }
    static var enjoying: UIImage? { return Internal.enjoying() }
    static var alarm: UIImage? { return Internal.alarm() }
    static var questionnaire: UIImage? { return Internal.questionnaire() }
}
