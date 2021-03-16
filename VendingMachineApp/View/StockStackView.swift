//
//  StockStackView.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/09.
//

import UIKit

class StockStackView: UIStackView {
    
    private let itemCountPerStand : Int = 4
    
    var stockCells : [OneStockView]!
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        confiure()
        setStockCells()
        setUp()
    }
    override init(frame: CGRect){
        super.init(frame: frame)
        confiure()
        setStockCells()
        setUp()
    }

    func setUp(){
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
        
        ImageManager.types.forEach{ type in
          
            let stock : OneStockView = {
                let stockview = OneStockView(frame: CGRect(x: 0, y: 0, width: 180, height: 180))
                stockview.beverageType = type
                stockview.stockImageView.image = ImageManager.getImage(type: type.self)
                stockview.button.setType(with: type)
                stockview.button.setTitle("추가하기", for: .normal)
                return stockview
            }()
            
            stockCells.append(stock)
        }
    }
    
    func setStocksCount(info dict : [ObjectIdentifier: [Beverage]]){
        stockCells.forEach{ stock in
            let value =  dict[ObjectIdentifier(stock.beverageType)]?.count ?? 0
            stock.reloadLabelText(count: value)
        }
    }
    func confiure(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.distribution = .fillEqually
        self.spacing = 50
    }
    
}
