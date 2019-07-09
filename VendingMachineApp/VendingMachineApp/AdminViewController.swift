//
//  AdminViewController.swift
//  VendingMachineApp
//
//  Created by joon-ho kil on 7/7/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {
    @IBOutlet weak var pieChartView: PieGraphView!
    @IBOutlet var drinksCount: [UILabel]!
    
    private var vendingMachine: VendingMachineManagementable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshDrinkCount(vendingMachine)
        NotificationCenter.default.addObserver(self, selector: #selector(onRefreshStock(_:)), name: .refreshStock, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        drawPieGraph(vendingMachine)
        super.viewWillAppear(false)
    }

    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true)
    }

    @IBAction func drinkSupply(_ sender: UIButton) {
        let drinkMenu = DrinkMenu(rawValue: sender.tag)
        
        if let drinkMenu = drinkMenu {
            vendingMachine.supply(drinkMenu, amount: 1)
        }
    }
    
    private func refreshDrinkCount (_ stock: StockPrintable) {
        stock.printStock(handler:
            { drinkMenu, count in
                drinksCount [drinkMenu.rawValue].text = String(count)+KoreanUnit.count.rawValue
        })
    }
    
    @objc func onRefreshStock(_ notification:Notification) {
        refreshDrinkCount(vendingMachine)
    }
    
    func referToVendingMachineManagementable (_ vendingMachineManagementable: VendingMachineManagementable) {
        vendingMachine = vendingMachineManagementable
    }
    
    private func drawPieGraph (_ stock: pieGraphDrawable) {
        let colors = [#colorLiteral(red: 1, green: 0.1426950693, blue: 0.01320748683, alpha: 1),#colorLiteral(red: 0.9933604598, green: 0.8310629725, blue: 0.003603453049, alpha: 1),#colorLiteral(red: 0.3653128147, green: 0.2048009932, blue: 0.4820051193, alpha: 1),#colorLiteral(red: 0.2989775836, green: 0.3618170917, blue: 0.5847190619, alpha: 1),#colorLiteral(red: 0.1790518165, green: 0.6309198141, blue: 0.4178460836, alpha: 1),#colorLiteral(red: 0.7070120573, green: 0.2774977088, blue: 0.3688604832, alpha: 1)]
        var segments = [LabelledSegment]()
        
        pieChartView.segmentLabelFont = .systemFont(ofSize: 20)
        
        stock.drawPieGraph(handler:
            { drinkMenu, count in
                if count > 0 {
                segments.append(LabelledSegment(color: colors[drinkMenu.rawValue], name: drinkMenu.getKoreaName(), value: CGFloat(count)))
                }
        })
    
        pieChartView.segments = segments
    }
}
