//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import UIKit

class ViewController: UIViewController {
    
    let itemCountPerDisplayStand = 4
    let mainStackView : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()
    
    var inspectorView : InspectorStackView!
    
    var addCoinButton : UIButton!
    var addCoinButton2 : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        let imageViews = ViewsUtility.getStockCell(names: ["banana", "chocolate", "stroberry", "coke", "sprite", "top", "georgia","cantata"])
        
        for i in stride(from: 0, to: imageViews.count , by: itemCountPerDisplayStand){
            let stackview = StockHorizontalStackView()
            for view in imageViews[i..<min(i+itemCountPerDisplayStand, imageViews.count)] {
                stackview.addArrangedSubview(view)
            }
            mainStackView.addArrangedSubview(stackview)
        }
        
        self.view.addSubview(mainStackView)
        mainStackViewConfiguration()
        
        inspectorView = InspectorStackView()
        self.view.addSubview(inspectorView)
        inspectorViewConfiguration()
    }
    func mainStackViewConfiguration(){
        mainStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -200).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
    func inspectorViewConfiguration(){
        inspectorView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        inspectorView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 840).isActive = true
        inspectorView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        inspectorView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
}


