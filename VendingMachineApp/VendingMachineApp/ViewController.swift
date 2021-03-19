//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/24.
//

import UIKit

@objc class ViewController: UIViewController {
    private var vendingMachine : VendingMachine!
    private let appDelegate : AppDelegate
    private var stockViews : [StockView]
    private var moneyView : MoneyView!
    private var boughtScrollview : boughtView
    
    init() {
        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        stockViews = []
        boughtScrollview = boughtView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        stockViews = []
        boughtScrollview = boughtView.init(frame: CGRect(x: 30, y: 550, width: 650, height: 120))
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(receiveaddNotification), name: NSNotification.Name("redrawImageandLabel"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(drawboughtImage), name: NSNotification.Name("purchaseBeverage"), object: nil)
        self.vendingMachine = appDelegate.vendingMachine
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = .systemGray3
        drawStockViews()
        NotificationCenter.default.post(name: NSNotification.Name("redrawImageandLabel"), object: nil)
        super.viewWillAppear(false)
    }
    
    @objc func receiveaddNotification(){
        redrawMoneyandStock()
    }
    
    @objc func drawboughtImage(_ notification: Notification){
        guard let index : Int = notification.userInfo?["ImageIndex"] as? Int else { return }
        boughtScrollview.makeBoughtImageView(ImageTitle: StockView.stockTitle.allCases[index])
    }
    
    func drawStockViews(){
        for i in 0..<StockView.stockTitle.allCases.count{
            let stockviewCGRect : CGRect!
            if i < 4 {
                stockviewCGRect = CGRect(x: i * 170, y: 40, width: 140, height: 200)
            }
            else {
                stockviewCGRect = CGRect(x: (i - 4) * 170, y: 280, width: 140, height: 200)
            }
            let stockview : StockView = StockView.init(frame: stockviewCGRect, ImageName: StockView.stockTitle.allCases[i])
            stockview.setaddButtontag(tag: i)
            stockview.setpurchaseButtontag(tag: i)
            stockViews.append(stockview)
            view.addSubview(stockview)
        }
        let moneyViewCGRect : CGRect = CGRect(x: 750, y: 80, width: 200, height: 150)
        moneyView = MoneyView.init(frame: moneyViewCGRect)
        view.addSubview(moneyView)
        view.addSubview(boughtScrollview)
    }
    
    
//    func drawboughtList(beverageImage : UIImageView){
//        boughtList.append(beverageImage)
//        for i in 0..<boughtList.count{
//            if i == 0{
//                boughtList[i].leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
//                boughtList[i].centerYAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
//            }
//            else {
//                boughtList[i-1].leftAnchor.constraint(equalTo: boughtList[i-1].leftAnchor, constant: 20).isActive = true
//                boughtList[i-1].leftAnchor.constraint(equalTo: boughtList[i-1].leftAnchor, constant: 20).isActive = true
//            }
//        }
//    }
    
    func redrawMoneyandStock(){
        for i in 0..<StockView.stockTitle.allCases.count{
            stockViews[i].updateStocklabel(stockCount: vendingMachine.drawStockLabel(beverage: vendingMachine.sendBeverageInFactory(index: i)))
        }
        moneyView.updateMoeny(money: vendingMachine.drawCurrentMoney())
    }
}
