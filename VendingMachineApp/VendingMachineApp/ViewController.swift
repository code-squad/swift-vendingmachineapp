//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/24.
//

import UIKit

class ViewController: UIViewController {
    private var BeverageButtons : [UIButton]
    private var MoneyaddButtons : [UIButton]
    private var beverageImageViews : [UIImageView]
    private var currentMoneyLabel : UILabel
    private var stockLabel : [UILabel]
    private let vendingMachine : VendingMachine
    
    init() {
        self.BeverageButtons = []
        self.MoneyaddButtons = []
        self.beverageImageViews = []
        self.currentMoneyLabel = UILabel()
        self.stockLabel = []
        self.vendingMachine = VendingMachine.init(Money: Money.init(money: 0))
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.BeverageButtons = []
        self.MoneyaddButtons = []
        self.beverageImageViews = []
        self.currentMoneyLabel = UILabel()
        self.stockLabel = []
        self.vendingMachine = VendingMachine.init(Money: Money.init(money: 0))
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initBeverageButtons()
        initBeverageImages()
        initvendingMachineBeverageLabels()
        initMoneyaddButtons()
        initCurrentMoneyLabel()
        super.viewWillAppear(false)
    }
    
    func addbeverageaddButton(index : Int) {
        BeverageButtons[index].setTitle("추가", for: .normal)
        BeverageButtons[index].setTitleColor(.systemBlue, for: .normal)
        view.addSubview(BeverageButtons[index])
        BeverageButtons[index].translatesAutoresizingMaskIntoConstraints = false
        BeverageButtons[index].widthAnchor.constraint(equalToConstant: 100).isActive = true
        BeverageButtons[index].heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func initBeverageButtons(){
        BeverageButtons = vendingMachine.makeButtonBeverageList()
        for i in 0..<BeverageButtons.count{
            if i == 0 {//standard!
                addbeverageaddButton(index: i)
                BeverageButtons[i].centerXAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
                BeverageButtons[i].centerYAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
            }
            else if i > 3 {
                addbeverageaddButton(index: i)
                BeverageButtons[i].centerXAnchor.constraint(equalTo: BeverageButtons[0].centerXAnchor, constant: 200 * CGFloat(i-4)).isActive = true
                BeverageButtons[i].centerYAnchor.constraint(equalTo: BeverageButtons[0].bottomAnchor, constant: 300).isActive = true
            }
            else {
                addbeverageaddButton(index: i)
                BeverageButtons[i].centerXAnchor.constraint(equalTo: BeverageButtons[0].centerXAnchor, constant: 200 * CGFloat(i)).isActive = true
                BeverageButtons[i].centerYAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
            }
            BeverageButtons[i].tag = i
            BeverageButtons[i].addTarget(self, action: #selector(addBeverage(sender:)), for: .touchUpInside)
        }
    }
    
    func initBeverageImages(){
        view.backgroundColor = .systemGray
        beverageImageViews = vendingMachine.makebeverageImage()
        for i in 0..<beverageImageViews.count{ //standard
            beverageImageViews[i].backgroundColor = UIColor.white
            view.addSubview(beverageImageViews[i])
            beverageImageViews[i].translatesAutoresizingMaskIntoConstraints = false
            beverageImageViews[i].widthAnchor.constraint(equalToConstant: 150).isActive = true
            beverageImageViews[i].heightAnchor.constraint(equalToConstant: 150).isActive = true
            beverageImageViews[i].contentMode = .scaleAspectFit
            beverageImageViews[i].layer.cornerRadius = 10
            beverageImageViews[i].centerXAnchor.constraint(equalTo: BeverageButtons[i].centerXAnchor).isActive = true
            beverageImageViews[i].topAnchor.constraint(equalTo: BeverageButtons[i].centerYAnchor, constant: 30).isActive = true
        }
    }
    
    func initvendingMachineBeverageLabels(){
        stockLabel = vendingMachine.makeBeverageLabel()
        for i in 0..<stockLabel.count{
            stockLabel[i].text = "0개"
            stockLabel[i].textAlignment = .center
            stockLabel[i].translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(stockLabel[i])
            stockLabel[i].widthAnchor.constraint(equalToConstant: 50).isActive = true
            stockLabel[i].heightAnchor.constraint(equalToConstant: 25).isActive = true
            stockLabel[i].centerXAnchor.constraint(equalTo: beverageImageViews[i].centerXAnchor).isActive = true
            stockLabel[i].topAnchor.constraint(equalTo: beverageImageViews[i].bottomAnchor, constant: 10).isActive = true
        }
    }
    
    func initMoneyaddButtons(){
        for i in 0..<2 {
            MoneyaddButtons.append(UIButton())
            MoneyaddButtons[i].translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(MoneyaddButtons[i])
            MoneyaddButtons[i].setTitleColor(.systemBlue, for: .normal)
            MoneyaddButtons[i].widthAnchor.constraint(equalToConstant: 75).isActive = true
            MoneyaddButtons[i].heightAnchor.constraint(equalToConstant: 50).isActive = true
            MoneyaddButtons[i].topAnchor.constraint(equalTo: beverageImageViews[0].topAnchor).isActive = true
            MoneyaddButtons[i].tag = i
            MoneyaddButtons[i].addTarget(self, action: #selector(addMoney(sender:)), for: .touchUpInside)
        }
        MoneyaddButtons[0].leftAnchor.constraint(equalTo: beverageImageViews[3].rightAnchor, constant: 35).isActive = true
        MoneyaddButtons[1].leftAnchor.constraint(equalTo: MoneyaddButtons[0].rightAnchor, constant: 25).isActive = true
        MoneyaddButtons[0].setTitle("+1000원", for: .normal)
        MoneyaddButtons[1].setTitle("+5000원", for: .normal)
    }
    
    func initCurrentMoneyLabel() -> Void {
        currentMoneyLabel.text = "0원"
        currentMoneyLabel.textAlignment = .center
        currentMoneyLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(currentMoneyLabel)
        currentMoneyLabel.widthAnchor.constraint(equalToConstant: 75).isActive = true
        currentMoneyLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        currentMoneyLabel.leftAnchor.constraint(equalTo: MoneyaddButtons[0].centerXAnchor).isActive = true
        currentMoneyLabel.centerYAnchor.constraint(equalTo: MoneyaddButtons[0].bottomAnchor, constant: 20).isActive = true
    }
    
    @objc func addBeverage(sender : UIButton) {
        let tempBeverage = vendingMachine.sendBeverageInFactory(index: sender.tag)
        vendingMachine.addBeverage(beverage: tempBeverage)
        stockLabel[sender.tag].text = "\(vendingMachine.drawStockLabel(beverage: tempBeverage))개"
    }
    
    @objc func addMoney(sender: UIButton){
        if let tempMoney = Money.moneyUnit.init(index: sender.tag) {
            vendingMachine.addMoney(money: Money.init(money: tempMoney.rawValue))
            vendingMachine.drawCurrentMoney(moneyLabel : currentMoneyLabel)
        }
    }
}
