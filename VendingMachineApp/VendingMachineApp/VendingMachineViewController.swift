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
    
    var machine: VendingMachine!
    
    @IBOutlet weak var beverageCollectionView: UICollectionView!
    
    @IBOutlet weak var coinsDepositedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        machine = (UIApplication.shared.delegate as! AppDelegate).machine
        beverageCollectionView.dataSource = self
        reloadCoinsDepositedLabel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
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
        let visibleCells = beverageCollectionView.visibleCells.compactMap { (cell) -> BeverageCollectionViewCell? in
            guard let cell = cell as? BeverageCollectionViewCell else {
                // 셀이 BeverageCollectionViewCell의 인스턴스가 아니면 배열에서 제거
                return nil
            }
            return cell
        }
        let visibleButtons = visibleCells.map { $0.addButton! }
        guard let index = visibleButtons.firstIndex(of: button) else {
            // 버튼이 배열에 존재하지 않으면 함수를 종료합니다.
            return
        }
        
        let indexPath = beverageCollectionView.indexPath(for: visibleCells[index])!
        machine.inventory.allBeverages[indexPath.row].addBeverage()
        reloadBeverageCell(at: indexPath.row)
    }
    
    //MARK: 비공개 메소드
    
    private func reloadCoinsDepositedLabel() {
        coinsDepositedLabel.text = "\(machine.coinsDeposited) 코인"
    }
    
    private func reloadBeverageCell(at index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        beverageCollectionView.reloadItems(at: [indexPath])
    }
}
