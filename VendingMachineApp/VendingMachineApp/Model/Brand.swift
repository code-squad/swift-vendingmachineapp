import Foundation

struct Brand: Codable {
    
    enum Name: String, CustomStringConvertible, Codable {
        case seoul = "서울우유"
        case bing = "빙그레"
        case namyang = "남양유업"
        case coca = "코카콜라"
        case lotte = "롯데칠성음료"
        case maxim = "맥심"
        
        var description: String {return "\(rawValue)"}
    }
    
}
