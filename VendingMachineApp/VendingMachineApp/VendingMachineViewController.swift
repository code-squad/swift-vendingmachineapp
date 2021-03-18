import UIKit

class VendingMachineViewController: UIViewController {
    
    private let factory = BeverageFactory()
    private var vendingMachine = VendingMachine.sharedInstance()
    
    private var purchasedBeveragesScrollView: PurchasedScrollView!
    private var purchasedBeveragesStackView: PurchasedStackView!
    private var eachPurchasedBeverageImageView = UIImageView()
    
    @IBOutlet var stockInfo: [UILabel]!
    @IBOutlet var imagesOfBeverages: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        purchasedBeveragesStackView = PurchasedStackView()
        purchasedBeveragesScrollView = PurchasedScrollView()
        beveragesStockCount()
        balanceInfoLabel()
        setUpImageView()
        configureScrollView()
        configureStackView()
        NotificationCenter.default.addObserver(self, selector: #selector(updateInsertedMoney(notification:)), name: VendingMachine.updateInsertedMoney, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBeverages(notification:)), name: VendingMachine.updateBeverages, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updatePurchased(notification:)), name: VendingMachine.updatePurchased, object: nil)
    }
    
    private func setUpImageView() {
        for beverage in imagesOfBeverages {
            beverage.layer.cornerRadius = beverage.frame.height / 4
        }
    }
    
    private func purchaedBeverageList() {
        guard let beverage = vendingMachine.lastPurchasedBeverage() else { purchasedBeveragesStackView.subviews.forEach{ $0.removeFromSuperview() }
            return
        }
        let image = UIImage(named: beverage.productName)
        eachPurchasedBeverageImageView = UIImageView(image: image)
        let imageViewWidth = NSLayoutConstraint(item: eachPurchasedBeverageImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 140)
        let imageViewHeight = NSLayoutConstraint(item: eachPurchasedBeverageImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120)
        eachPurchasedBeverageImageView.addConstraints([imageViewWidth, imageViewHeight])
        purchasedBeveragesScrollView.contentSize.width = purchasedBeveragesStackView.frame.width * CGFloat(1 * purchasedBeveragesStackView.subviews.count)
        purchasedBeveragesStackView.addArrangedSubview(eachPurchasedBeverageImageView)
    }
    
    private func beveragesStockCount() {
        let allMenuList = vendingMachine.menuList()
        for idx in 0..<allMenuList.count {
            stockInfo[idx].text = "\(vendingMachine.stockOf(beverage: allMenuList[idx]))개"
        }
    }
    
    private func balanceInfoLabel() {
        let balance = vendingMachine.insertedMoney
        stockInfo[6].text = "잔액:\(String(describing: balance))"
    }
    
}

//MARK:- @IBAction BalanceAndBeverage
extension VendingMachineViewController {
    
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
    @IBAction func buyBeverageButtonTouched(_ sender: UIButton) {
        let beverage = vendingMachine.buttonToBeverageType(name: sender.restorationIdentifier!)
        vendingMachine.buyBeverage(product: beverage)
    }
    
}

//MARK:- @objc Action
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

//MARK:- configuration
extension VendingMachineViewController {
    
    private func configureScrollView() {
        view.addSubview(purchasedBeveragesScrollView)
        purchasedBeveragesScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 500).isActive = true
        purchasedBeveragesScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 600).isActive = true
    }
    
    private func configureStackView() {
        purchasedBeveragesScrollView.addSubview(purchasedBeveragesStackView)
        purchasedBeveragesStackView.topAnchor.constraint(equalTo: purchasedBeveragesScrollView.topAnchor, constant: 30).isActive = true
        purchasedBeveragesStackView.leadingAnchor.constraint(equalTo: purchasedBeveragesScrollView.leadingAnchor, constant: 30).isActive = true
    }
}
