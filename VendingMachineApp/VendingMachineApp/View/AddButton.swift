//
//  AddButton.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/03/08.
//

import Foundation
import UIKit

class AddButton: UIButton {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        layer.cornerRadius = 4
        clipsToBounds = true
        setTitle("추가", for: .normal)
        setTitleColor(.black, for: .normal)
        UIFont.boldSystemFont(ofSize: 20)
        heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
}
