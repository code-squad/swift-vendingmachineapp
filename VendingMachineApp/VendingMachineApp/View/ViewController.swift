//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let vendingMachine = VendingMachine()
    }
    
    func generateImageView(with name: String) -> UIImageView {
        let imageView = UIImageView()
        let width = self.view.bounds.width/8
        let height = self.view.bounds.height/6
        imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        imageView.image = UIImage(named: name)
        return imageView
    }

    

}

