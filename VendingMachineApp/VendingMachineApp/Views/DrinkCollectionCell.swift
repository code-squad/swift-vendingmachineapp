//
//  DrinkCollectionCell.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/03/09.
//

import UIKit

class DrinkCollectionCell: UICollectionViewCell {
    
    @IBOutlet var addButton: UIButton!
    @IBOutlet var drinkImage: UIImageView!
    @IBOutlet var stockNumber: UILabel!
    
    var drinkType: (()->Berverage.Type)?
    var count: Int?
    
    func updateUI(drinkType: String, count: Int) {
        self.count = count
        addButton.setTitle("추가", for: .normal)
        addButton.addTarget(self, action: #selector(onTapButton), for: .touchUpInside)
        stockNumber.text = String(count) + "개"
        drinkImage.image = UIImage(named: "\(drinkType).jepg")
    }
    
    @objc
    func onTapButton() {
        let type = drinkType?()
        NotificationCenter.default.post(
            name: NSNotification.Name(rawValue: "DrinkPostButton"),
            object: type)
    }
}
