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
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("123")
        return vendingMachine.countType()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DrinkCollectionCell", for: indexPath) as? DrinkCollectionCell else {
            return UICollectionViewCell()
        }
        
        let item = vendingMachine.drinkStock(at: indexPath.item)
        cell.updateUI(item: item)
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



