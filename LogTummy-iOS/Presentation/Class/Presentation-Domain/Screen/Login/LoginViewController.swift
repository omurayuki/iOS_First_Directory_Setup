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
        
        LoginButton.rx.tap.asDriver()
            .drive(onNext: { _ in
                // usecase
                self.sampleObservable().subscribe(onSuccess: { authTuple in
                    print(authTuple)
                }) { error in
                    let mappedError = self.mapSwifterError(error: error)
                    let alert = mappedError.alertController()
                    self.present(alert, animated: true, completion: nil)
                }.disposed(by: self.disposeBag)
            })
        .disposed(by: disposeBag)
    }
    
    // remoteManager // datamanagerはuserdefaultかremotemanagerのこれを叩く
    func sampleObservable() -> Single<(Credential.OAuthAccessToken?, URLResponse)> {
        return Single.create { observer -> Disposable in
            let swifter = Swifter(consumerKey: self.TWITTER_CONSUMER_KEY, consumerSecret: self.TWITTER_CONSUMER_SECRET)
            swifter.authorize(withCallback: URL(string: "swifter-sqOi4qeOAFWf9kJwNw5RkveM6://")!, presentingFrom: self, success: { accessToken, response in
                observer(.success((accessToken, response)))
            }) { error in
                if DeviceInfo().isOffline {
                    observer(.error(SwifterError(errorKind: .offline)))
                }
                observer(.error(error))
            }
            return Disposables.create()
        }
    }
}

extension LoginViewController: ErrorMappingUsecaseProtocolExtension {
    
}

// observable作成
// エラーハンドリング // オフラインかどうか → API叩く →
// エラーハンドリングクラス作成
// 通信状況が悪い時のタイムアウト処理実装
// キャッシュクラス作成
// アーキテクチャ
// テスト // Observableで成功/失敗時に値がそれぞれ取れるかも
