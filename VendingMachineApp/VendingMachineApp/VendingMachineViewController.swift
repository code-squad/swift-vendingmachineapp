//
//  VendingMachineViewController.swift
//  VendingMachineApp
//
//  Created by 김성현 on 16/07/2019.
//  Copyright © 2019 김성현. All rights reserved.
//

import UIKit

class VendingMachineViewController: UIViewController, UICollectionViewDataSource {
    
    //MARK: 프로퍼티
    
    let machine = VendingMachine()
    
    @IBOutlet weak var beverageCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beverageCollectionView.dataSource = self
//        beverageCollectionView.delegate = self
        loadSampleBeverages()
        
    }
    
    //MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return machine.inventory.allBeverages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "BeverageCollectionViewCell"
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? BeverageCollectionViewCell else {
            fatalError("큐에서 제거된 Cell은 BeverageCollectionViewCell의 인스턴스가 아님")
        }
        let beverage = machine.inventory.allBeverages[indexPath.row]
        cell.addButton.tag = indexPath.row
        cell.countLabel.text = "\(beverage.count)"
        cell.photoImageVIew.image = beverage.photo
        
        return cell
    }
    
    //MARK: 비공개 메소드
    
    private func loadSampleBeverages() {
        let sampleBeverages = [
            TOPCoffee(),
            CantataCoffee(),
            StrawberryMilk(),
            ChocolateMilk(),
            Cola(),
            LemonlimeDrink()
        ]
        sampleBeverages.forEach { machine.addBeverageType($0) }
    }
    
}
