//
//  BeverageView.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/03/09.
//

import UIKit

class BeverageView: UIView {
    private let nibName = "BeverageView"
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stockLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    convenience init(beverageImage: UIImage, stockLabelText: String) {
        self.init()
        imageView.image = beverageImage
        stockLabel.text = stockLabelText
    }
    
    private func configureView() {
        self.loadViewFromNib(nibName: nibName)
        imageView.layer.cornerRadius = 25.0
        imageView.layer.masksToBounds = true
    }
    
    @IBAction func addBeverage(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name("addBeverage"), object: sender, userInfo: nil)
    }
}
