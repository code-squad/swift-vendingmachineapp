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
    let maker = BeverageMaker()
    
    @IBOutlet weak var beverageCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beverageCollectionView.dataSource = self
        
    }
    
    //MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 미완성
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "BeverageCollectionViewCell"
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? BeverageCollectionViewCell else {
            fatalError("큐에서 제거된 Cell은 BeverageCollectionViewCell의 인스턴스가 아님")
        }
        
        
        return cell
    }
    
}
