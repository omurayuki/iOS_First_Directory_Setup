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
        swifter.searchTweet(using: "今日の積み上げ", success: { (j1, j2) in
            print(j1)
            print(j2)
        }) { error in
            error.localizedDescription
        }
    }
}
