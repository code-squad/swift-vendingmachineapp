import UIKit

class AdminViewController: UIViewController {
    
    private var beverageStackView: AdminBeverageStackView!
    private var vendingMachine = VendingMachine.sharedInstance()
    private var pieChart = PieGraphView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beverageStackView = AdminBeverageStackView()
        configureBeverageStackView()
        NotificationCenter.default.addObserver(self, selector: #selector(updateBeverageStock(_:)), name: VendingMachine.updateBeverages, object: vendingMachine)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpPieChart()
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
    
    private func setUpPieChart() {
        
        configurePieChartView()
        let stockList = vendingMachine.beverageData()
        if canDrawPieChart(stockList) { return }
        
        let beverageData = stockList.map{CGFloat($0)}
        let systemColor = [UIColor.systemRed, UIColor.systemBlue, UIColor.systemPink, UIColor.systemTeal, UIColor.systemGreen, UIColor.systemYellow]
        pieChart.segments.removeAll()
        
        for index in 0..<beverageData.count {
            pieChart.segments.append(Segment(color: systemColor[index], value: beverageData[index]))
        }
        
    }
    
    private func canDrawPieChart(_ data: [Int]) -> Bool {
        return data.reduce(0, +) == 0
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
    
    private func configurePieChartView() {
        view.addSubview(pieChart)
        pieChart.frame = CGRect(x: 300, y: 300, width: 300, height: 300)
    }
}

//MARK:- @objc Action
extension AdminViewController {
    
    @objc func addBeverageStock(_ sender: AddBeverageButton) {
        let beverage = vendingMachine.buttonToBeverageType(name: sender.restorationIdentifier!)
        vendingMachine.addBeverage(beverage: beverage)
    }
    
    @objc func updateBeverageStock(_ notification: Notification) {
        guard let beverageType = notification.userInfo?["BeverageType"] as? Beverage.Type else { return }
        updateLabel(beverageType)
        setUpPieChart()
    }
}
