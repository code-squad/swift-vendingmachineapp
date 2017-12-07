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
        self.imageViews.forEach { (imageView: UIImageView) in
            let tap = UITapGestureRecognizer(target: self,
                                             action: #selector(VendingMachineViewController.drinkViewDidTap))
            imageView.addGestureRecognizer(tap)
            imageView.isUserInteractionEnabled = true
        }
        initManagerMode()
        updateInventory()
    }

    // 음료 이미지를 클릭했을 경우
    @objc func drinkViewDidTap(_ recognizer: UITapGestureRecognizer) {
        initManagerMode()
        if let imageView = recognizer.view as? UIImageView {
            do {
                try appDelegate.vendingMachine.add(detail: imageView.tag)
            } catch let error {
                print(error)
            }
        }
        updateInventory()
    }

    // Manager Mode로 초기화
    private func initManagerMode() {
        appDelegate.vendingMachine.exitMode()
        appDelegate.vendingMachine.assignMode(mode: .manager)
    }

    // 재고 업데이트
    private func updateInventory() {
        if let menuContents = appDelegate.vendingMachine.makeMenu() {
            for lable in inventoryLabel.enumerated() {
                let drink = menuContents.menu[lable.offset]
                let count = menuContents.inventory[drink] ?? 0
                lable.element.text = "\(count)"
            }
        }
    }

}
