//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var beveragesCollectionView: UICollectionView!
    @IBOutlet weak var moneyLabel: UILabel!
    
    private let images = [UIImage(named: "bananaMilk"), UIImage(named: "top"), UIImage(named: "cokaCola")]
    private let types: [BeverageFactory.Type] = [MilkFactory.self, CoffeeFactory.self, SodaFactory.self]
    private var updateModelHelper: [UIButton: BeverageFactory.Type] = [:]
    private var updateLabelHelper: [UIButton: UILabel] = [:]
    private var vendingMachine = VendingMachine()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        beveragesCollectionView.register(BeverageViewCell.self, forCellWithReuseIdentifier: "BeverageViewCell")
        beveragesCollectionView.delegate = self
        beveragesCollectionView.dataSource = self
        beveragesCollectionView.backgroundColor = .none
        view.addSubview(beveragesCollectionView)
    }
    
    @IBAction func addMoney5000(_ sender: Any) {
        vendingMachine.put(in: .fiveThousand)
        moneyLabel.text = "잔액: \(vendingMachine.showCurrentMoney()) 원"
    }
    
    @IBAction func addMoney1000(_ sender: Any) {
        vendingMachine.put(in: .thousand)
        moneyLabel.text = "잔액: \(vendingMachine.showCurrentMoney()) 원"
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeverageViewCell", for: indexPath) as? BeverageViewCell else {
            return UICollectionViewCell()
        }
        
        if let image = images[indexPath.row] {
            initializeHelpers(cell: cell, indexPath: indexPath)
            cell.beveragesView.setImage(image: image)
            cell.beveragesView.setLabel(text: "0")
            cell.beveragesView.addToInventoryButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        }
        return cell
    }

    private func initializeHelpers(cell: BeverageViewCell, indexPath: IndexPath) {
        updateModelHelper[cell.beveragesView.addToInventoryButton] = types[indexPath.row]
        updateLabelHelper[cell.beveragesView.addToInventoryButton] = cell.beveragesView.numberOfBeveragesLabel
    }
  
    @objc
    func didTapButton(_ sender: UIButton!) {
        guard let updatedBeverage = updateModel(sender: sender) else {
            return
        }
        updateView(sender: sender, beverageType: type(of: updatedBeverage))
    }
    
    private func updateModel(sender: UIButton!) -> Beverage? {
        guard let beverageFactory = updateModelHelper[sender] else {
            return nil
        }
        let beverage = beverageFactory.create()
        vendingMachine.appendInventory(beverage)

        return beverage
    }
    
    private func updateView(sender: UIButton!, beverageType: Beverage.Type) {
        let allBeverageList = vendingMachine.showAllBeverageList()
        
        guard let beverages = allBeverageList[ObjectIdentifier(beverageType)] else
        { return }
        guard let label = updateLabelHelper[sender] else
        { return }
        
        label.text = String(beverages.count)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {

    // 위 아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    // 옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    // cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCell = images.count
        let width = collectionView.frame.width / CGFloat(numberOfCell)
        let height = collectionView.frame.height

        let size = CGSize(width: width, height: height)
        return size
    }

    // 컬렉션 뷰 가운데 정렬
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let collectionViewWidth = collectionView.frame.width
        let numberOfCell = images.count
        let totalCellWidth = (Int(collectionView.frame.width) / numberOfCell) * numberOfCell
        let totalSpacingWidth = 1 * (numberOfCell-1)
        let leftInset = (collectionViewWidth - (CGFloat(totalCellWidth) + CGFloat(totalSpacingWidth))) / 2
        let rightInset = leftInset
        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
}
