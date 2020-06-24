import UIKit.UIColor

extension UIColor {
    
    func scaled(scale: CGFloat, scaledTint: CGFloat = 0.15) -> UIColor {

        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        let scaledRed: CGFloat = alpha == 0 ? scaledTint : red * scale
        let scaledGreen: CGFloat = alpha == 0 ? scaledTint :green * scale
        let scaledBlue: CGFloat = alpha == 0 ? scaledTint :blue * scale

        return UIColor(red: scaledRed, green: scaledGreen, blue: scaledBlue, alpha: alpha == 0 ? scaledTint : alpha)
    }
}
