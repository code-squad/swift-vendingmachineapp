//
//  ScrollView.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/03/19.
//

import UIKit

class ScrollView: UIScrollView {
    
    private var coordinateX = 0
    private let coordinateY = 0
    private let imageWidth = 120
    private let imageHeight = 120
    private let space = 50
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setScrollView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setScrollView()
    }
    
    func setScrollView() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addImageView(with beverage : Beverage.Type) {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "\(beverage)")
        imageView.frame = CGRect(x: coordinateX, y: coordinateY, width: imageWidth, height: imageHeight)
        coordinateX += imageWidth + space
        self.addSubview(imageView)
        self.contentSize = CGSize(width: coordinateX, height: imageHeight)
    }
}
