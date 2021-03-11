//
//  AddButton.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/03/08.
//

import Foundation
import UIKit

class AddButton: UIButton {
    
    var drinkType: Drink!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 4
        clipsToBounds = true
        setTitle("추가", for: .normal)
        setTitleColor(.white, for: .normal)
        backgroundColor = .blue
        UIFont.boldSystemFont(ofSize: 40)
        heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
