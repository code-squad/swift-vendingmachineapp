//
//  VendingMachineViewController.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 11. 30..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import UIKit

class VendingMachineViewController: UIViewController, AppDelegateAccessable {
    // 음료 추가 컨트롤러 -> Manager Mode
    @IBOutlet var imageViews: [UIImageView]!
    @IBOutlet var inventoryLabel: [UILabel]!

    override func viewDidLoad() {
        super.viewDidLoad()
        makeDrinkImageViews()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.updateInventoryLabel(noti:)),
                                               name: .didAddInventoryNotification,
                                               object: nil)
        initInventoryLable()
    }

    // 음료 이미지를 클릭했을 경우
    @objc private func drinkViewDidTap(_ recognizer: UITapGestureRecognizer) {
        if let imageView = recognizer.view as? UIImageView {
            do {
                try VendingMachine.sharedInstance.add(.manager, detail: imageView.tag)
            } catch let error {
                print(error)
            }
        }
    }

    // 재고 업데이트
    @objc private func updateInventoryLabel(noti: Notification?) {
        guard let menuContents = VendingMachine.sharedInstance.makeMenu(.manager),
            let userInfo = noti?.userInfo,
            let productIndex = userInfo["productIndex"] as? Int else {
            return
        }
        let count = makeCountOfDrink(at: menuContents, index: productIndex)
        inventoryLabel[productIndex].text = "\(count)"
    }

    private func makeDrinkImageViews() {
        self.imageViews.forEach { (imageView: UIImageView) in
            let tap = UITapGestureRecognizer(target: self,
                                             action: #selector(self.drinkViewDidTap(_:)))
            imageView.addGestureRecognizer(tap)
            imageView.isUserInteractionEnabled = true
        }
    }

    private func initInventoryLable() {
        if let menuContents = VendingMachine.sharedInstance.makeMenu(.manager) {
            for lable in inventoryLabel.enumerated() {
                let count = makeCountOfDrink(at: menuContents, index: lable.offset)
                lable.element.text = "\(count)"
            }
        }
    }

    private func makeCountOfDrink(at menuContents: MenuContents, index: Int) -> Count {
        let drink = menuContents.menu[index]
        let count = menuContents.inventory[drink] ?? 0
        return count
    }

}

extension Notification.Name {
    static let didAddInventoryNotification = Notification.Name(rawValue: "DidAddInventory")
}
