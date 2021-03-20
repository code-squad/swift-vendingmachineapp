//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var drinkList: UIStackView!
    @IBOutlet weak var chargedCoins: UILabel!
    @IBOutlet var chargeButtons: [UIButton]!
    
    var vm: VendingMachine?
    private let drinkType = [BananaMilk.self, Cantata.self, Fanta.self]
    private var drinkViews: [DrinkStackView] = []
    private var buttonsForCharge: [UIButton: Int] = [:]
    private let chargeAmount = ChargeUnit.allCases
    private var pointX: CGFloat = 0
    private lazy var scrollViewContentSizeWidth: CGFloat = 0
    private var purchasedDrinkList: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        drinkType.forEach {
            let drinkView = DrinkStackView()
            drinkView.configure(for: $0)
            drinkList.addArrangedSubview(drinkView)
            drinkViews.append(drinkView)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateStockLabel), name: VendingMachine.NotificationName.updatedDrinkStock, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateCoinLabel), name: VendingMachine.NotificationName.updatedRemainCoins, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updatePurchasedList), name: VendingMachine.NotificationName.updatedPurchaseList,
                                               object: nil)
        
        setPurchasedDrinkListView()
        setPurchasedDrinkList()
        setButtonsForCharge()
        updateCoinLabel()
        vm?.post()
    }
    
    func setPurchasedDrinkListView() {
        view.addSubview(purchasedDrinkList)
        purchasedDrinkList.contentSize = CGSize(width: scrollViewContentSizeWidth, height: 100)
        purchasedDrinkList.frame = CGRect(x: 40, y: 400, width: view.frame.width - 40, height: 100)
    }
    
    func setPurchasedDrinkList() {
        guard let history = vm?.getPurchaseHistory() else { return }
        history.forEach {
            self.purchasedDrinkList.addSubview(getDrinkImageView(for: $0, x: pointX))
        }
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
    
    func setButtonsForCharge() {
        chargeButtons.enumerated().forEach {
            buttonsForCharge[$1] = chargeAmount[$0].rawValue
        }
    }
        
    @objc func updateStockLabel(notification: Notification) {
        drinkViews.forEach {
            $0.updateStockLabel(notification: notification)
        }
    }

    @objc func updateCoinLabel() {
        guard let vm = vm else {
            return
        }
        chargedCoins.text = "\(vm.checkRemainCoins())원"
    }
    
    @objc func updatePurchasedList(notification: Notification) {
        guard let drinkInfo = notification.userInfo?["drinkInfo"] as? Drink else {
            return
        }
        self.purchasedDrinkList.addSubview(getDrinkImageView(for: drinkInfo, x: pointX))
    }
    
    // MARK: - IBActions
    @IBAction func charge(_ sender: UIButton) {
        guard let chargeAmount = buttonsForCharge[sender] else {
            return
        }
        VendingMachine.shared.charge(coins: chargeAmount)
    }
}
