//
//  BeverageImageView.swift
//  VendingMachineApp
//
//  Created by YOUTH2 on 2018. 3. 22..
//  Copyright © 2018년 JINiOS. All rights reserved.
//

import UIKit

class BeverageImageView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setBeverageImage()
    }

    private func setBeverageImage() {

        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
        self.layer.borderWidth = 5
        self.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        self.layer.cornerRadius = 15.0
    }

    func getItemImage(_ item: Beverage) -> BeverageImageView {
        switch ObjectIdentifier(type(of: item)) {
        case ObjectIdentifier(type(of: BananaMilk())):
            return BeverageImageView(image: UIImage(named: "bananamilk.jpg"))
        case ObjectIdentifier(type(of: ChocoMilk())):
            return BeverageImageView(image: UIImage(named: "chocomilk.jpg"))
        case ObjectIdentifier(type(of: Coffee())):
            return BeverageImageView(image: UIImage(named: "top.jpg"))
        case ObjectIdentifier(type(of: DolceLatte())):
            return BeverageImageView(image: UIImage(named: "starbucks.jpg"))
        case ObjectIdentifier(type(of: EnergyDrink())):
            return BeverageImageView(image: UIImage(named: "redbull.jpg"))
        case ObjectIdentifier(type(of: SoftDrink())):
            return BeverageImageView(image: UIImage(named: "coke.jpg"))
        default:
            return BeverageImageView(image: UIImage(named: "bananamilk.jpg"))
        }
        return self
    }

    func getImage(of beverage: Beverage) -> BeverageImageView {
        return BeverageImageView(image: UIImage(named: beverage.itemImage))
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
