import Foundation

public extension NumberFormatter {

    func formatStringAsInteger(from: String) -> String {
        guard let int = Int(from),
        let string = string(from: NSNumber(value: int)) else {
            return ""
        }
        return string
    }
}
