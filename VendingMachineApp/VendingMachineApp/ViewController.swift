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
    
    init() {
        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        stockViews = []
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        stockViews = []
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(receiveaddNotification), name: NSNotification.Name("redrawImageandLabel"), object: nil)
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
    
    func drawStockViews(){
        for i in 0..<StockView.stockTitle.allCases.count{
            let viewCGRECT : CGRect!
            if i < 4 {
                viewCGRECT = CGRect(x: i * 170, y: 40, width: 140, height: 200)
            }
            else {
                viewCGRECT = CGRect(x: (i - 4) * 170, y: 280, width: 140, height: 200)
            }
            let stockview : StockView = StockView.init(frame: viewCGRECT, ImageName: StockView.stockTitle.allCases[i])
            stockview.setaddButtontag(tag: i)
            stockview.setpurchaseButtontag(tag: i)
            stockViews.append(stockview)
            view.addSubview(stockview)
        }
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
        //currentMoneyLabel.text = vendingMachine.drawCurrentMoney()
    }
}
