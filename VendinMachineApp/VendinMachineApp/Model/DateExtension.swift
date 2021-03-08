
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
    
    func adding(days: Int) -> Date {
        let day: TimeInterval = 86400
        let added: Date = self.addingTimeInterval(day * Double(days))
        return added
    }
}
