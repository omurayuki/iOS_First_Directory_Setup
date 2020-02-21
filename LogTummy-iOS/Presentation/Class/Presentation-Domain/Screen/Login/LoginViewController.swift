import UIKit
import SwifteriOS
import SafariServices
import RxCocoa
import RxSwift

class LoginViewController: UIViewController, SFSafariViewControllerDelegate, ErrorNotifying {
    
    var viewModel: LoginViewModel?
    var disposeBag: DisposeBag = DisposeBag()
    
    @IBOutlet weak var LoginTopImageView: CornerRoundableImageView!
    
    @IBOutlet weak var LoginButton: CornerRoundableButton!
    
    let TWITTER_CONSUMER_KEY = "sqOi4qeOAFWf9kJwNw5RkveM6"
    let TWITTER_CONSUMER_SECRET = "UtYIzFwCtb2fpJvUw4FYI6CJ8dgDqRGZ7NjCp1CdXz0pfjxIBP"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindUI()
        
        LoginButton.rx.tap.asDriver()
            .drive(onNext: { _ in
                // usecase
                self.sampleObservable().subscribe(onSuccess: { authTuple in
                    print(authTuple)
                }) { error in
                    self.showErrorMessage(error)
                }.disposed(by: self.disposeBag)
            })
        .disposed(by: disposeBag)
    }
    
    private func bindUI() {
        
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

// observable作成 ok
// エラーハンドリング // オフラインかどうか → API叩く → ok
// アーキテクチャ entityクラスなども
// エラーハンドリングクラス作成(swifterエラーのリファクタ)
// キャッシュクラス作成
// テスト // Observableで成功/失敗時に値がそれぞれ取れるかも
// UI調整
// ボタンエフェクト処理
// swinject削除
