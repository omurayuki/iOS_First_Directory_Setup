import UIKit
import SwifteriOS

class LoginViewController: UIViewController {
    
    @IBOutlet weak var LoginTopImageView: CornerRoundableImageView!
    
    @IBOutlet weak var LoginButton: CornerRoundableButton!
    
    let swifter = Swifter(consumerKey: "", consumerSecret: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        swifter.authorize(withCallback: <#T##URL#>, presentingFrom: <#T##UIViewController?#>, success: { (<#Credential.OAuthAccessToken?#>, <#URLResponse#>) in
//            <#code#>
//        }) { (<#Error#>) in
//            <#code#>
//        }
    }
}
