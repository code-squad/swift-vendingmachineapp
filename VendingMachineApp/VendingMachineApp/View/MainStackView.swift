//
//  MainStackView.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/08.
//

import UIKit

class SKUStackView {

    private let mainStackView = UIStackView()

    private var beverageStackView = [UIView]()
    
    private func addBeverageToStackView() {
        for i in 0...4 {
            beverageStackView.append(BeverageStackView(imageName: "\(i).jpg").makeBeverageViewSet())
        }
    }

    private func addBeverageViewToMainView() {
        mainStackView.axis = NSLayoutConstraint.Axis.horizontal
        mainStackView.distribution = UIStackView.Distribution.fillProportionally
        mainStackView.alignment = UIStackView.Alignment.center
        mainStackView.spacing = 16.2
        mainStackView.translatesAutoresizingMaskIntoConstraints = false

        for i in 0..<beverageStackView.count {
            mainStackView.addArrangedSubview(beverageStackView[i])
        }
    }

    public func makeMainStackView() -> UIStackView {
        return mainStackView

    }

    init() {
        addBeverageToStackView()
        addBeverageViewToMainView()
    }

}
