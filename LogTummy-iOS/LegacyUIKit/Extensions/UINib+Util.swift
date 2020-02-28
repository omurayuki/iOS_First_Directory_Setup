import UIKit.UINib

public extension UINib {

    class func nibFromClass<T: UIView>(_ type: T.Type) -> UINib? {
        let bundle = Bundle(for: type)
        guard let name = NSStringFromClass(T.self).components(separatedBy: ".").last else { return nil }
        return UINib(nibName: name, bundle: bundle)
    }

    class func loadNibFromClass<T: UIView>(_ type: T.Type, owner: UIView? = nil, options: [UINib.OptionsKey: Any]? = nil) -> UIView? {
        guard let name = NSStringFromClass(T.self).components(separatedBy: ".").last else { return nil }
        let bundle = Bundle(for: type)
        let object = bundle.loadNibNamed(name, owner: owner, options: options)?.last
        guard let ret = object as? UIView else { return nil }
        return ret
    }

    class func loadNibFromClassWithCast<T: UIView>(_ type: T.Type, owner: UIView? = nil, options: [UINib.OptionsKey: Any]? = nil) -> T? {
        let object = loadNibFromClass(type, owner: owner, options: options)
        guard let ret = object as? T else { return nil }
        return ret
    }

}
