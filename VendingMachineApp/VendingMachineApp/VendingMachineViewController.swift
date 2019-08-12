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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return machine.inventory.allBeverages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "BeverageCollectionViewCell"
        let cell: BeverageCollectionViewCell
        
        if let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? BeverageCollectionViewCell {
            cell = dequeuedCell
        } else {
            cell = BeverageCollectionViewCell()
        }
        let beverage = machine.inventory.allBeverages[indexPath.row]
        cell.addButton.addTarget(self, action: #selector(addBeverageButtonTapped), for: .touchUpInside)
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
            return
        }
        reloadCoinsDepositedLabel()
    }
    
    @objc func addBeverageButtonTapped(button: UIButton) {
        // 눌린 버튼이 속한 셀의 Index Path를 사용해 재고를 추가하도록 합니다.
        let visibleCells = beverageCollectionView.visibleCells.map { (cell) -> BeverageCollectionViewCell in
            guard let cell = cell as? BeverageCollectionViewCell else {
                fatalError("셀이 BeverageCollectionViewCell의 인스턴스가 아님")
            }
            return cell
        }
        let visibleButtons = visibleCells.map { $0.addButton! }
        guard let index = visibleButtons.firstIndex(of: button) else {
            fatalError("버튼: \(button)은(는) 배열: \(visibleButtons)에 존재하지 않습니다.")
        }
        
        let indexPath = beverageCollectionView.indexPath(for: visibleCells[index])!
        machine.inventory.allBeverages[indexPath.row].addBeverage()
        reloadBeverageCount(at: indexPath.row)
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
        let indexPath = IndexPath(row: index, section: 0)
        beverageCollectionView.reloadItems(at: [indexPath])
    }
}
