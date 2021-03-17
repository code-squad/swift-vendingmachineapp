import UIKit

class StockView: UIView {
    
    private var stockImage: UIImage!
    private var stockImageView: UIImageView!
    private(set) var beverageStock = UILabel()
    private var addBeverage: AddBeverageButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubView()
    }
    
    init(frame: CGRect, image: UIImage, type: Beverage.Type) {
        super.init(frame: frame)
        stockImage = image
        addBeverage = AddBeverageButton(frame: CGRect(x: 100, y: 30, width: 80, height: 40), type: type)
        configureSubView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureSubView()
    }
    
    private func configureSubView() {
        setUpLabel()
        setUpImage()
        configureImageView()
        setUpButton()
    }
    
    private func configureImageView() {
        let imageViewWidth = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        let imageViewHeight = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120)
        addConstraints([imageViewWidth, imageViewHeight])
    }
    
    private func setUpImage() {
        stockImageView = UIImageView(image: stockImage)
        addSubview(stockImageView)
        stockImageView.contentMode = .scaleAspectFit
        stockImageView.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
    }
    
    private func setUpLabel() {
        addSubview(beverageStock)
        beverageStock.text = "0개"
        beverageStock.textAlignment = .center
        beverageStock.frame = CGRect(x: 100, y: 5, width: 30, height: 20)
    }
    
    private func setUpButton() {
        addSubview(addBeverage)
    }
    
    func updateStockLabel(stock: Int) {
        beverageStock.text = "\(stock)개"
    }
}
