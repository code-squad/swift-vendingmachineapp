import Foundation

class CoinCounter: NSObject, NSCoding, CoinManageable {
    enum Notification {
        static let DidChangeCoin = Foundation.Notification.Name("DidChangeCoin")
    }
    private var coins: Int
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
        NotificationCenter.default.post(name: Notification.DidChangeCoin, object: nil)
    }
    
    public func expended(to coin: Int) {
        self.coins -= coin
    }
}
