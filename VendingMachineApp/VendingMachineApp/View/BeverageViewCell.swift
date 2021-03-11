//
//  CollectionViewCell.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/03/09.
//

import UIKit

class BeverageViewCell: UICollectionViewCell {
    static let identifier = "BeverageViewCell"

    var beveragesView: BeverageView
    
    override init(frame: CGRect) {
        beveragesView = BeverageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        super.init(frame: frame)
        
        contentView.addSubview(beveragesView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setup() {
       
    }
    
    public func changeImage(image: UIImage) {
        beveragesView.setImage(image: image)
    }
}
