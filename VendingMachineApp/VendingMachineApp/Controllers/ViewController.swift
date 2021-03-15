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
    
    private var inventoryViewInfo: [Slot: SlotView] = [ : ]
    private let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
    private lazy var sceneDelegate = windowScene?.delegate as? SceneDelegate
    private var inventoryPublisher: AnyCancellable!
    private var cashBoxPublisher: AnyCancellable!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        configureInventoryView()
        configureCashBoxView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubscriber()
        configureInventory()
    }
    
    @IBAction func insertMoneyButtonPressed(_ sender: UIButton) {
        configureCashBox(sender)
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
    }
    
    private func configureInventory() {
        NotificationCenter.default.addObserver(self, selector: #selector(itemQuantityIncrementButtonPressed(_:)), name: SlotView.Notification.DidButtonPressed, object: nil)
    }
    
    @objc func itemQuantityIncrementButtonPressed(_ notification: Notification) {
        if let selectedSlotView = (notification.userInfo as? [String : SlotView])?.first {
            let slotInfo = inventoryViewInfo.filter { selectedSlotView.value == $0.value }.first
            /// 현 단계에서는 재고 정보(제조일자, 유통기한 등)를 입력할 수 있는 란이 따로 없어 슬롯의 첫번째 상품과 동일한 상품의 재고를 추가하도록 구현
            if let item = slotInfo?.key.firstItem {
                sceneDelegate?.vendingMachine.add(item: item)
            }
        }
    }
    
    private func configureCashBox(_ sender: UIButton) {
        guard let selectedAmount = Int(sender.titleLabel?.text?.filterNonDigits() ?? "0") else { return }
        sceneDelegate?.vendingMachine.insertMoney(amount: selectedAmount)
    }
    
    private func configureInventoryView() {
        clearInventory()
        configureInventoryViewInfo()
        let sortedInventoryViewInfo = inventoryViewInfo.sorted { $0.key.description < $1.key.description }
        sortedInventoryViewInfo.forEach { slot, slotView in
            self.inventoryStackView.addArrangedSubview(slotView)
            inventoryViewInfo[slot] = slotView
        }
    }
    
    private func configureInventoryViewInfo() {
        guard let vendingMachine = sceneDelegate?.vendingMachine else { return }
        inventoryViewInfo = InventorySheet().createInventoryViewInfo(for: vendingMachine)
    }
    
    private func clearInventory() {
        for subview in self.inventoryStackView.arrangedSubviews {
            subview.removeFromSuperview()
        }
        inventoryViewInfo = [ : ]
    }
    
    private func configureCashBoxView() {
        balanceLabel.text = "잔액 : \(sceneDelegate?.vendingMachine.showBalance() ?? 0)원"
    }
}
