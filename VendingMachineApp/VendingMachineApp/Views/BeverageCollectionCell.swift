//
//  DrinkCollectionCell.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/03/09.
//

import UIKit

class BeverageCollectionCell: UICollectionViewCell {
    
    @IBOutlet var addButton: UIButton!
    @IBOutlet var beverageImage: UIImageView!
    @IBOutlet var stockNumber: UILabel!
    
    var beverageType: (()->Beverage.Type)?
    var count: Int?
    
    func updateUI(beverageType: String, count: Int) {
        self.count = count
        addButton.setTitle("추가", for: .normal)
        addButton.addTarget(self, action: #selector(onTapButton), for: .touchUpInside)
        stockNumber.text = String(count) + "개"
        beverageImage.image = UIImage(named: "\(beverageType).jepg") ?? UIImage()
    }
    
    @objc
    func onTapButton() {
        let type = beverageType?()
        let userInfo: [AnyHashable:Any] = ["type": type ?? Beverage.Type.self]
        
        NotificationCenter.default.post(
            name: NSNotification.Name(rawValue: "BeveragePostButton"),
            object: nil, userInfo: userInfo)
    }
}
