import UIKit

class AdminViewController: UIViewController {
    
    private var beverageStackView: AdminBeverageStackView!
    private var vendingMachine = VendingMachine.sharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beverageStackView = AdminBeverageStackView()
        configureBeverageStackView()
        NotificationCenter.default.addObserver(self, selector: #selector(updateBeverageStock(_:)), name: VendingMachine.updateBeverages, object: vendingMachine)
    }
    
    private func updateLabel(_ type: Beverage.Type) {
        let beverageStockList = beverageStackView.stockLabel
        let beverageList = vendingMachine.menuList()
        for index in 0..<beverageStockList.count {
            let beverage = beverageList[index]
            if vendingMachine.typeToInstance(product: type) == beverage {
                beverageStockList[index].text = "\(vendingMachine.beverages.stockOfEach(beverage: beverage))개"
            }
        }
    }
    
    @IBAction func closeButtonTouched(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

//MARK:- Configuration
extension AdminViewController {
    
    private func configureBeverageStackView() {
        view.addSubview(beverageStackView)
        beverageStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        beverageStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
    }
}

//MARK:- @objc Action
extension AdminViewController {
    
    @objc func addBeverageStock(_ sender: AddBeverageButton) {
        let beverage = vendingMachine.compareProductNameToInstance(name: sender.restorationIdentifier!)
        vendingMachine.addBeverage(beverage: beverage!)
    }
    
    @objc func updateBeverageStock(_ notification: Notification) {
        guard let beverageType = notification.userInfo?["BeverageType"] as? Beverage.Type else { return }
        updateLabel(beverageType)
    }
}
