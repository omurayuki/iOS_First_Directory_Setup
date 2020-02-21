import SwinjectStoryboard

extension SwinjectStoryboard {
    
    final class ViewControllerAssembly {
        
        @objc
        class func setup() {
            defaultContainer.storyboardInitCompleted(LoginViewController.self) {
                $1.viewModel = $0.resolve(LoginViewModelProtocol.self)
            }
        }
    }
}
