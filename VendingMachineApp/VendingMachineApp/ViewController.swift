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
    
    var vm: UserMode?
    private let drinkType = [BananaMilk.self, Cantata.self, Fanta.self]
    private var drinkViews: [DrinkStackView] = []
    private var buttonsForCharge: [UIButton: Int] = [:]
    private var purchaseButtonsForDrink: [UIButton: Drink.Type] = [:]
    private let chargeAmount = ChargeUnit.allCases
    private var pointX: CGFloat = 0
    private lazy var scrollViewContentSizeWidth: CGFloat = 0
    private var purchasedDrinkList: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vm = vm as? VendingMachine,
              let vc = segue.destination as? AdminViewController else {
            return
        }
        vc.vm = vm
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        drinkType.forEach {
            let drinkStackView = makeDrinkStackView(for: $0)
            drinkStackView.addArrangedSubview(makePurchaseButton(for: $0))
            drinkList.addArrangedSubview(drinkStackView)
            drinkViews.append(drinkStackView)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateStockLabel), name: VendingMachine.NotificationName.updatedDrinkStock, object: vm)
        NotificationCenter.default.addObserver(self, selector: #selector(updateCoinLabel), name: VendingMachine.NotificationName.updatedRemainCoins, object: vm)
        NotificationCenter.default.addObserver(self, selector: #selector(updatePurchasedList), name: VendingMachine.NotificationName.updatedPurchaseList,
                                               object: vm)
        
        setPurchasedDrinkListView()
        setPurchasedDrinkList()
        setButtonsForCharge()
        updateCoinLabel()
        
        guard let vm = vm as? VendingMachine else {
            return
        }
        vm.post()
    }
    
    func makePurchaseButton(for drink: Drink.Type) -> UIButton {
        let button = UIButton()
        button.setTitle("구매", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(purchase), for: .touchUpInside)
        purchaseButtonsForDrink[button] = drink
        return button
    }
    
    func makeDrinkStackView(for drink: Drink.Type) -> DrinkStackView {
        let drinkView = DrinkStackView()
        drinkView.configure(for: drink)
        return drinkView
    }

    func setPurchasedDrinkListView() {
        view.addSubview(purchasedDrinkList)
        purchasedDrinkList.contentSize = CGSize(width: scrollViewContentSizeWidth, height: 100)
        purchasedDrinkList.frame = CGRect(x: 40, y: 400, width: view.frame.width - 40, height: 100)
    }
    
    func setPurchasedDrinkList() {
        guard let vm = vm as? VendingMachine else { return }
        vm.getPurchaseHistory().forEach {
            self.purchasedDrinkList.addSubview(getDrinkImageView(for: $0, x: pointX))
        }
    }
        
    func getDrinkImageView(for drink: Drink, x: CGFloat) -> UIImageView {
        let name: String = drink.imageName
        let image = UIImageView(image: UIImage(named: name))
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
       
    @objc func purchase(_ sender: UIButton) {
        guard let drink = purchaseButtonsForDrink[sender] else {
            return
        }
        VendingMachine.shared.purchase(for: drink)
    }
    
    @objc func updateStockLabel(notification: Notification) {
        drinkViews.forEach {
            $0.updateStockLabel(notification: notification)
        }
    }

    @objc func updateCoinLabel() {
        guard let vm = vm as? VendingMachine else {
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
