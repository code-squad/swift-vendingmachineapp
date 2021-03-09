

import UIKit

class ViewController: UIViewController {

    @IBOutlet var beverageImages: [UIImageView]!
    @IBOutlet var addBeverageStockButton: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpBeverageImages()
    }

    func setUpBeverageImages() {
        beverageImages.forEach { imageView in
            imageView.contentMode = .scaleToFill
            imageView.layer.borderWidth = 2
            imageView.layer.borderColor = UIColor.lightGray.cgColor
            imageView.layer.cornerRadius = 10
        }
    }    
}


