//
//  GridCell.swift
//  VendingMachineApp
//
//  Created by hw on 24/07/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import UIKit
enum GridCellTextSet: String{
    case buy = "구매"
    case charge = "추가"
}
class GridCell: UICollectionViewCell{
    @IBOutlet var imgView: DrinkUIImageView!
    @IBOutlet weak var stockInfoLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    private var itemIndex: Int!
    
    @IBAction func buyDrinkButton(_ sender: UIButton) {
        guard let index = itemIndex else{
            return
        }
        NotificationCenter.default.post(name: .buyDrinkButton, object: index)
    }
    
    @IBAction func addDrinkStockButton(_ sender: UIButton) {
        guard let stockSize = Int((stockInfoLabel.text!.components(separatedBy: "개")[0])) else{
            return
        }
        guard let index = itemIndex else {
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
        let img: UIImage = UIImage.init(named: "\(index).jpg")!
        imgView.image = img
        stockInfoLabel.text = "\(drinkStockSize)개"
        itemIndex = index
    }
    
    func configureButtonStyle(){
        buyButton.setTitle(GridCellTextSet.buy.rawValue, for: .normal)
        buyButton.setTitleColor(.red, for: .normal)
    }
}

extension Notification.Name {
    static let buyDrinkButton = Notification.Name(rawValue: "BuyDrinkEvent")
}
