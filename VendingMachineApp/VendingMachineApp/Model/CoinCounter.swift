import Foundation

class CoinCounter: CoinManageable {
    private var coins: Int
    
    init() {
        coins = 0
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
