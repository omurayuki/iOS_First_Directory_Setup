import Foundation

final class StringUtil {

    static func base64ToBase64Url(base64: String?) -> String? {
        return base64?
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
            .replacingOccurrences(of: "=", with: "")
    }

}

public extension String {

    static var blank: String {
        return ""
    }
    
    func nonEmptyValue(or fallback: String) -> String {
        return isEmpty ? fallback : self
    }

    static func hexStringFromData(input: NSData) -> String {
        var bytes = [UInt8](repeating: 0, count: input.length)
        input.getBytes(&bytes, length: input.length)

        var hexString = ""
        for byte in bytes {
            hexString += String(format: "%02x", UInt8(byte))
        }
        return hexString
    }

    func htmlAttributedString(attributes: [NSAttributedString.Key: Any]? = .none) -> NSAttributedString? {
        guard let data = self.data(using: String.Encoding.utf16, allowLossyConversion: false) else { return .none }

        guard let html = try? NSMutableAttributedString(
            data: data,
            options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: .none) else { return .none }

        html.setAttributes(attributes, range: NSRange(0..<html.length))

        return html
    }

}

public extension NSAttributedString {
    static var blank: NSAttributedString {
        return NSAttributedString(string: String.blank)
    }
}

public extension Optional where Wrapped == String {
    var isEmpty: Bool {
        guard let me = self else { return true }
        return me.isEmpty
    }
    
    func nonEmptyValue(or fallback: String) -> String {
        return self.isEmpty ? fallback : self!
    }
    
    var orBlank: String {
        return self ?? String.blank
    }
}

extension String {
    /** Match a string based on regular expression pattern. */
    func matching(pattern: String) -> Bool {

        let length = self.utf8.count
        let regularExpression: NSRegularExpression

        let fullRange = NSMakeRange(0, length)
        do {
            regularExpression = try NSRegularExpression(pattern: pattern)
        } catch let error {
            Logger.error(error.localizedDescription)
            return false
        }

        let firstMatch = regularExpression.firstMatch(in: self, options: [], range: fullRange)
        return firstMatch != nil
    }
}
