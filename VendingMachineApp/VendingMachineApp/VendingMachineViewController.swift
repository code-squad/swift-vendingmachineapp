import UIKit

class VendingMachineViewController: UIViewController {
    
    private let factory = BeverageFactory()
    private var vendingMachine = VendingMachine.sharedInstance()
    private var scrollView = UIScrollView()
    private var stackView = UIStackView()
    private var imageView = UIImageView()
    
    @IBOutlet var stockInfo: [UILabel]!
    @IBOutlet var imagesOfBeverages: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beveragesStockCount()
        balanceInfoLabel()
        setUpImageView()
        purchaedBeverageList()
        configureScrollView()
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
    
    private func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 500).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 600).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        scrollView.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    private func configureStackView() {
        scrollView.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.spacing = -70
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30).isActive = true
    }

    private func purchaedBeverageList() {
        let buyingList = vendingMachine.buyingList()
        stackView.subviews.forEach { $0.removeFromSuperview() }
        for idx in 0..<buyingList.count {
            let image = UIImage(named: buyingList[idx].productName)
            imageView = UIImageView(image: image)
            let imageViewWidth = NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 140)
            let imageViewHeight = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120)
            imageView.addConstraints([imageViewWidth, imageViewHeight])
            scrollView.contentSize.width = stackView.frame.width * CGFloat(1+idx)
            stackView.addArrangedSubview(imageView)
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
