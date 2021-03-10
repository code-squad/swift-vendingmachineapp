//
//  SlotView.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/08.
//

import UIKit

class SlotView: UIView {
    enum Notification {
        static let DidButtonPressed = Foundation.Notification.Name("DidButtonPressed")
    }
    
    private let nibName = "SlotView"
    
    @IBOutlet weak var itemQuantityIncrementButton: UIButton!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemQuantityLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        guard let nibObjects = Bundle.main.loadNibNamed(nibName, owner: self, options: nil) else { return }
        guard let nibView = nibObjects.first as? UIView else { return }
        nibView.frame = self.bounds
        itemImageView.layer.cornerRadius = 25.0
        itemImageView.layer.masksToBounds = true
        self.addSubview(nibView)
        
        itemQuantityIncrementButton.addTarget(self, action: #selector(itemQuantityIncrementButtonPressed(_:)), for: .touchUpInside)
    }
    
    @objc func itemQuantityIncrementButtonPressed(_ sender: UIButton) {
        let userInfo = ["SlotView" : self]
        NotificationCenter.default.post(name: Notification.DidButtonPressed, object: nil, userInfo: userInfo)
    }
}
