import UIKit
import SafariServices
import RxCocoa
import RxSwift

class LoginViewController: UIViewController {
    
    @IBOutlet weak var LoginTopImageView: CornerRoundableImageView!
    @IBOutlet weak var LoginButton: CornerRoundableButton!
    
    var routing: LoginRoutingProtocol?
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
//                this.routing?.fuga(vc: self!)
                
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
// tabbar
// UI調整
// ボタンエフェクト処理
// credential情報のコミットを修正/API Key隠蔽処理
