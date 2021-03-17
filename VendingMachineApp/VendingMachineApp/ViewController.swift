//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/24.
//

import UIKit

class ViewController: UIViewController {
    private var vendingMachine : VendingMachine!
    private let appDelegate : AppDelegate
    private var childView : [UIView]
    private var BeverageButtons : [UIButton]
    private var MoneyaddButtons : [UIButton]
    private var beverageImageViews : [UIImageView]
    private var currentMoneyLabel : UILabel
    private var stockLabel : [UILabel]
    private var buyButton : [UIButton]
    private var UIImagetitles : [String]
    
    init() {
        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.childView = []
        self.BeverageButtons = []
        self.MoneyaddButtons = []
        self.beverageImageViews = []
        self.currentMoneyLabel = UILabel()
        self.stockLabel = []
        self.buyButton = []
        self.UIImagetitles = ["BananaMilk", "StrawberryMilk", "somersby", "coke", "HOT6", "Monster", "CaffeMocha", "CafeLatte"]
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.childView = []
        self.BeverageButtons = []
        self.MoneyaddButtons = []
        self.beverageImageViews = []
        self.currentMoneyLabel = UILabel()
        self.stockLabel = []
        self.buyButton = []
        self.UIImagetitles = ["BananaMilk", "StrawberryMilk", "somersby", "coke", "HOT6", "Monster", "CaffeMocha", "CafeLatte"]
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(receiveaddNotification), name: NSNotification.Name("addSomething"), object: nil)
        self.vendingMachine = appDelegate.vendingMachine
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        drawstockViews()
        initMoneyaddButtons()
        initCurrentMoneyLabel()
        redrawMoneyandStock()
        super.viewWillAppear(false)
    }
    
    @objc func receiveaddNotification(){
        redrawMoneyandStock()
    }
    
    func drawstockViews(){
        view.backgroundColor = .systemGray3
        for i in 0..<UIImagetitles.count{
            childView.append(initChildView(imageName: UIImagetitles[i]))
            view.addSubview(childView[i])
            if i == 0 {
                childView[i].centerXAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
                childView[i].centerYAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
            }
            else if i > 3 {
                childView[i].centerXAnchor.constraint(equalTo: childView[0].centerXAnchor, constant: 200 * CGFloat(i-4)).isActive = true
                childView[i].centerYAnchor.constraint(equalTo: childView[0].bottomAnchor, constant: 150).isActive = true
            }
            else {
                childView[i].centerXAnchor.constraint(equalTo: childView[0].centerXAnchor, constant: 200 * CGFloat(i)).isActive = true
                childView[i].topAnchor.constraint(equalTo: childView[0].topAnchor).isActive = true
            }
            BeverageButtons[i].tag = i
            BeverageButtons[i].addTarget(self, action: #selector(addBeverage(sender:)), for: .touchUpInside)
        }
    }
    
    func addButtonTo(parentView : UIView, constraintView : UIView, buttonTitle : String, constant: CGFloat) -> UIButton{
        let tempBeverageBtn : UIButton = UIButton()
        tempBeverageBtn.setTitle(buttonTitle, for: .normal)
        tempBeverageBtn.setTitleColor(.systemBlue, for: .normal)
        parentView.addSubview(tempBeverageBtn)
        tempBeverageBtn.translatesAutoresizingMaskIntoConstraints = false
        tempBeverageBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        tempBeverageBtn.heightAnchor.constraint(equalToConstant: 25).isActive = true
        tempBeverageBtn.centerXAnchor.constraint(equalTo: constraintView.centerXAnchor).isActive = true
        tempBeverageBtn.topAnchor.constraint(equalTo: constraintView.topAnchor, constant: constant).isActive = true
        return tempBeverageBtn
    }
    
    func addImageTo(parentView : UIView, constraintView : UIView, imageName: String) -> UIImageView{
        let tempBeverageImage : UIImageView = UIImageView(image: UIImage(named: imageName))
        tempBeverageImage.backgroundColor = .white
        tempBeverageImage.widthAnchor.constraint(equalToConstant: 140).isActive = true
        tempBeverageImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        parentView.addSubview(tempBeverageImage)
        tempBeverageImage.translatesAutoresizingMaskIntoConstraints = false
        tempBeverageImage.centerXAnchor.constraint(equalTo: constraintView.centerXAnchor).isActive = true
        tempBeverageImage.topAnchor.constraint(equalTo: constraintView.bottomAnchor, constant: 5).isActive = true
        tempBeverageImage.contentMode = .scaleAspectFit
        tempBeverageImage.layer.cornerRadius = 10
        return tempBeverageImage
    }
    
    func addLabelTo(parentView : UIView, constraintView : UIView) -> UILabel{
        let tempstockLabel : UILabel = UILabel()
        tempstockLabel.text = "0개"
        tempstockLabel.textAlignment = .center
        parentView.addSubview(tempstockLabel)
        tempstockLabel.translatesAutoresizingMaskIntoConstraints = false
        tempstockLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        tempstockLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        tempstockLabel.centerXAnchor.constraint(equalTo: constraintView.centerXAnchor).isActive = true
        tempstockLabel.topAnchor.constraint(equalTo: constraintView.bottomAnchor, constant: 5).isActive = true
        return tempstockLabel
    }
    
    func initChildView(imageName : String) -> UIView{
        let tempChildView : UIView = UIView()
        tempChildView.translatesAutoresizingMaskIntoConstraints = false
        tempChildView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        tempChildView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        let tempBtn : UIButton = addButtonTo(parentView: tempChildView, constraintView: tempChildView, buttonTitle: "추가", constant: 5)
        BeverageButtons.append(tempBtn)
        let tempImage : UIImageView = addImageTo(parentView: tempChildView, constraintView: tempBtn, imageName: imageName)
        beverageImageViews.append(tempImage)
        let tempStockLabel : UILabel = addLabelTo(parentView: tempChildView, constraintView: tempImage)
        stockLabel.append(tempStockLabel)
        let _ : UIButton = addButtonTo(parentView: tempChildView, constraintView: tempStockLabel, buttonTitle: "구입", constant: 30)
        return tempChildView
    }
    
    func initMoneyaddButtons(){
        for i in 0..<2 {
            MoneyaddButtons.append(UIButton())
            MoneyaddButtons[i].translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(MoneyaddButtons[i])
            MoneyaddButtons[i].setTitleColor(.systemBlue, for: .normal)
            MoneyaddButtons[i].widthAnchor.constraint(equalToConstant: 75).isActive = true
            MoneyaddButtons[i].heightAnchor.constraint(equalToConstant: 50).isActive = true
            MoneyaddButtons[i].centerYAnchor.constraint(equalTo: childView[0].centerYAnchor).isActive = true
            MoneyaddButtons[i].tag = i
            MoneyaddButtons[i].addTarget(self, action: #selector(addMoney(sender:)), for: .touchUpInside)
        }
        MoneyaddButtons[0].leftAnchor.constraint(equalTo: childView[3].rightAnchor, constant: 35).isActive = true
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
        currentMoneyLabel.centerYAnchor.constraint(equalTo: MoneyaddButtons[0].bottomAnchor, constant: 30).isActive = true
    }
    
    func redrawMoneyandStock(){
        for i in 0..<stockLabel.count{
            stockLabel[i].text = "\(vendingMachine.drawStockLabel(beverage: vendingMachine.sendBeverageInFactory(index: i)))개"
        }
        currentMoneyLabel.text = vendingMachine.drawCurrentMoney()
    }
    
    @objc func addBeverage(sender : UIButton) {
        let tempBeverage = vendingMachine.sendBeverageInFactory(index: sender.tag)
        vendingMachine.addBeverage(beverage: tempBeverage)
    }
    
    @objc func addMoney(sender: UIButton){
        if let tempMoney = Money.moneyUnit.init(index: sender.tag) {
            vendingMachine.addMoney(money: Money.init(money: tempMoney))
        }
    }
}
