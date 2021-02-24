import Foundation

struct Brand {
    
    enum Name: String, CustomStringConvertible {
        case seoul = "서울우유"
        case bing = "빙그레"
        case namyang = "남양유업"
        case coca = "코카콜라"
        case pepsi = "펩시"
        case lotte = "롯데칠성음료"
        case maxim = "맥심"
        
        var description: String {return "\(rawValue)"}
    }
    
}
