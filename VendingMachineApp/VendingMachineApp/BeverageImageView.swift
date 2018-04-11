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
        self.clipsToBounds = true
        self.layer.borderWidth = 5
        self.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        self.layer.cornerRadius = 15.0
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.darkGray
        shadow.shadowOffset = CGSize(width: 2, height: 2)
        shadow.shadowBlurRadius = 2
        self.frame.size = CGSize(width: 140, height: 130)
    }

    func getImage(of beverage: Beverage) -> BeverageImageView {
        return BeverageImageView(image: UIImage(named: beverage.itemImage))
    }


}
