//
//  StorageLabel.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/03/09.
//

import Foundation
import UIKit

class StorageLabel: UILabel {
        
    override init(frame: CGRect){
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        text = "0개"
        textColor = .black
        font = UIFont.boldSystemFont(ofSize: 25)
        textAlignment = .center
    }
}

