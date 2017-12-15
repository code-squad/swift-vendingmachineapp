//
//  UserModeViewController.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 11. 30..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import UIKit

class UserModeViewController: UIViewController {
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

    private func updateInventoryLabel() {
        let count = VendingMachine.sharedInstance.countOfDrinks()
        for label in inventoryLabel.enumerated() {
            label.element.text = "\(count[label.offset])"
        }
    }

    private func makeDrinkImageViews() {
        drinkImageViews.forEach { (imageView: UIImageView) in
            let tap = UITapGestureRecognizer(target: self,
                                             action: #selector(self.drinkViewDidTap(_:)))
            imageView.addGestureRecognizer(tap)
            imageView.isUserInteractionEnabled = true
        }
    }

    private func showAlert(title: String = "잠깐!", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: { (action: UIAlertAction) in
                alert.dismiss(animated: true, completion: nil)

        })
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    // MARK: Events

    // 재고 업데이트
    @objc private func updateInventoryLabel(noti: Notification?) {
        updateInventoryLabel()
    }

    // 음료 이미지를 클릭했을 경우, User Mode 에서는 음료를 구매한다.
    @objc private func drinkViewDidTap(_ recognizer: UITapGestureRecognizer) {
        if let imageView = recognizer.view as? UIImageView {
            do {
                try VendingMachine.sharedInstance.delete(.user, detail: imageView.tag)
            } catch let error {
                showAlert(message: error.localizedDescription)
            }
        }
    }

}
