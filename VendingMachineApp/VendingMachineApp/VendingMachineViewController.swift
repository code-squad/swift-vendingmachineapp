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
    
    private var machine = VendingMachine.shared
    
    @IBOutlet weak var beverageCollectionView: UICollectionView!
    
    @IBOutlet weak var coinsDepositedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beverageCollectionView.dataSource = self
        reloadCoinsDepositedLabel()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadCoinsDepositedLabel), name: .reloadCoinsDeposited, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reloadBeverageCell(with:)), name: .reloadBeverageItem, object: nil)
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
        let item = machine.inventory.allBeverages[indexPath.row]
        cell.addButton.addTarget(self, action: #selector(addBeverageButtonTapped), for: .touchUpInside)
        cell.countLabel.text = "\(item.count)개"
        cell.photoImageVIew.image = SampleBeverageItemMaker.beverageImage(for: item)
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
    }
    
    @IBAction func loadSamplesButtonTapped(_ sender: UIButton) {
        machine.loadSampleBeverages()
        beverageCollectionView.reloadData()
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
    }
    
    //MARK: 비공개 메소드
    
    @objc private func reloadCoinsDepositedLabel() {
        coinsDepositedLabel.text = "\(machine.coinsDeposited) 코인"
    }
    
    @objc private func reloadBeverageCell(with notification: Notification) {
        // 업데이트 되어야 할 셀의 정보를 받지 못하면 전체 데이터를 리로드합니다.
        guard let info = notification.userInfo as? [String: BeverageItem], let item = info["item"] else {
            beverageCollectionView.reloadData()
            return
        }
        guard let index = machine.inventory.allBeverages.firstIndex(of: item) else {
            print("존재하지 않는 음료 정보를 전달받음")
            return
        }
        reloadBeverageCell(at: index)
    }
    
    private func reloadBeverageCell(at index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        beverageCollectionView.reloadItems(at: [indexPath])
    }
}
