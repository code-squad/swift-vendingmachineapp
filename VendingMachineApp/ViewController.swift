//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import UIKit

class ViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    lazy var vendingMachine = appDelegate?.vendingMachine
    
    let itemCountPerStand = 4
    let mainStackView : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()
    var inspectorView : InspectorStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView(){
        self.view.backgroundColor = .black
        
        guard let stockCells = appDelegate?.stockCellViews else { return }
        guard let dict = vendingMachine?.getTotalStock() else { return }

        for i in stride(from: 0, to: stockCells.count , by: itemCountPerStand){
            let stackview = StockHorizontalStackView()
            for view in stockCells[i..<min(i+itemCountPerStand, stockCells.count)] {
                view.button.delegate = self
                view.count = dict[ObjectIdentifier(view.beverageType.self)] ?? 0
                stackview.addArrangedSubview(view)
            }
            mainStackView.addArrangedSubview(stackview)
        }
        
        self.view.addSubview(mainStackView)
        mainStackViewConfiguration()
        
        inspectorView = InspectorStackView()
        inspectorView.coinButtions.forEach{ button in
            button.delegate = self
        }
        self.view.addSubview(inspectorView)
        inspectorViewConfiguration()
    }
}

// MARK: Configuration
extension ViewController {
    func mainStackViewConfiguration(){
        mainStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -200).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
    func inspectorViewConfiguration(){
        inspectorView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        inspectorView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 840).isActive = true
        inspectorView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        inspectorView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
}

extension ViewController : StockButtonDelegate {
    func append(type: Beverage.Type) {
        guard let factory = FactoryProducer.getFactory(type: type) else { return }
        guard let beverage = factory.createBeverage(type: type) else { return }
        vendingMachine?.append(product: beverage)
        print(vendingMachine?.getTotalStock())
    }
}

extension ViewController : CoinDelegate {
    func addCoin(_ sender: AddCoinUIButton) {
        vendingMachine?.charge(coins: sender.value)
        print(vendingMachine?.getCoins())
    }
}
