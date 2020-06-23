import UIKit

class EntranceViewController: UIViewController {
    
    @IBOutlet weak var LoginTopImageView: CornerRoundableImageView!
    @IBOutlet weak var LoginButton: CornerRoundableButton!
    
    var routing: EntranceRoutingProtocol?
    var viewModel: EntranceViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
        bindVM()
    }
    
    private func bindUI() { }
    
    private func bindVM() { }
}
