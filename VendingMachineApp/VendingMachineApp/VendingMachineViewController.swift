//
//  VendingMachineViewController.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 11. 30..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import UIKit

class VendingMachineViewController: UIViewController {
    var drinkImage = [UIImage]()
    var drinksDisplayStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        assignDrinkImage()
        makeVendingMachineView()
        view.addConstraints(drinkDisplayConstraint())
    }

    func assignDrinkImage() {
        for drinkName in DrinkName.allCases {
            let imageName = drinkName.description + ".png"
            if let image = UIImage(named: imageName) {
                drinkImage.append(image)
            }
        }
    }

    func makeVendingMachineView() {
        drinksDisplayStackView.axis = .vertical
        for i in 0...2 {
            let innerStackView = UIStackView()
            drinksDisplayStackView.addArrangedSubview(innerStackView)
            innerStackView.axis = .horizontal
            for j in 0...2 {
                let drinkStackView = UIStackView()
                innerStackView.addArrangedSubview(drinkStackView)
                drinkStackView.axis = .horizontal
                let imageView = UIImageView(image: drinkImage[3*i+j])
                imageView.contentMode = .scaleAspectFit
                drinkStackView.addArrangedSubview(imageView)
                drinkStackView.distribution = .fillProportionally
            }
            innerStackView.distribution = .fillEqually
        }
        drinksDisplayStackView.distribution = .fillEqually
        drinksDisplayStackView.spacing = 2
        view.addSubview(drinksDisplayStackView)
        drinksDisplayStackView.translatesAutoresizingMaskIntoConstraints = false
    }

    func drinkDisplayConstraint() -> [NSLayoutConstraint] {
        let topConstraint = NSLayoutConstraint(item: drinksDisplayStackView,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: view,
                                               attribute: .top,
                                               multiplier: 1,
                                               constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: drinksDisplayStackView,
                                               attribute: .bottom,
                                               relatedBy: .equal,
                                               toItem: view,
                                               attribute: .bottom,
                                               multiplier: 1,
                                               constant: 0)
        let leadingConstraint = NSLayoutConstraint(item: drinksDisplayStackView,
                                                  attribute: .leading,
                                                  relatedBy: .equal,
                                                  toItem: view,
                                                  attribute: .leading,
                                                  multiplier: 1,
                                                  constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: drinksDisplayStackView,
                                                  attribute: .trailing,
                                                  relatedBy: .equal,
                                                  toItem: view,
                                                  attribute: .trailing,
                                                  multiplier: 1,
                                                  constant: 0)
        return [topConstraint, bottomConstraint, leadingConstraint, trailingConstraint]
    }

}
