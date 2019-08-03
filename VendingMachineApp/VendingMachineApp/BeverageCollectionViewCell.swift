//
//  BeverageCollectionViewCell.swift
//  VendingMachineApp
//
//  Created by 김성현 on 02/08/2019.
//  Copyright © 2019 김성현. All rights reserved.
//

import UIKit

class BeverageCollectionViewCell: UICollectionViewCell {
    
    //MARK: 프로퍼티
    @IBOutlet weak var photoImageVIew: UIImageView!
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 셀과 이미지의 모서리를 둥글게 합니다.
        photoImageVIew.layer.cornerRadius = 10
        self.layer.cornerRadius = 10
    }
}
