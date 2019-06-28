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
        
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 10
    }
    
    convenience init(imageName: String, form: ImageFileForm) {
        //let image = UIImage(named:"\(imageName).\(form.rawValue)")
        let image = UIImage(named: "Banana.jpg")
        self.init(image: image)
    }
    
    // MARK: - enum ImageFileForm
    enum ImageFileForm: String {
        case jpg = "jpg"
    }
    
   

}
