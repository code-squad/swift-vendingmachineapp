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
