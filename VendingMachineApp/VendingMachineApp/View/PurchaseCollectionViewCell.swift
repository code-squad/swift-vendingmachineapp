//
//  PurchaseCollectionViewCell.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 12. 12..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import UIKit

class PurchaseCollectionViewCell: UICollectionViewCell {
    @IBOutlet var drinkImageView: UIImageView!

    func displayDrinkImage(image: UIImage) {
        drinkImageView.image = image
    }
}
