//
//  VendingViewController.swift
//  VendingMachineApp
//
//  Created by hw on 22/07/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import UIKit

class VendingViewController: UIViewController {
    private var vendingMachine: VendingMachine!
    @IBOutlet weak var balanceInfo: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let startX: CGFloat = 40
    private var startY: CGFloat = 575
    private var currentImageX: CGFloat = 40
    private let space = 50
    private let width: CGFloat = 100, height: CGFloat = 100
    private var historyImageList : [UIImageView] = [UIImageView]()
    
    func configure(_ vendingMachine: VendingMachine) {
        self.vendingMachine = vendingMachine
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNotificationObservers()
        presentCurrentHistory()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateBalance()
    }
    
    private func addNotificationObservers(){
        addGridCellObserver()
        addBuyButtonObserver()
        addBalanceObserver()
    }
    
    private func addGridCellObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateGridCell(notification:)),
                                               name: .notifyDrinkStockSizeUpdate,
                                               object: nil)
    }
    
    private func addBuyButtonObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(buyDrink(notification:)),
                                               name: .buyDrinkButton,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(followUpSellDrink(notification:)),
                                               name: .notifySellingResult, object: nil)
    }
    
    private func addBalanceObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateBalanceLabel),
                                               name: .notifyBalanceInfoUpdate,
                                               object: nil)
    }
    
    @objc func updateGridCell(notification: Notification) {
        guard var number = notification.object as? Int else{
            return
        }
        number -= 1
        var indexPaths: [IndexPath] = [IndexPath]()
        indexPaths.append(IndexPath.init(item: number, section: 0))
        collectionView.reloadItems(at: indexPaths)
    }
    
    private func unwrapDrinkId(_ object: Any?) -> Int? {
        guard let itemIndex = object as? Int else{
            return nil
        }
        return itemIndex
    }
    
    
    @objc func buyDrink(notification: Notification) {
        guard let itemIndex = unwrapDrinkId(notification.object) else{
            return
        }
        do {
            _ = try vendingMachine.sellProduct(productId: itemIndex)
            try vendingMachine.showSpecifiedDrinkStockSize(itemIndex)
        }catch let error as VendingMachineError{
            displayAlertInplace(error)
        }catch{
        }
    }
    
    func decideSellDrinkResult(_ userInfo: [String : Any]) -> Any? {
        guard let index = userInfo["result"] as? Result<Int, VendingMachineError>  else{
            return VendingMachineError.unknownError
        }
        guard let drinkId = try? index.get() else {
            guard let error = userInfo["result"] as? Result<Int, VendingMachineError> else{
                return VendingMachineError.unknownError
            }
            return error
        }
        return drinkId
    }
    
    @objc func followUpSellDrink(notification: Notification) {
        guard let result = decideSellDrinkResult(notification.userInfo as! [String : Any]) else{
            return
        }
        guard let index = result as? Int else{
            guard let error = result as? VendingMachineError else{
                return
            }
            displayAlertInplace(error)
            return
        }
        updateShoppingHistory(index)
    }
    
    private func updateShoppingHistory(_ index: Int) {
        let historyListSize = vendingMachine.showShoppingHistory().count - 1
        guard let drinkImg: UIImage = UIImage.init(named: "\(index).jpg") else{
            return
        }
        let cardImage: UIImageView = UIImageView(image: drinkImg)
        let (currentImageX, convertedImage) = configureCoordinates(size: historyListSize, cardImage: cardImage)
        saveCardImageInfo(x: currentImageX, y: startY, width: width, height: height, index: index)
        view.addSubview(convertedImage)
    }
    
    /// 화면 벗어나는 경우 처리
    private func configureCoordinates(size: Int, cardImage: UIImageView) -> (currentImageX: CGFloat, cardImage: UIImageView) {
        let modifiedSize = size < 20 ? size : size - 20 * (size/20)
        let originalY = startY
        startY = size < 20 ? startY : (startY + CGFloat(50 * (size/20)))
        currentImageX = startX + CGFloat(space * (modifiedSize))
        cardImage.frame = CGRect.init(x: currentImageX, y: startY, width: width, height: height)
        startY = originalY
        return (currentImageX, cardImage)
    }
    
    private func saveCardImageInfo(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, index: Int) {
        let imageInfo = ImageInfo.init(x: Double(x),
                                       y: Double(y),
                                       width: Double(width),
                                       height: Double(height),
                                       imageName: "\(index).jpg")
        vendingMachine.addDrinkInfo(imageInfo)
    }
    
    private func presentCurrentHistory() {
        convertImageInfoToImageView()
        historyImageList.forEach({ (subView) in
            view.addSubview(subView)
        })
    }
    
    private func convertImageInfoToImageView() {
        let history = vendingMachine.showShoppingHistory()
        let imageInfoList = history.images
        imageInfoList.forEach { (imageInfo) in
            let drinkImg: UIImage = UIImage.init(named: "\(imageInfo.imageName)")!
            let cardImage = UIImageView.init(image: drinkImg)
            cardImage.frame = CGRect.init(x: CGFloat(imageInfo.x), y: CGFloat(imageInfo.y), width: CGFloat(imageInfo.width), height: CGFloat(imageInfo.height))
            historyImageList.append(cardImage)
        }
    }
    
    private func displayAlertInplace(_ error: VendingMachineError) {
        let alert = UIAlertController(title: "에러발생", message: "\(error)", preferredStyle: UIAlertController.Style.alert)
        let errorConfirmAction = UIAlertAction(title:"확인", style: .default, handler: nil)
        alert.addAction(errorConfirmAction)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func updateBalanceLabel() {
        updateBalance()
    }
    
    private func updateBalance() {
        vendingMachine.showCurrentBalanceInfo(printFormat: { (balance) in
            balanceInfo.text = "\(balance)원"
        })
    }
    
    private func printInitialDrinkMenuList() {
        let printDrinkMenuListFormat = {
            (sortedMenutable: [(key: Int, value: DrinkItemList)]) in
            sortedMenutable.forEach{ (key: Int, value: DrinkItemList) in
                print( "\(value.drinkName)(\(value.drinkStockList.count)개)", terminator: " ")
            }
        }
        vendingMachine.displayDrinkMenuList(printFormat: printDrinkMenuListFormat)
    }
    
    @IBAction func handleChargeBalanceButton(_ sender: UIButton) {
        let balanceSize = sender.tag
        var chargeInput = 0
        if balanceSize == MoneyQuantity.oneThousand.rawValue{
            chargeInput = MoneyQuantity.oneThousand.rawValue
        }else if balanceSize == MoneyQuantity.fiveThousand  .rawValue{
            chargeInput = MoneyQuantity.fiveThousand.rawValue
        }
        vendingMachine.chargeBalance(chargeInput)
        updateBalance()
    }
}

extension VendingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vendingMachine.showDrinkStockTableMenuSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.item+1
        guard let stockSize = try? vendingMachine.showSpecifiedDrinkStockSize(index) else{
            return UICollectionViewCell()
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as! GridCell
        cell.updateDrinkInfo(drinkStockSize: stockSize, index: index)
        cell.configureButtonStyle()
        return cell
    }
}

extension VendingViewController: UICollectionViewDelegateFlowLayout {
    ///cell size를 기기에 맞게 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.bounds.width-50)/5 - 10
        let height: CGFloat = collectionView.bounds.height
        return CGSize.init(width: width, height: height)
    }
}
