//
//  ImageViewMaker.swift
//  VendingMachineApp
//
//  Created by Eunjin Kim on 2018. 3. 23..
//  Copyright © 2018년 Eunjin Kim. All rights reserved.
//

import Foundation
import UIKit

class ImageViewMaker {
    static func makeImageView(imageX: Int) -> UIImageView {
        return UIImageView(frame: CGRect(x: 40+imageX, y: 575, width: 140, height: 100))
    }
}
