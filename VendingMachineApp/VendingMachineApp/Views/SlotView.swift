//
//  SlotView.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/08.
//

import UIKit

protocol SlotViewDelegate {
    func itemQuantityIncrementButtonPressed(sender: SlotView)
}

class SlotView: UIView {
    enum Notification {
        static let DidButtonPressed = Foundation.Notification.Name("DidButtonPressed")
    }
    
    var delegate: SlotViewDelegate?
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
        
        itemQuantityIncrementButton.addTarget(self, action: #selector(itemQuantityIncrementButtonPressed), for: .touchUpInside)
    }
    
    @objc func itemQuantityIncrementButtonPressed() {
        delegate?.itemQuantityIncrementButtonPressed(sender: self)
    }
}
