//
//  OneCellStackView.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/03/11.
//

import Foundation
import UIKit

class OneCellView: UIStackView {
    
    private var addButton: UIButton!
    private var imageView: UIImageView!
    private var stockLabel: UILabel!
    
    private var count: Int = 0 {
        didSet{
            stockLabel.text = ""
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup(){
        addSubview(addButton)
        
        setupAddButton()
         
    }
    
    func setupAddButton(){
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setupImageView(){
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
    }
}
