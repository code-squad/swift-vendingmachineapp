import Foundation

struct Brand {
    
    enum Milk: String, CustomStringConvertible {
        case seoul = "서울우유"
        case bing = "빙그레"
        case namyang = "남양유업"
        
        var description: String {return "\(rawValue)"}
    }
    
    enum SoftDrik: String, CustomStringConvertible {
        case coca = "코카콜라"
        case pepsi = "펩시"
        case lotte = "롯데칠성음료"
        
        var description: String {return "\(rawValue)"}
    }
    
    enum Coffee: String, CustomStringConvertible {
        case maxim = "맥심"
        case lotte = "롯데칠성음료"
        case coca = "코카롤라"
        
        var description: String {return "\(rawValue)"}
    }
}
