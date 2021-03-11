//
//  CollectionViewCell.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/03/09.
//

import UIKit

class BeverageViewCell: UICollectionViewCell {
    static let identifier = "BeverageViewCell"

    private(set) var beveragesView: BeverageView
    
    override init(frame: CGRect) {
        beveragesView = BeverageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        super.init(frame: frame)
        
        contentView.addSubview(beveragesView)
    }

    required init?(coder: NSCoder) {
        beveragesView = BeverageView()
        super.init(coder: coder)
        beveragesView = BeverageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        contentView.addSubview(beveragesView)
    }

    public func changeImage(image: UIImage) {
        beveragesView.setImage(image: image)
    }
}
