import UIKit
import RxSwift
import RxCocoa
import SwifteriOS

final class CalendarViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let swifter = Swifter(consumerKey: SwifterGeneral.TWITTER_CONSUMER_KEY.description,
                              consumerSecret: SwifterGeneral.TWITTER_CONSUMER_SECRET.description,
                              oauthToken: MobileAuth().getUserKey()!,
                              oauthTokenSecret: MobileAuth().getUserSecret()!)
        swifter.getTimeline(for: UserTag.id(MobileAuth().getUserId()!), count: 50, success: { (json) in
            print(json)
        }) { error in
            error.localizedDescription
        }
    }
}
