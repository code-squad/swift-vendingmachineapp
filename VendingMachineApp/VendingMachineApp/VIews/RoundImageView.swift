//
//  RoundImaveView.swift
//  VendingMachineApp
//
//  Created by yuaming on 14/03/2018.
//  Copyright © 2018 CodeSquad. All rights reserved.
//

import UIKit

class RoundImageView: UIImageView {
    private var position: CGFloat = 0
    private var cgRect: CGRect = CGRect(x: 68, y: 650, width: 125, height: 125)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override init(image: UIImage?) {
        super.init(image: image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(image: UIImage?, position: CGFloat) {
        super.init(image: image)
        self.position = position
        movePoints()
        setup()
        self.frame = cgRect
    }
    
    private func movePoints() {
        cgRect.origin.x += position * 30.0
    }
    
    private func setup() {
        self.layer.cornerRadius = 50.0
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor.white
        self.layer.borderColor = UIColor.orange.cgColor
        self.layer.borderWidth = 2
    }
}
