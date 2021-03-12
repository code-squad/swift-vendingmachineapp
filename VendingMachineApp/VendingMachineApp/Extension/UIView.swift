//
//  UIViewExtension.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/03/12.
//
import Foundation
import UIKit

extension UIView {
    
    func loadViewFromNib(nibName: String) {
        guard let nibObjects = Bundle.main.loadNibNamed(nibName, owner: self, options: nil) else { return }
        guard let nibView = nibObjects.first as? UIView else { return }
        nibView.frame = self.bounds
    
        self.addSubview(nibView)
    }
}
