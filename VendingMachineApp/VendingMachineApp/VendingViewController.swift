//
//  VendingViewController.swift
//  VendingMachineApp
//
//  Created by hw on 22/07/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import UIKit

class VendingViewController: UIViewController{
    private var vendingMachine: VendingMachine!
    @IBOutlet weak var balanceInfo: UILabel!
    
    override func viewDidLoad() {
        vendingMachine = MockVendingMachineCreator.initializeVendingMachine()
        printInitialDrinkMenuList()
        updateBalance()
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(displayAlert(notification:)), name: .addDrinkButtonError, object: nil)
    }
    
    @objc func displayAlert(notification:Notification){
        let errorInfo = notification.object as! VendingMachineError
        let alert = UIAlertController(title: "에러발생", message: "\(errorInfo)", preferredStyle: UIAlertController.Style.alert)
        let errorConfirmAction = UIAlertAction(title:"확인", style: .default, handler: nil)
        alert.addAction(errorConfirmAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func updateBalance(){
        vendingMachine.showCurrentBalanceInfo(printFormat: { (balance) in
            balanceInfo.text = "\(balance)원"
        })
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

extension VendingViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vendingMachine.showDrinkStockTableMenuSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let info = vendingMachine.showDrinkStockTable()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as! GridCell
        cell.updateDrinkInfo(drinkStock: info, index: indexPath.item, vendingMachine: vendingMachine)
        return cell
    }
}

extension VendingViewController: UICollectionViewDelegateFlowLayout {
    ///cell size를 기기에 맞게 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.bounds.width-50)/5 - 10
        let height: CGFloat = collectionView.bounds.height
        return CGSize.init(width: width, height: height)
    }
}

extension Notification.Name {
    static let addDrinkButtonError = Notification.Name(rawValue: "AddDrinkButtonError")
}

class GridCell: UICollectionViewCell{
    @IBOutlet var imgView: UIImageView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var stockInfoLabel: UILabel!
    private var itemIndex: Int!
    private var vendingMachine: VendingMachine!
    
    @IBAction func addDrinkStockButton(_ sender: UIButton) {
        do {
            let drink = try vendingMachine.selectProduct(productId: itemIndex)
            try vendingMachine.addDrinkStock(drink, quantity: 1)
            let stockSize = try vendingMachine.showSpecifiedDrinkStockSize(itemIndex)
            stockInfoLabel.text = "\(stockSize)개"
        }catch let error as VendingMachineError{
                NotificationCenter.default.post(name: .addDrinkButtonError , object: error)
        }catch {
        }
    }
    
    private func setImageViewBorderRound(){
        imgView.layer.cornerRadius = 10
        imgView.layer.borderWidth = 1
        imgView.layer.borderColor = UIColor.cyan.cgColor
    }
    
    private func setImage(_ index: Int) {
        guard let img: UIImage = UIImage.init(named: "\(index+1).jpg") else{
            return
        }
        imgView.image = img
        setImageViewBorderRound()
    }
    
    func updateDrinkInfo(drinkStock: DrinkStockTable, index: Int, vendingMachine: VendingMachine){
        setImage(index)
        guard let drinkItemList = drinkStock.stockTable[index+1] else{
            return
        }
        stockInfoLabel.text = "\(drinkItemList.drinkStockList.count)개"
        itemIndex = index+1
        self.vendingMachine = vendingMachine
    }
}
