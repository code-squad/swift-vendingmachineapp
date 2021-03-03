
import Foundation

protocol Package {
    func isTransparentMaterial() -> Bool
}

class Can : Package {
    func isTransparentMaterial() -> Bool {
        return false
    }
}

class Plastic : Package {
    func isTransparentMaterial() -> Bool {
        return true
    }
}
