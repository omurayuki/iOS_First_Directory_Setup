import Kingfisher
import UIKit

extension UIImage {
    
    public convenience init?(url: String) {
        if let url = URL(string: url) {
            do {
                let data = try Data(contentsOf: url)
                self.init(data: data)
                return
            } catch let err {
                print("Error : \(err.localizedDescription)")
            }
        }
        self.init()
    }
    
    func fixOrientation() -> UIImage {
        if (imageOrientation == .up) { return self }
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        draw(in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    func scale(to newSize: CGSize) -> UIImage? {
        let horizontalRatio = newSize.width / size.width
        let verticalRatio = newSize.height / size.height
        let ratio = max(horizontalRatio, verticalRatio)
        let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}

extension UIImageView {
    
    func setImage(url: String, completion: (() -> Void)? = nil) {
        
//        if URL(string: url) != nil && url.count > 0 {
//            let resource = ImageResource(downloadURL: URL(string: url)!, cacheKey: url)
//            self.kf.setImage(with: resource, placeholder: R.image.logo())
//        }
//        else{
//            self.image =
//        }
    }
    
    func setImage(url: URL?, completion: ((_ response: UIImage?) -> Void)? = nil) {
//        kf.setImage(with: url) { result in
//            switch result {
//            case .success(let value):
//                completion?(value.image)
//            case .failure(_):
//                completion?(nil)
//            }
//        }
        kf.setImage(with: url)
    }
    
    func cancelDownload() {
        kf.cancelDownloadTask()
    }
    
    class Builder {
        
        private var cornerRadius: CGFloat?
        private var borderWidth: CGFloat?
        
        private var isUserInteractionEnabled = true
        private var borderColor: CGColor = UIColor.white.cgColor
        private var backgroundColor: UIColor = .white
        private var clipsToBounds: Bool = true
        private var contentMode: ContentMode = .scaleAspectFit
        
        func cornerRadius(_ cornerRadius: CGFloat) -> Builder {
            self.cornerRadius = cornerRadius
            return self
        }
        
        func borderWidth(_ borderWidth: CGFloat) -> Builder {
            self.borderWidth = borderWidth
            return self
        }
        
        func borderColor(_ borderColor: CGColor) -> Builder {
            self.borderColor = borderColor
            return self
        }
        
        func backgroundColor(_ backgroundColor: UIColor) -> Builder {
            self.backgroundColor = backgroundColor
            return self
        }
        
        func clipsToBounds(_ clipsToBounds: Bool) -> Builder {
            self.clipsToBounds = clipsToBounds
            return self
        }
        
        func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> Builder {
            self.isUserInteractionEnabled = isUserInteractionEnabled
            return self
        }
        
        func contentMode(_ contentMode: ContentMode) -> Builder {
            self.contentMode = contentMode
            return self
        }
        
        func build() -> UIImageView {
            let imageView = UIImageView()
            imageView.layer.cornerRadius = cornerRadius ?? 0
            imageView.layer.borderWidth = borderWidth ?? 0
            imageView.layer.borderColor = borderColor
            imageView.backgroundColor = backgroundColor
            imageView.clipsToBounds = clipsToBounds
            imageView.isUserInteractionEnabled = isUserInteractionEnabled
            return imageView
        }
    }
}
