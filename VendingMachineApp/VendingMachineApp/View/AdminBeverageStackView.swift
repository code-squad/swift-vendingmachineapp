import UIKit

class AdminBeverageStackView: UIStackView {
    
    private let beverageImages = [UIImage(named: "초코에몽"),
                                  UIImage(named: "딸기꿀단지"),
                                  UIImage(named: "코카콜라제로"),
                                  UIImage(named: "스프라이트"),
                                  UIImage(named: "TOP"),
                                  UIImage(named: "콘트라베이스블랙"),]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStackView()
        setUpStackView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configureStackView()
        setUpStackView()
    }
    
    func configureStackView() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        spacing = 4
    }
    
    func setUpStackView() {
        for image in beverageImages {
            let imageView = StockView(frame: CGRect(x: 0, y: 0, width: 150, height: 150), image: image!)
            addArrangedSubview(imageView)
        }
    }
}
    

