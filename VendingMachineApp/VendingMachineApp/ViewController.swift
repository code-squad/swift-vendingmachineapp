//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var productStackView: UIStackView!
    @IBOutlet weak var productSample: ProductStackView!
    
    @IBOutlet var countCollection: [UILabel]!
    @IBOutlet var addButtonCollection: [UIButton]!
    @IBOutlet var moneyButtonCollection: [UIButton]!
    
    @IBOutlet weak var moneyLabel: UILabel!

    private let beverageImages = [#imageLiteral(resourceName: "americano"), #imageLiteral(resourceName: "cafelatte"), #imageLiteral(resourceName: "chocolatemilk"), #imageLiteral(resourceName: "coke"), #imageLiteral(resourceName: "milkis"), #imageLiteral(resourceName: "plainmilk")]
    private let moneyUnits = [1000, 5000, 10000]

    private var beverageList = [Shopable]()
    private let beverageFactory = BeverageFactory0303()

    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    private var presenter = VendingMachineUpdator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beverageList = beverageFactory.createAll()
        
        presenter.didTurnOn(images: beverageImages,
                            sampleView: productSample,
                            stackView: productStackView,
                            machine: appDelegate.vendingMachine,
                            beverageList: beverageList,
                            moneyLabel: moneyLabel)
        
        updateCollections()
    }
    
    private func updateCollections() {
        countCollection = []
        addButtonCollection = []
        
        for view in productStackView.arrangedSubviews {
            let stackView = view as! ProductStackView
            countCollection.append(stackView.countLabel)
            addButtonCollection.append(stackView.addButton)
            stackView.addButton.addTarget(self, action: #selector(self.addStockTouched(_:)), for: .touchUpInside)
        }
    }
    
    @IBAction func addStockTouched(_ sender: UIButton) {
        let targetIdx = addButtonCollection.firstIndex(of: sender)
        
        if let targetIdx = targetIdx {
            let targetBeverage = beverageList[targetIdx]
            presenter.didAddStockTouched(for: targetBeverage, machine: appDelegate.vendingMachine)
        }
    }
    
    @IBAction func addMoneyTouched(_ sender: UIButton) {
        let targetIdx = moneyButtonCollection.firstIndex(of: sender)
        
        if let targetIdx = targetIdx {
            let addAmount = moneyUnits[targetIdx]
            presenter.didAddMoneyTouched(amount: addAmount, machine: appDelegate.vendingMachine)
        }
    }
}
