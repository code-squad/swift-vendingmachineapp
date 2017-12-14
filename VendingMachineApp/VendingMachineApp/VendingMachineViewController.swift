//
//  VendingMachineViewController.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 11. 30..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import UIKit

class VendingMachineViewController: UIViewController {
    // 음료 추가 컨트롤러 -> Manager Mode
    @IBOutlet var imageViews: [UIImageView]!
    @IBOutlet var inventoryLabel: [UILabel]!
    @IBOutlet var addInventoryButtons: [UIButton]!
    @IBOutlet var buyDrinkButtons: [UIButton]!
    var vendingMachine = VendingMachine.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        updateInventoryLabel()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.updateInventoryLabel(noti:)),
                                               name: .didChangeInventoryNotification,
                                               object: nil)
        makeAddInventroyButtons()
        makeBuyDrinkButtons()

    }

    // 재고 추가 버튼을 클릭했을 경우
    @objc private func addInventoryButtonDidTap(_ sender: UIButton) {
        vendingMachine.add(.manager, detail: sender.tag)
    }

    // 음료 구매 버튼을 클릭했을 경우
    @objc private func buyDrinkButtonDidTap(_ sender: UIButton) {
        do {
            try vendingMachine.delete(.user, detail: sender.tag)
        } catch let error {
            showAlert(message: error.localizedDescription)
        }
    }

    // 재고 업데이트
    @objc private func updateInventoryLabel(noti: Notification?) {
        updateInventoryLabel()
    }

    // 재고 추가 버튼
    private func makeAddInventroyButtons() {
        addInventoryButtons.forEach { (button: UIButton) in
            button.addTarget(self,
                             action: #selector(self.addInventoryButtonDidTap(_:)),
                             for: .touchDown)
        }
    }

    // 음료수 구매 버튼
    private func makeBuyDrinkButtons() {
        buyDrinkButtons.forEach { (button: UIButton) in
            button.addTarget(self,
                             action: #selector(self.buyDrinkButtonDidTap(_:)),
                             for: .touchDown)
        }
    }

    private func updateInventoryLabel() {
        let count = vendingMachine.countOfDrinks()
        for label in inventoryLabel.enumerated() {
            label.element.text = "\(count[label.offset])"
        }
    }

    private func showAlert(title: String = "잠깐!", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: "OK",
                                                    style: .default,
                                                    handler: { (action: UIAlertAction) in
                                                        alert.dismiss(animated: true, completion: nil)
        })
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

}
