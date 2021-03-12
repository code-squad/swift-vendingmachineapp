//
//  ImageViews.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/03/08.
//

import UIKit

class BeverageImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setImageView()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setImageView()
    }
    
    func setImageView() {
        self.layer.cornerRadius = 30
    }
}
