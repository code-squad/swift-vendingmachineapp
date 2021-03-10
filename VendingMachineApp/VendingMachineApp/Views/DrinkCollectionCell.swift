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
    
    
    func updateUI(item: Dictionary<String,Int>.Element?) {
        guard let type = item else {
            return
        }
        addButton.setTitle("추가", for: .normal)
        stockNumber.text = String(type.value) + "개"
        drinkImage.image = UIImage(named: "\(type.key).jepg")
    }
}
