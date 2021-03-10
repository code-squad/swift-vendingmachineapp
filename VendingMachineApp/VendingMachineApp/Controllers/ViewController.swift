//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import UIKit
import Combine

class ViewController: UIViewController {
    @IBOutlet weak var inventoryStackView: UIStackView!
    @IBOutlet weak var balanceLabel: UILabel!
    
    private var vendingMachine: VendingMachine!
    private var inventoryInfo: [Slot: SlotView] = [ : ]
    private var inventoryPublisher: AnyCancellable!
    private var cashBoxPublisher: AnyCancellable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc func itemQuantityIncrementButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func insertMoneyButtonPressed(_ sender: UIButton) {
    }
    
    private func initialSetupVendingMachine() {
        self.vendingMachine = VendingMachine(numberOfSlots: 5)
        vendingMachine.bulkInsert(itemFrom: DenmarkStrawberryMilkFactory(), quantity: 5, manufactured: Date().formattedDate(from: "20210222"), expiredAfter: Date().formattedDate(from: "20210302"))
        vendingMachine.bulkInsert(itemFrom: MaeilChocolateMilkFactory(), quantity: 5, manufactured: Date().formattedDate(from: "20210222"), expiredAfter: Date().formattedDate(from: "20210302"))
        vendingMachine.bulkInsert(itemFrom: ZeroSugarCokeFactory(), quantity: 5, manufactured: Date().formattedDate(from: "20210222"), expiredAfter: Date().formattedDate(from: "20210302"))
        vendingMachine.bulkInsert(itemFrom: GeorgiaMaxFactory(), quantity: 5, manufactured: Date().formattedDate(from: "20210222"), expiredAfter: Date().formattedDate(from: "20210302"))
        vendingMachine.bulkInsert(itemFrom: RedBullFactory(), quantity: 5, manufactured: Date().formattedDate(from: "20210222"), expiredAfter: Date().formattedDate(from: "20210302"))
    }
    
    private func configureCashBoxView() {
        balanceLabel.text = "잔액 : \(vendingMachine.showBalance())원"
    }
    
    private func makeSlotView(with slot: Slot) -> SlotView {
        let view = SlotView()
        view.itemImageView.image = UIImage(named: slot.itemImageName ?? "")
        view.itemQuantityLabel.text = "\(slot.itemCount)개"
        return view
    }
}
