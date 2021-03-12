import UIKit

class VendingMachineViewController: UIViewController {
    
    private let factory = BeverageFactory()
    private var vendingMachine = VendingMachine.sharedInstance()
    private var purchasedImageView = UIStackView()
    
    @IBOutlet var stockInfo: [UILabel]!
    @IBOutlet var imagesOfBeverages: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beveragesStockCount()
        balanceInfoLabel()
        setUpImageView()
        purchaedBeverageList()
        configureStackView()
        view.backgroundColor = UIColor.systemGray5
        NotificationCenter.default.addObserver(self, selector: #selector(updateInsertedMoney(notification:)), name: .updateInsertedMoney, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBeverages(notification:)), name: .updateBeverages, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updatePurchased(notification:)), name: .updatePurchased, object: nil)
    }
    
    
    private func setUpImageView() {
        for beverage in imagesOfBeverages {
            beverage.layer.cornerRadius = beverage.frame.height / 4
        }
    }
    
    private func configureStackView() {
        view.addSubview(purchasedImageView)
        purchasedImageView.axis = .horizontal
        purchasedImageView.spacing = -70
        purchasedImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 500).isActive = true
        purchasedImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 600).isActive = true
        purchasedImageView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func purchaedBeverageList() {
        let buyingList = vendingMachine.buyingList()
        purchasedImageView.subviews.forEach { $0.removeFromSuperview() }
        var xPoint = 700
        for beverage in buyingList {
            let image = UIImage(named: beverage.productName)
            let imageView = UIImageView(image: image)
            let imageViewWidth = NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 140)
            let imageViewHeight = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120)
            imageView.addConstraints([imageViewWidth, imageViewHeight])
            purchasedImageView.addArrangedSubview(imageView)
            xPoint+=70
        }
    }
    
}


extension VendingMachineViewController {
    
    private func beveragesStockCount() {
        let allMenuList = vendingMachine.menuList()
        for idx in 0..<allMenuList.count {
            stockInfo[idx].text = "\(vendingMachine.stockOf(beverage: allMenuList[idx]))개"
        }
    }
    
    @IBAction func buttonForChocolateMilkStock(_ sender: Any) {
        vendingMachine.addBeverage(beverage: factory.chocoMilk)
    }
    
    
    @IBAction func buttonForStrawBerryMilkStock(_ sender: Any) {
        vendingMachine.addBeverage(beverage: factory.strawberryMilk)
    }

    
    @IBAction func buttonForCokeStock(_ sender: Any) {
        vendingMachine.addBeverage(beverage: factory.coke)
    }
    
    
    @IBAction func buttonForSpriteStock(_ sender: Any) {
        vendingMachine.addBeverage(beverage: factory.sprite)
    }
    
    @IBAction func buttonForTOPStock(_ sender: Any) {
        vendingMachine.addBeverage(beverage: factory.top)
    }
    
    @IBAction func buttonForCantataStock(_ sender: Any) {
        vendingMachine.addBeverage(beverage: factory.cantata)
    }
    
    private func balanceInfoLabel() {
        let balance = vendingMachine.insertedMoney
        stockInfo[6].text = "잔액:\(String(describing: balance))"
    }
    
    @IBAction func button1000ForBalance(_ sender: Any) {
        vendingMachine.getTheMoney(from: 1000)
    }
    
    @IBAction func button5000ForBalance(_ sender: Any) {
        vendingMachine.getTheMoney(from: 5000)
    }
    
    @IBAction func resetAllStockInfo(_ sender: Any) {
        vendingMachine.resetBeverages()
        vendingMachine.resetInsertedMoney()
        vendingMachine.resetPurchased()
    }
    
}

extension VendingMachineViewController {
    @IBAction func buyChocoMilkButtonTouched(_ sender: Any) {
        vendingMachine.buyBeverage(product: ChocolateMilk())
    }
    
    @IBAction func buyStrawberryMilkButtonTouched(_ sender: Any) {
        vendingMachine.buyBeverage(product: StrawBerryMilk())
    }
    
    @IBAction func buyCokeButtonTouched(_ sender: Any) {
        vendingMachine.buyBeverage(product: Coke())
    }
    
    
    @IBAction func buySpriteButtonTouched(_ sender: Any) {
       vendingMachine.buyBeverage(product: Sprite())
    }
    
    @IBAction func buyTopButtonTouched(_ sender: Any) {
        vendingMachine.buyBeverage(product: Top())
    }
    
    
    @IBAction func buyCantataButtonTouched(_ sender: Any) {
        vendingMachine.buyBeverage(product: Cantata())
    }
    
}

extension VendingMachineViewController {
    @objc private func updateInsertedMoney(notification: Notification) {
        balanceInfoLabel()
    }
    @objc private func updateBeverages(notification: Notification) {
        beveragesStockCount()
    }
    @objc private func updatePurchased(notification: Notification) {
        purchaedBeverageList()
    }
}
