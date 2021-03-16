import UIKit

class StockView: UIImageView {
    
    private var stockImage: UIImage!
    private var stockImageView: UIImageView!
    private var beverageStock = UILabel()
    private var addBeverage = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubView()
    }
    
    init(frame: CGRect, image: UIImage) {
        super.init(frame: frame)
        stockImage = image
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
        let imageViewWidth = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120)
        let imageViewHeight = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120)
        addConstraints([imageViewWidth, imageViewHeight])
    }
    
    private func setUpImage() {
        stockImageView = UIImageView(image: stockImage)
        stockImageView.contentMode = .scaleAspectFit
        stockImageView.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        addSubview(stockImageView)
    }
    
    private func setUpLabel() {
        beverageStock.text = "0개"
        beverageStock.textAlignment = .center
        beverageStock.frame = CGRect(x: 100, y: 5, width: 30, height: 20)
        addSubview(beverageStock)
    }
    
    private func setUpButton() {
        addBeverage.setTitle("재고추가", for: .normal)
        addBeverage.setImage(UIImage(named: "button"), for: .normal)
        addBeverage.frame = CGRect(x: 100, y: 30, width: 80, height: 40)
        addBeverage.setTitleColor(UIColor.blue, for: .normal)
        addSubview(addBeverage)
    }
}
