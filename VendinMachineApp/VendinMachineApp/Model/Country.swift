
import Foundation

protocol Country : CustomStringConvertible {
    func madeIn() -> Country
}

class Korea : Country {
    private var name: String
    var description: String {
        return self.name
    }
    
    init() {
        self.name = "한국"
    }
    
    func madeIn() -> Country {
        return self
    }
}

class Ghana : Country {
    private var name: String
    var description: String {
        return self.name
    }
    
    init() {
        self.name = "가나"
    }
    
    func madeIn() -> Country {
        return self
    }
}

class Ethiopia : Country {
    private var name: String
    var description: String {
        return self.name
    }
    
    init() {
        self.name = "에티오피아"
    }
    
    func madeIn() -> Country {
        return self
    }
}
