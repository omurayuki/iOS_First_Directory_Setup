import UIKit
import SafariServices
import RxCocoa
import RxSwift

class LoginViewController: UIViewController {
    
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
            .debounce(Resources.Sizes.timeInterval.normal)
            .drive(onNext: { [weak self] _ in
                guard let this = self else { return }
                this.viewModel?.oAuthLogin(presentingForm: this)
                this.routing?.fuga()
            })
        .disposed(by: disposeBag)
    }
    
    private func bindVM() {
        
        viewModel?.error
            .asDriver(onErrorJustReturn: nil)
            .drive(onNext: { [weak self] error in
                guard let error = error as? AppError else { return }
                self?.showErrorMessage(error)
            }).disposed(by: disposeBag)
    }
}

extension LoginViewController: SFSafariViewControllerDelegate { }

extension LoginViewController: ErrorNotifying { }
// 遷移 DIリファクタ swinject内部実装パクってプロジェクトから削除する予定 DI fatalerrorをどうにか
// テスト // Observableで成功/失敗時に値がそれぞれ取れるかも
// UI調整
// ボタンエフェクト処理
// credential情報のコミットを修正/API Key隠蔽処理
