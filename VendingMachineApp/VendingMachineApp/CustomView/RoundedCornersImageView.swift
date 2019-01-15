//
//  RoundedCornersImageView.swift
//  VendingMachineApp
//
//  Created by 윤지영 on 11/01/2019.
//  Copyright © 2019 윤지영. All rights reserved.
//

import UIKit

class RoundedCornersImageView: UIImageView {

    override init(image: UIImage?) {
        super.init(image: image)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        roundCorners()
    }

    enum ImageFileFormat: String {
        case jpg = "jpg"
    }

    convenience init(imageName: String, fileFormat: ImageFileFormat) {
        let image = UIImage(named: "\(imageName).\(fileFormat.rawValue)")
        self.init(image: image)
    }

    private func roundCorners() {
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
    }

    func relocate(to index: Int) {
        let maxCount = 15, firstLine = 500, width = 130, height = 150
        let newLine = index >= maxCount ? true : false
        let index = newLine ? index - maxCount : index
        let line = newLine ? (firstLine + height) : firstLine
        self.frame = CGRect(x: 37+index*60, y: line, width: width, height: height)
    }

}
