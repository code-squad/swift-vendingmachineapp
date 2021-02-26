
import Foundation

extension Date {
    
    static func manufacturedFormat() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter
    }
    
    func toString(with dateFormat: DateFormatter) -> String {
        let dateFormatter = dateFormat
        return dateFormatter.string(from: self)
    }
}
