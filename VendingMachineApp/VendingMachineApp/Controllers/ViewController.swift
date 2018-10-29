//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 이동건 on 29/10/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var vendingMachine = VendingMachine(Stocks(WareHouse.generateBeverages(10)))
    private let inset: CGFloat = 20
    private let spacing: CGFloat = 20
    private let itemsOnRow = 4
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(handleBeverageAdded), name: VendingMachineNotification.didAdd.name, object: nil)
    }
    
    @objc func handleBeverageAdded(_ notification: Notification) {
        guard let className = notification.object as? String else { return }
        let beverage = WareHouse.generateBeverage(by: className)
        vendingMachine.add(beverage)
        collectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BeverageCell.reusableIdentifier, for: indexPath) as? BeverageCell else {
            return UICollectionViewCell()
        }
        
        cell.setup(bundle: vendingMachine.bundles[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vendingMachine.bundles.count
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        let collectionViewWidth: CGFloat = collectionView.frame.width
        let insetSpacing = inset * 2
        let itemSpacing = spacing * CGFloat((itemsOnRow - 1))

        let width = (collectionViewWidth - insetSpacing - itemSpacing) / CGFloat((itemsOnRow - 1))
        let height = width * 1.2
        
        return CGSize(width: width, height: height)
    }
}

