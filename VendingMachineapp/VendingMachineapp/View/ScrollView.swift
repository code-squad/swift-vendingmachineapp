//
//  ScrollView.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/03/19.
//

import UIKit

class ScrollView: UIScrollView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setScrollView()
        NotificationCenter.default.addObserver(self, selector: #selector(addPurchasedImageView(_:)), name: VendingMachine.Notification.didChangedStock, object: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setScrollView()
        NotificationCenter.default.addObserver(self, selector: #selector(addPurchasedImageView(_:)), name: VendingMachine.Notification.didChangedStock, object: nil)
    }
    
    func setScrollView() {
        self.contentSize = CGSize(width: CGFloat(2000), height: CGFloat(120))
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    @objc func addPurchasedImageView(_ notification: Notification) {
        guard let machine = notification.object as? VendingMachine else {
            return
        }
        
        var pointX = 0
        
        self.subviews.forEach({ (image) in
            image.removeFromSuperview()
        })
        
        machine.purchasedList().forEach( {
            
            let imageView = UIImageView()
            imageView.image = UIImage(named: "\(type(of: $0))")
            imageView.frame = CGRect(x: pointX, y: 0, width: 120, height: 120)
            pointX += 170
            self.addSubview(imageView)
        })
        
    }

}
