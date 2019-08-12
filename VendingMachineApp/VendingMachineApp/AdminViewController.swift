//
//  AdminViewController.swift
//  VendingMachineApp
//
//  Created by hw on 12/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {
    private var vendingMachine: VendingMachine! = VendingMachine.sharedInstance
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func closeButton(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNotificationObservers()
    }
    

    private func addNotificationObservers(){
        addDrinkButtonObserver()
        addGridCellObserver()
    }
    
    private func addDrinkButtonObserver(){
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(increaseDrinkStock(notification:)),
                                               name: .addDrinkButton,
                                               object: nil)
    }
    
    private func addGridCellObserver(){
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateGridCell(notification:)),
                                               name: .notifyDrinkStockSizeUpdate,
                                               object: nil)
    }

    @objc func updateGridCell(notification: Notification){
        guard var number = notification.object as? Int else{
            return
        }
        number -= 1
        var indexPaths: [IndexPath] = [IndexPath]()
        indexPaths.append(IndexPath.init(item: number, section: 0))
        collectionView.reloadItems(at: indexPaths)
    }
    
    private func unwrapDrinkId(_ object: Any?) -> Int?{
        guard let itemIndex = object as? Int else{
            return nil
        }
        return itemIndex
    }
    
    @objc func increaseDrinkStock(notification: Notification){
        guard let itemIndex = unwrapDrinkId(notification.object) else{
            return
        }
        do {
            let drink = try vendingMachine.selectProduct(productId: itemIndex)
            try vendingMachine.addDrinkStock(drink, quantity: 1)
            try vendingMachine.showSpecifiedDrinkStockSize(itemIndex)
        }catch let error as VendingMachineError{
            displayAlertInplace(error)
        }catch {
        }
    }
    
    private func displayAlertInplace(_ error: VendingMachineError){
        let alert = UIAlertController(title: "에러발생", message: "\(error)", preferredStyle: UIAlertController.Style.alert)
        let errorConfirmAction = UIAlertAction(title:"확인", style: .default, handler: nil)
        alert.addAction(errorConfirmAction)
        present(alert, animated: true, completion: nil)
    }
}

extension AdminViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vendingMachine.showDrinkStockTableMenuSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.item+1
        guard let stockSize = try? vendingMachine.showSpecifiedDrinkStockSize(index) else{
            return UICollectionViewCell()
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdminGridCell", for: indexPath) as! AdminGridCell
        cell.updateDrinkInfo(drinkStockSize: stockSize, index: index)
        cell.configureButtonStyle()
        return cell
    }
}

extension AdminViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.bounds.width-50)/5 - 10
        let height: CGFloat = collectionView.bounds.height
        return CGSize.init(width: width, height: height)
    }
}
