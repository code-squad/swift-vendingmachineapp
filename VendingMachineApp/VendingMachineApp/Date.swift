import Foundation

extension Date {
    
    /// "yyyyMMdd" 형태의 문자열로부터 날짜를 생성합니다.
    init?(_ string: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        guard let date = formatter.date(from: string) else {
            return nil
        }
        self = date
    }
    
    /// 분으로부터 초를 생성합니다.
    static func timeInterval(fromMinutes minutes: Int) -> TimeInterval {
        return TimeInterval(minutes) * 60
    }
    
    /// 시간으로부터 초를 생성합니다.
    static func timeInterval(fromHours hours: Int) -> TimeInterval {
        let minutes = hours * 60
        return timeInterval(fromMinutes: minutes)
    }
    
    /// 일로부터 초를 생성합니다.
    static func timeInterval(fromDays days: Int) -> TimeInterval {
        let hours = days * 24
        return timeInterval(fromHours: hours)
    }
    
}
