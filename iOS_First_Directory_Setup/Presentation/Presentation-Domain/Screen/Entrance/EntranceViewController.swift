import UIKit

class EntranceViewController: UIViewController {
    
    @IBOutlet weak var EntranceImageView: CornerRoundableImageView!
    
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
