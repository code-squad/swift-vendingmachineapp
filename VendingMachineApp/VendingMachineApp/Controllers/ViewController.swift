//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import UIKit
import Combine

class ViewController: UIViewController, SlotViewDelegate, AppDelegateAccessible {
    @IBOutlet weak var inventoryStackView: UIStackView!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var purchaseHistoryStackView: UIStackView!
    
    private var inventoryViewInfo: [Slot: SlotView] = [ : ]
    private var inventoryPublisher: AnyCancellable!
    private var cashBoxPublisher: AnyCancellable!
    private var purchaseHistoryPublisher: AnyCancellable!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        configureInventoryView()
        configureCashBoxView()
        configurePurchaseHistoryView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubscriber()
    }
    
    private func configureSubscriber() {
        inventoryPublisher = NotificationCenter.default
            .publisher(for: VendingMachine.Notification.DidChangeInventory)
            .sink { notification in
                DispatchQueue.main.async {
                    self.configureInventoryView()
                }
            }
        
        cashBoxPublisher = NotificationCenter.default
            .publisher(for: VendingMachine.Notification.DidChangeBalance)
            .sink { notification in
                DispatchQueue.main.async {
                    self.configureCashBoxView()
                }
            }
        
        purchaseHistoryPublisher = NotificationCenter.default
            .publisher(for: VendingMachine.Notification.DidChangePurchaseHistory)
            .sink(receiveValue: { notification in
                DispatchQueue.main.async {
                    self.configurePurchaseHistoryView()
                }
            })
    }
    
    private func configureInventory(_ sender: SlotView) {
        let slotInfo = inventoryViewInfo.filter { sender == $0.value }.first
        /// 현 단계에서는 재고 정보(제조일자, 유통기한 등)를 입력할 수 있는 란이 따로 없어 슬롯의 첫번째 상품과 동일한 상품의 재고를 추가하도록 구현
        if let item = slotInfo?.key.firstItem {
            appDelegate.vendingMachine.add(item: item)
        }
    }
    
    private func configureCashBox(_ sender: UIButton) {
        guard let selectedAmount = sender.titleLabel?.text?.filterNonDigits() else { return }
        guard let convertedAmount = Int(selectedAmount) else { return }
        appDelegate.vendingMachine.insertMoney(amount: convertedAmount)
    }
    
    private func configurePurchaseHistory(_ sender: SlotView) {
        let slotInfo = inventoryViewInfo.filter { sender == $0.value }.first
        if let itemName = slotInfo?.key.firstItem?.name {
            let _ = appDelegate.vendingMachine.vend(itemNamed: itemName)
        }
    }
    
    @IBAction func insertMoneyButtonPressed(_ sender: UIButton) {
        configureCashBox(sender)
    }
    
    func itemQuantityIncrementButtonPressed(sender: SlotView) {
        configureInventory(sender)
    }
    
    func vendButtonPressed(sender: SlotView) {
        configurePurchaseHistory(sender)
    }
    
    private func configureInventoryView() {
        clearInventory()
        configureInventoryViewInfo()
        let sortedInventoryViewInfo = inventoryViewInfo.sorted { $0.key.description < $1.key.description }
        sortedInventoryViewInfo.forEach { slot, slotView in
            self.inventoryStackView.addArrangedSubview(slotView)
            slotView.delegate = self
            inventoryViewInfo[slot] = slotView
        }
    }
    
    private func clearInventory() {
        for subview in self.inventoryStackView.arrangedSubviews {
            subview.removeFromSuperview()
        }
        inventoryViewInfo = [ : ]
    }
    
    private func configureInventoryViewInfo() {
        inventoryViewInfo = InventorySheet().createInventoryViewInfo(for: appDelegate.vendingMachine)
    }
    
    private func configureCashBoxView() {
        balanceLabel.text = "잔액 : \(appDelegate.vendingMachine.showBalance())원"
    }
    
    private func configurePurchaseHistoryView() {
        clearPurchaseHistory()
        appDelegate.vendingMachine.showPurchaseHistory().showOrderList {
            purchaseHistoryStackView.addArrangedSubview(makeOrderView(with: $0))
        }
    }
    
    private func clearPurchaseHistory() {
        for subview in self.purchaseHistoryStackView.arrangedSubviews {
            subview.removeFromSuperview()
        }
    }
    
    private func makeOrderView(with order: Order) -> UIImageView {
        let view = UIImageView(frame: CGRect.zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 130).isActive = true
        view.image = UIImage(named: order.itemImageName)
        return view
    }
}
