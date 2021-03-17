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
    
    private func updateLabel() {
        let beverageStockList = beverageStackView.stockLabel
        let beverageList = vendingMachine.menuList()
        for index in 0..<beverageStockList.count {
            beverageStockList[index].text = "\(vendingMachine.beverages.stockOfEach(beverage: beverageList[index]))개"
        }
    }
    
    @IBAction func closeButtonTouched(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension AdminViewController {
    
    private func configureBeverageStackView() {
        view.addSubview(beverageStackView)
        beverageStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        beverageStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
    }
}

extension AdminViewController {
    
    @objc func addBeverageStock(_ sender: AddBeverageButton) {
        let beverage = vendingMachine.typeToInstance(product: sender.beverageType)
        vendingMachine.addBeverage(beverage: beverage)
    }
    
    @objc func updateBeverageStock(_ notification: Notification) {
        updateLabel()
    }
}
