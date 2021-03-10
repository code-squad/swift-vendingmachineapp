//
//  StockStackView.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/09.
//

import UIKit

class StockStackView: UIStackView {
    
    private let itemCountPerStand : Int = 4
    private let images : [UIImage?] = [UIImage(named: "top"),UIImage(named: "georgia"),UIImage(named: "cantata"),
                                       UIImage(named: "sprite"),UIImage(named: "coke"), UIImage(named: "stroberry"),
                                       UIImage(named: "chocolate"),UIImage(named: "banana"), UIImage(named: "monsterOriginal"),
                                       UIImage(named: "hot6ixBlue"),UIImage(named: "hot6ixRed")]
    
    private let typeArr : [Beverage.Type] = [ Top.self, Georgia.self, Cantata.self, Sprite.self, Coke.self,
                                              StroberryMilk.self, ChocolateMilk.self, BananaMilk.self, Monster.self, Hot6ix.self]
    
    var stockCells : [OneStockView]!
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        confiure()
    }
    override init(frame: CGRect){
        super.init(frame: frame)
        confiure()
    }

    func setUp(){
        
        setStockCells()
        for i in stride(from: 0, to: stockCells.count , by: itemCountPerStand){
            let stackview = UIStackView()
            
            stackview.axis = .horizontal
            stackview.distribution = .fillEqually
            stackview.spacing = 5
            stackview.translatesAutoresizingMaskIntoConstraints = false
            
            for view in stockCells[i..<min(i+itemCountPerStand, stockCells.count)] {
                stackview.addArrangedSubview(view)
            }
            self.addArrangedSubview(stackview)
        }
    }
    
    func setStockCells(){
        stockCells = [OneStockView]()
        for (typeElement, image) in zip(typeArr, images) {
            let stock = OneStockView(frame: CGRect(x: 0, y: 0, width: 180, height: 180), type: typeElement, image: image)
            stockCells.append(stock)
        }
    }
    
    func confiure(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.distribution = .fillEqually
        self.spacing = 50
    }
    
}
