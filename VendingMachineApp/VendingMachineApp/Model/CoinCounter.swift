import Foundation

class CoinCounter: NSObject, NSCoding, CoinManageable {
    @Published private var coins: Int
    var coinPublisher: Published<Int>.Publisher { $coins }
    
    private(set) var leftCoins: Int {
        get { return coins }
        set { coins = newValue }
    }
    
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
    
    public func expended(to coin: Int) {
        self.coins -= coin
    }
}
