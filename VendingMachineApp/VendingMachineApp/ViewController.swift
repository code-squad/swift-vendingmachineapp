//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    var vendingMachine = VendingMachine()
    @IBOutlet var drinkCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drinkCollectionView.delegate = self
        drinkCollectionView.dataSource = self
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(addDrink(_:)),
                                               name: NSNotification.Name(rawValue: "PostButton"),
                                               object: nil)
    }
    
    @objc
    func addDrink(_ notification: Notification) {
        guard let drinkType = notification.object else {
            return
        }
        guard let newDrink = DrinkFactory.create(type: drinkType as! Drink.Type) else {
            return
        }
        vendingMachine.append(newDrink)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vendingMachine.countType()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DrinkCollectionCell", for: indexPath) as? DrinkCollectionCell else {
            return UICollectionViewCell()
        }
        
        let drinkType = vendingMachine.drinkType(at: indexPath.item)
        let drinkStock = vendingMachine.drinkStock(at: indexPath.item)
        cell.updateUI(drinkType: String(describing: drinkType), count: drinkStock)
        cell.drinkType = { () in
            return drinkType
        }
        cell.btnTapAction = { () in
        }
        return cell
        
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 20 - drink - 20 - drink - 20 drink - 20
        let width:CGFloat = (collectionView.bounds.width - (20 * 4))/3
        let height = width
        
        return CGSize(width: width, height: height)
    }
    
}



