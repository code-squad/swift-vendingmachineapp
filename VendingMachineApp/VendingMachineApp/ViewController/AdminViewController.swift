//
//  AdminViewController.swift
//  VendingMachineApp
//
//  Created by YOUTH2 on 2018. 4. 3..
//  Copyright © 2018년 JINiOS. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {

    var vending: AdminMode?

    @IBOutlet weak var bananamilkStock: UILabel!
    @IBOutlet weak var chocomilkStock: UILabel!
    @IBOutlet weak var coffeeStock: UILabel!
    @IBOutlet weak var dolcelatteStock: UILabel!
    @IBOutlet weak var energydrinkStock: UILabel!
    @IBOutlet weak var softdrinkStock: UILabel!

    @IBOutlet weak var pieGraph: PieGraphView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setIntroView()
    }

    @objc private func didChangeItemNumber(_ notification: Notification) {
        self.updateItemNumber()
    }

    private func setIntroView() {
        self.updateItemNumber()
        NotificationCenter.default.addObserver(self, selector: #selector(didChangeItemNumber(_:)), name: .changedItemNumber, object: nil)
    }

    @IBAction func addButtonTouched(sender: UIButton) {
        guard let item = try? AdminController().pickItem(sender.tag) else { return }
        vending?.add(inputItem: item)

    }

    private func updateItemNumber() {
        guard let vending = self.vending else { return }
        self.bananamilkStock.text = String(amountFormat: vending.howMany(of: BananaMilk()))
        self.chocomilkStock.text = String(amountFormat: vending.howMany(of: ChocoMilk()))
        self.coffeeStock.text = String(amountFormat: vending.howMany(of: Coffee()))
        self.dolcelatteStock.text = String(amountFormat: vending.howMany(of: DolceLatte()))
        self.energydrinkStock.text = String(amountFormat: vending.howMany(of: EnergyDrink()))
        self.softdrinkStock.text = String(amountFormat: vending.howMany(of: SoftDrink()))
    }

    @IBAction func closeButtonTouched(_ sender: Any) {
        self.dismiss(animated: true, completion: {()})
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.pieGraph.historyData = self.vending?.purchaseLog()
    }


}
