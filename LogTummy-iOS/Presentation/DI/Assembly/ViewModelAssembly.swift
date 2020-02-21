import SwinjectStoryboard

extension SwinjectStoryboard {
    
    final class ViewModelAssembly {
        
        @objc
        class func setup() {
            defaultContainer.register(LoginViewModelProtocol.self) { _ in
                LoginViewModel()
            }
        }
    }
}
