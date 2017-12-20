//
//  ManagerModeController.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 12. 15..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import UIKit

class ManagerModeController: UIViewController {

    // MARK: Properties
    @IBOutlet var drinkImageViews: [UIImageView]!
    @IBOutlet var inventoryLabel: [UILabel]!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateInventoryLabel()
        makeDrinkImageViews()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.updateInventoryLabel(noti:)),
            name: .didChangeInventoryNotification,
            object: nil
        )
    }

    // MARK: Methods

    private func makeDrinkImageViews() {
        drinkImageViews.forEach { (imageView: UIImageView) in
            let tap = UITapGestureRecognizer(
                target: self,
                action: #selector(self.drinkViewDidTap(_:))
            )
            imageView.addGestureRecognizer(tap)
            imageView.isUserInteractionEnabled = true
        }
    }

    private func updateInventoryLabel() {
        let count = VendingMachine.sharedInstance.countOfDrinks()
        for label in inventoryLabel.enumerated() {
            label.element.text = "\(count[label.offset])"
        }
    }

    // MARK: Events

    // 재고 업데이트
    @objc private func updateInventoryLabel(noti: Notification?) {
        updateInventoryLabel()
    }

    // 음료 이미지를 클릭했을 경우, Manager Mode 에서는 재고 추가한다.
    @objc private func drinkViewDidTap(_ recognizer: UITapGestureRecognizer) {
        if let imageView = recognizer.view as? UIImageView {
            VendingMachine.sharedInstance.add(.manager, detail: imageView.tag)
        }
    }

    @IBAction func closeButtonDidTap(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func forwardButtonDidTap(_ sender: UIButton) {
        let pieGraphViewController = storyboard?.instantiateViewController(
            withIdentifier: "PieGraphViewController"
            ) as! PieGraphViewController
        self.navigationController?.pushViewController(pieGraphViewController, animated: true)
    }
}
