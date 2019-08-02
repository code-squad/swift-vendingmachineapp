//
//  GridCell.swift
//  VendingMachineApp
//
//  Created by hw on 24/07/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import UIKit

class GridCell: UICollectionViewCell{
    @IBOutlet var imgView: DrinkUIImageView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var stockInfoLabel: UILabel!
    private var itemIndex: Int!
    
    @IBAction func addDrinkStockButton(_ sender: UIButton) {
        guard let stockSize = Int((stockInfoLabel.text!.components(separatedBy: "개")[0])) else{
            return
        }
        guard let index = itemIndex else {
            NotificationCenter.default.post(
                name: .addDrinkButtonError,
                object: VendingMachineError.notFoundDrinkIdError
            )
            return
        }
        NotificationCenter.default.post(name: .addDrinkButton, object: index)
    }
    
    private func setImage(_ index: Int) {
        guard let img: UIImage = UIImage.init(named: "\(index).jpg") else{
            return
        }
        imgView.image = img
    }
    
    func updateDrinkInfo(drinkStockSize: Int, index: Int){
        guard let img: UIImage = UIImage.init(named: "\(index).jpg") else{
            return
        }
        imgView.image = img
        stockInfoLabel.text = "\(drinkStockSize)개"
        itemIndex = index
    }
}

extension Notification.Name {
    static let addDrinkButtonError = Notification.Name(rawValue: "AddDrinkButtonError")
    static let addDrinkButton = Notification.Name(rawValue: "AddDrinkButton")
}
