//
//  ProductView.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/11.
//

import UIKit

class ProductStackView: UIStackView {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var buyButton: UIButton!

    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(countLabel, forKey: "CountLabel")
        coder.encode(imageView, forKey: "ImageView")
        coder.encode(addButton, forKey: "AddButton")
        coder.encode(buyButton, forKey: "BuyButton")
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        self.countLabel = coder.decodeObject(forKey: "CountLabel") as? UILabel
        self.imageView = coder.decodeObject(forKey: "ImageView") as? UIImageView
        self.addButton = coder.decodeObject(forKey: "AddButton") as? UIButton
        self.buyButton = coder.decodeObject(forKey: "BuyButton") as? UIButton
    }
    
    func userMode() {
        buyButton.isHidden = false
        addButton.isHidden = true
        imageView.layer.cornerRadius = bounds.height * 0.15
    }
    
    func adminMode() {
        buyButton.isHidden = true
        addButton.isHidden = false
        addButton.tintColor = .darkGray
        imageView.layer.cornerRadius = bounds.height * 0.08
    }
}
