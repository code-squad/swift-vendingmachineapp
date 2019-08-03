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
    
    @IBOutlet weak var coinsDepositedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beverageCollectionView.dataSource = self
        loadSampleBeverages()
        reloadCoinsDepositedLabel()
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
        cell.countLabel.text = "\(beverage.count)개"
        cell.photoImageVIew.image = beverage.photo
        
        return cell
    }
    
    //MARK: 액션
    
    @IBAction func insertCoinsButtonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            machine.insertCoins(5000)
        case 1:
            machine.insertCoins(1000)
        default:
            fatalError("유효하지 않은 insertCoins 버튼 태그")
        }
        reloadCoinsDepositedLabel()
    }
    
    @IBAction func addBeverageButton(_ sender: UIButton) {
        let index = sender.tag
        let beverage = machine.inventory.allBeverages[index]
        machine.addBeverage(beverage)
        reloadBeverageCount(at: index)
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
    
    private func reloadCoinsDepositedLabel() {
        coinsDepositedLabel.text = "\(machine.coinsDeposited) 코인"
    }
    
    private func reloadBeverageCount(at index: Int) {
        guard let cell = beverageCollectionView.cellForItem(at: IndexPath(row: index, section: 0)) as? BeverageCollectionViewCell else {
            fatalError("유효하지 않은 인덱스: \(index) 또는 셀이 BeverageCollectionViewCell이 아님.")
        }
        cell.countLabel.text = "\(machine.inventory.allBeverages[index].count)개"
    }
    
    
    
}
