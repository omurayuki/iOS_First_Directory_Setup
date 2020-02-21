import Swinject
import SwinjectStoryboard

var container: Container {
    return SwinjectStoryboard.defaultContainer
}

class Inject {
    
    class func createInjectedStoryboardWithViewController(name: String, bundle: Bundle? = nil) -> UIViewController? {
        /**
         https://github.com/Swinject/Swinject/issues/218
         This is due to resolution logging feature (#160) which has been added to Swinject v2. Currently it does not work well with SwinjectStoryboard, as discussed in #213.
         */
        Container.loggingFunction = nil
        
        return SwinjectStoryboard
            .create(name: name, bundle: nil, container: container)
            .instantiateInitialViewController()
    }
}
