import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var LoginTopImageView: CornerRoundableImageView!
    @IBOutlet weak var LoginButton: CornerRoundableButton!
    
    var routing: LoginRoutingProtocol?
    var viewModel: LoginViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
        bindVM()
    }
    
    private func bindUI() { }
    
    private func bindVM() { }
}
