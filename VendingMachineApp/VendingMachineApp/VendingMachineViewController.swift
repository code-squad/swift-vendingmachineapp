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
    @IBOutlet var addInventoryButtons: [UIButton]!
    @IBOutlet var buyDrinkButtons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        makeAddInventroyButtons()
        makeBuyDrinkButtons()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.updatePurchaseDrinkListLabel(noti:)),
                                               name: .didBuyDrinkNotifiacation,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.updateInventoryLabel(noti:)),
                                               name: .didAddInventoryNotification,
                                               object: nil)
        initInventoryLable()
    }

    // 재고 추가 버튼을 클릭했을 경우
    @objc private func addInventoryButtonDidTap(_ sender: UIButton) {
        do {
            try VendingMachine.sharedInstance.add(.manager, detail: sender.tag)
        } catch let error {
            print(error)
        }
    }

    // 음료 구매 버튼을 클릭했을 경우
    @objc private func buyDrinkButtonDidTap(_ sender: UIButton) {
        do {
            try VendingMachine.sharedInstance.delete(.user, detail: sender.tag)
        } catch let error {
            print(error)
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

    // 구매 목록 업데이트
    @objc private func updatePurchaseDrinkListLabel(noti: Notification?) {
        guard let userInfo = noti?.userInfo,
            let buyDrinkImageName = userInfo["buyDrinkImageName"] as? String,
            let countOfPurchases = userInfo["count"] as? Int else {
                return
        }
        let cardImage : UIImageView = UIImageView(image: UIImage(named: buyDrinkImageName))
        cardImage.frame = CGRect(x: 50*(countOfPurchases-1), y: 575, width: 215, height: 120)
        cardImage.contentMode = .scaleAspectFit
        self.view.addSubview(cardImage)
    }

    private func initInventoryLable() {
        if let menuContents = VendingMachine.sharedInstance.makeMenu(.manager) {
            for lable in inventoryLabel.enumerated() {
                let count = makeCountOfDrink(at: menuContents, index: lable.offset)
                lable.element.text = "\(count)"
            }
        }
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

    private func makeCountOfDrink(at menuContents: MenuContents, index: Int) -> Count {
        let drink = menuContents.menu[index]
        let count = menuContents.inventory[drink] ?? 0
        return count
    }

}
