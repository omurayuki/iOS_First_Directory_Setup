import UIKit
import SwifteriOS
import SafariServices
import RxCocoa
import RxSwift

class LoginViewController: UIViewController, SFSafariViewControllerDelegate, ErrorNotifying {
    
    @IBOutlet weak var LoginTopImageView: CornerRoundableImageView!
    @IBOutlet weak var LoginButton: CornerRoundableButton!
    
    var routing: LoginRoutingProtocol? { didSet { routing?.viewController = self } }
    var viewModel: LoginViewModelProtocol?
    private let disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindUI()
        bindVM()
    }
    
    private func bindUI() {
        
        LoginButton.rx.tap.asDriver()
            .drive(onNext: { [weak self] _ in
                guard let this = self else { return }
                this.viewModel?.oAuthLogin(presentingForm: this)
            })
        .disposed(by: disposeBag)
    }
    
    private func bindVM() {
        
        viewModel?.error
            .asDriver(onErrorJustReturn: nil)
            .drive(onNext: { [weak self] error in
                guard let error = error as? AppError else { return }
                error.alertController()
                // errorデータは来ていること確認
                // ErrorNotifying中心にerror処理を修正する必要あり
            }).disposed(by: disposeBag)
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
