import UIKit
import SwifteriOS
import SafariServices
import RxCocoa
import RxSwift

class LoginViewController: UIViewController, SFSafariViewControllerDelegate {
    
    @IBOutlet weak var LoginTopImageView: CornerRoundableImageView!
    
    @IBOutlet weak var LoginButton: CornerRoundableButton!
    
    let disposeBag = DisposeBag()
    
    let TWITTER_CONSUMER_KEY = "sqOi4qeOAFWf9kJwNw5RkveM6"
    let TWITTER_CONSUMER_SECRET = "UtYIzFwCtb2fpJvUw4FYI6CJ8dgDqRGZ7NjCp1CdXz0pfjxIBP"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let swifter = Swifter(consumerKey: TWITTER_CONSUMER_KEY, consumerSecret: TWITTER_CONSUMER_SECRET)
        
        LoginButton.rx.tap.asDriver()
            .drive(onNext: { _ in
                swifter.authorize(withCallback: URL(string: "swifter-sqOi4qeOAFWf9kJwNw5RkveM6://")!, presentingFrom: self, success: { accessToken, response in
                    print(response)
                }) { error in
                    print(error)
                }
            })
        .disposed(by: disposeBag)
    }
}

// observable作成
// エラーハンドリング // オフラインかどうか → API叩く →
// エラーハンドリングクラス作成
// キャッシュクラス作成
// アーキテクチャ
// テスト // Observableで成功/失敗時に値がそれぞれ取れるかも
