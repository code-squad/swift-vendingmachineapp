import Foundation

class CoinCounter: NSObject, NSCoding, CoinManageable {
    private var coins: Int
    
    override init() {
        coins = 0
    }
    
    required init?(coder: NSCoder) {
        self.coins = coder.decodeInteger(forKey: "coin")
    }
        
    func encode(with coder: NSCoder) {
        coder.encode(self.coins, forKey: "coin")
    }
    
    public func inserted(_ coin: Int) {
        self.coins += coin
    }
    
    public func CheckCoins(handle: (Int) -> ()){
        handle(coins)
    }
    
    public func expended(to coin: Int) {
        self.coins -= coin
    }
}
