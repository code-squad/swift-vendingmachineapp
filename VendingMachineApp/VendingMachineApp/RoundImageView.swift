//
//  RoundImageView.swift
//  VendingMachineApp
//
//  Created by Elena on 20/05/2019.
//  Copyright © 2019 elena. All rights reserved.
//

import UIKit

class RoundImageView: UIImageView{
    
    // MARK: - init
    override init(image: UIImage?) {
        super.init(image: image)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        roundImage()
    }
    
    convenience init(imageName: String, form: ImageFileForm) {
        let image = UIImage(named:"\(imageName).\(form.rawValue)")
        self.init(image: image)
    }
    
    // MARK: - enum ImageFileForm
    enum ImageFileForm: String {
        case jpg = "jpg"
    }
    
    // MARK: - private func
    private func roundImage() {
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 10
    }
    
    // MARK: - func
    func moveImageView(index: Int) {
        
        let lineMaxFix = 17
        let firstLineItem = 575
        let width = 140
        let height = 100
        let newLine = index >= lineMaxFix ? true : false
        let index = newLine ? index - lineMaxFix : index
        let line = newLine ? (firstLineItem + height) : firstLineItem
        
        self.frame = CGRect(x: 40+index*60, y: line, width: width, height: height)
    }

}
