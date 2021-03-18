//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet var drinkImages: [UIImageView]!
    @IBOutlet weak var remainCoinsLabel: UILabel!
    @IBOutlet var drinkStockLabels: [UILabel]!
    @IBOutlet var addDrinkStockButtons: [UIButton]!
    @IBOutlet var chargeButtons: [UIButton]!
    @IBOutlet var purchaseButtons: [UIButton]!
    
    private let vm = VendingMachine.shared
    private let chargeAmount = ChargeUnit.allCases
    private let drinkType = [BananaMilk.self, Cantata.self, Fanta.self]
    private var buttonsForDrinkStock: [UIButton: Drink.Type] = [:]
    private var buttonsForPurchase: [UIButton: Drink.Type] = [:]
    private var buttonsForCharge: [UIButton: Int] = [:]
    private var pointX: CGFloat = 0
    private lazy var scrollViewContentSizeWidth: CGFloat = 0
    private var purchasedDrinkList: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(forName: VendingMachine.updatedDrinkStock, object: nil, queue: .main) { [weak self] _ in
            self?.updateDrinkStockLabels()
        }
        NotificationCenter.default.addObserver(forName: VendingMachine.updatedRemainCoins, object: nil, queue: .main) { [weak self] _ in
            self?.updateRemainCoinsLabel()
        }
        NotificationCenter.default.addObserver(self, selector: #selector(updatePurchasedList(notification:)), name: VendingMachine.updatedPurchaseList, object: nil)
        
        setupDrinkImage()
        updateDrinkStockLabels()
        updateRemainCoinsLabel()
        setButtonsForCharge()
        setButtonsForDrink()
        setPurchasedDrinkListView()
        setPurchasedDrinkList()
    }
    
    func setPurchasedDrinkListView() {
        view.addSubview(purchasedDrinkList)
        purchasedDrinkList.contentSize = CGSize(width: scrollViewContentSizeWidth, height: 100)
        purchasedDrinkList.frame = CGRect(x: 40, y: 400, width: view.frame.width - 40, height: 100)
    }
    
    func getDrinkImageView(for drink: Drink, x: CGFloat) -> UIImageView {
        let imageName: String
        switch ObjectIdentifier(type(of: drink)) {
        case ObjectIdentifier(BananaMilk.self):
            imageName = "banana_milk"
        case ObjectIdentifier(Cantata.self):
            imageName = "cantata_coffee"
        case ObjectIdentifier(Fanta.self):
            imageName = "fanta"
        default:
            return UIImageView()
        }
        let image = UIImageView(image: UIImage(named: imageName))
        image.frame = CGRect(x: x, y: 0, width: 100, height: 100)
        purchasedDrinkList.contentSize.width += 50
        pointX += 50
        return image
    }
    
    func setPurchasedDrinkList() {
        let history = vm.getPurchaseHistory()
        history.forEach {
            self.purchasedDrinkList.addSubview(getDrinkImageView(for: $0, x: pointX))
        }
    }
    
    func setButtonsForDrink() {
        addDrinkStockButtons.forEach {
            $0.addTarget(self, action: #selector(addDrinkStock), for: .touchUpInside)
        }
        
        addDrinkStockButtons.enumerated().forEach {
            buttonsForDrinkStock[$1] = drinkType[$0]
        }
        
        purchaseButtons.forEach {
            $0.addTarget(self, action: #selector(purchase), for: .touchUpInside)
        }
        
        purchaseButtons.enumerated().forEach {
            buttonsForPurchase[$1] = drinkType[$0]
        }
    }
    
    func setButtonsForCharge() {
        chargeButtons.forEach {
            $0.addTarget(self, action: #selector(charge), for: .touchUpInside)
        }
        
        chargeButtons.enumerated().forEach {
            buttonsForCharge[$1] = chargeAmount[$0].rawValue
        }
    }
    
    func setupDrinkImage() {
        drinkImages.forEach { image in
            image.contentMode = .scaleAspectFit
            image.layer.cornerRadius = 15
        }
    }
    
    func updateDrinkStockLabels() {
        let allDrinks = vm.getAllDrinks()
        drinkType.enumerated().forEach { index, type in
            let id = ObjectIdentifier(type)
            drinkStockLabels[index].text = "\(allDrinks[id]?.count ?? 0)개"
        }
    }
    
    func updateRemainCoinsLabel() {
        let remainCoins = vm.checkRemainCoins()
        remainCoinsLabel.text = "\(remainCoins)원"
    }
    
    @objc func updatePurchasedList(notification: Notification) {
        guard let drinkInfo = notification.userInfo?["drinkInfo"] as? Drink else {
            return
        }
        self.purchasedDrinkList.addSubview(getDrinkImageView(for: drinkInfo, x: pointX))
    }
    
    @objc func addDrinkStock(_ sender: UIButton) {
        guard let type = buttonsForDrinkStock[sender], let drink = DrinkFactory.createDrink(for: type) else {
            return
        }
        vm.addStock(for: drink)
    }
    
    @objc func charge(_ sender: UIButton) {
        guard let chargeAmount = buttonsForCharge[sender] else {
            return
        }
        vm.charge(coins: chargeAmount)
    }
    
    @objc func purchase(_ sender: UIButton) {
        guard let drink = buttonsForPurchase[sender] else {
            return
        }
        vm.purchase(drink: drink)
    }
}
