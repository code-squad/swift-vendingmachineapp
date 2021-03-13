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
    
    private var inventoryInfo: [Slot: SlotView] = [ : ]
    private let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
    private lazy var sceneDelegate = windowScene?.delegate as? SceneDelegate
    private var inventoryPublisher: AnyCancellable!
    private var cashBoxPublisher: AnyCancellable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubscriber()
        initialSetupVendingMachine()
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
            let slotInfo = inventoryInfo.filter { selectedSlotView.value == $0.value }.first
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
        for subview in self.inventoryStackView.arrangedSubviews {
            subview.removeFromSuperview()
        }
        inventoryInfo = [ : ]
        let inventorySheet = sceneDelegate?.vendingMachine.takeInventory().sorted { $0.key.description < $1.key.description }
        
        inventorySheet?.forEach { inventory in
            let slotView = makeSlotView(with: inventory.key)
            self.inventoryStackView.addArrangedSubview(slotView)
            inventoryInfo[inventory.key] = slotView
        }
    }
    
    private func configureCashBoxView() {
        balanceLabel.text = "잔액 : \(sceneDelegate?.vendingMachine.showBalance() ?? 0)원"
    }
    
    private func makeSlotView(with slot: Slot) -> SlotView {
        let view = SlotView()
        view.itemImageView.image = UIImage(named: slot.itemImageName ?? "")
        view.itemQuantityLabel.text = "\(slot.itemCount)개"
        return view
    }
}
