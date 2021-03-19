//
//  BoughtView.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/19.
//

import UIKit

class boughtView: UIScrollView {
    private var vendingMachine : VendingMachine!
    private let appDelegate : AppDelegate
    private var boughtImages : [UIImageView]
    
    override init(frame : CGRect) {
        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.vendingMachine = appDelegate.vendingMachine
        boughtImages = []
        super.init(frame: frame)
        self.backgroundColor = .systemGray2
    }
    
    required init?(coder: NSCoder) {
        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        boughtImages = []
        super.init(coder: coder)
    }
    
    func makeBoughtImageView(ImageTitle : StockView.stockTitle){
        let tempImageView : UIImageView = UIImageView(image: UIImage(named: ImageTitle.rawValue))
        tempImageView.backgroundColor = .white
        self.addSubview(tempImageView)
        tempImageView.translatesAutoresizingMaskIntoConstraints = false
        tempImageView.widthAnchor.constraint(equalToConstant: 140).isActive = true
        tempImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        tempImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        if boughtImages.count == 0 {
            tempImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        }
        else{
            tempImageView.leftAnchor.constraint(equalTo: boughtImages[boughtImages.count-1].leftAnchor, constant: 70).isActive = true
        }
        tempImageView.contentMode = .scaleAspectFit
        tempImageView.layer.cornerRadius = 10
        self.contentSize = CGSize(width: self.contentSize.width + CGFloat(70), height: self.contentSize.height)
        self.boughtImages.append(tempImageView)
    }
}
