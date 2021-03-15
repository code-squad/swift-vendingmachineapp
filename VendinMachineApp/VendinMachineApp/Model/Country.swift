
import Foundation

protocol Country : CustomStringConvertible {
    func nameOfCountry() -> String
}

class CountryOfOrigin : NSObject, Country, NSCoding{
    private var name: String
    
    init(name: String) {
        self.name = name
    }
    
    required init?(coder: NSCoder) {
        self.name = coder.decodeObject(forKey: "countryOfOrigin") as! String
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.name, forKey: "countryOfOrigin")
    }
    
    func nameOfCountry() -> String {
        return self.name
    }
}
