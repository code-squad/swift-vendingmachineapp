//
//  VendingViewController.swift
//  VendingMachineApp
//
//  Created by hw on 22/07/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import UIKit

class VendingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    private var vendingMachine: VendingMachine!
    @IBOutlet weak var balanceInfo: UILabel!
    
    override func viewDidLoad() {
        vendingMachine = MockVendingMachineCreator.initializeVendingMachine()
        printInitialDrinkMenuList()
        updateBalance()
        super.viewDidLoad()
    }
    
    private func updateBalance(){
        vendingMachine.showCurrentBalanceInfo(printFormat: { (balance) in
            balanceInfo.text = "\(balance)원"
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("size : \(vendingMachine.showDrinkStockTable().stockTable.count)")
        return vendingMachine.showDrinkStockTable().stockTable.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let info = vendingMachine.showDrinkStockTable()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as! GridCell
        cell.updateDrinkInfo(drinkStock: info, index: indexPath.item)
        return cell
    }
    
    private func printInitialDrinkMenuList(){
        let printDrinkMenuListFormat = {
            (sortedMenutable: [(key: Int, value: DrinkItemList)]) in
            sortedMenutable.forEach{ (key: Int, value: DrinkItemList) in
                print( "\(value.drinkName)(\(value.drinkStockList.count)개)", terminator: " ")
            }
        }
        vendingMachine.displayDrinkMenuList(printFormat: printDrinkMenuListFormat)
    }
    
    @IBAction func handleChargeBalanceButton(_ sender: UIButton) {
        guard let balanceSize = sender.currentTitle else {
            return
        }
        var chargeInput = 0
        if balanceSize == "+1000"{
            chargeInput = 1000
        }else if balanceSize == "+5000"{
            chargeInput = 5000
        }
        vendingMachine.chargeBalance(chargeInput)
        updateBalance()
    }

}

extension VendingViewController: UICollectionViewDelegateFlowLayout {
    ///cell size를 기기에 맞게 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.bounds.width-50)/5
        let height: CGFloat = collectionView.bounds.height
        return CGSize.init(width: width, height: height)
    }
}

class GridCell: UICollectionViewCell{
    @IBOutlet var imgView: UIImageView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var stockInfoLabel: UILabel!
    private var itemIndex: Int!
    
    @IBAction func testButton(_ sender: UIButton) {
        guard let currentStock = stockInfoLabel.text else{
            return
        }
        guard let stockSize = Int(currentStock.components(separatedBy: "개")[0]) else{
            return
        }
        stockInfoLabel.text = "\(stockSize+1)개"
    }
    
    func updateDrinkInfo(drinkStock: DrinkStockTable, index: Int){
        guard let img: UIImage = UIImage.init(named: "\(index+1).jpg") else{
            return
        }
        imgView.image = img
        guard let drinkItemList = drinkStock.stockTable[index+1] else{
            return
        }
        stockInfoLabel.text = "\(drinkItemList.drinkStockList.count)개"
        itemIndex = index
    }
}
