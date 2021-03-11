//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/22.
//

import UIKit

class MainHomeController: UIViewController {
    
    //MARK: 컨테이너스택뷰
    @IBOutlet weak var ContainerStackView: UIStackView!
    @IBOutlet weak var ContainerView: InspectorStackView!
    //MARK: 우유 스택뷰 컨테이너
    @IBOutlet weak var MilkStackView: UIStackView!
    var normalMilkStackView: UIStackView!
    var strawberryMilkStackView: UIStackView!
    var chocolateMilkStackView: UIStackView!
    
    //MARK: 탄산음료 스택뷰 컨테이너
    @IBOutlet weak var SodaStackView: UIStackView!
    var fantaStackView: UIStackView!
    var colaStackView: UIStackView!
    var spriteStackView: UIStackView!
    
    //MARK: 커피 스택뷰 컨테이너
    @IBOutlet weak var CoffeeStackView: UIStackView!
    var georgiaStackView: UIStackView!
    var cantataStackView: UIStackView!
    var topStackView: UIStackView!
    
    var width: CGFloat = 0.0
    var height:CGFloat = 0.0
    let drinkFactory = DrinkFactory()
    
    let normalMilkLabel = StorageLabel()
    let strawberryMilkLabel = StorageLabel()
    let chocolateMilkLabel = StorageLabel()
    let colaLabel = StorageLabel()
    let fantaLabel = StorageLabel()
    let spriteLabel = StorageLabel()
    let geogiaLabel = StorageLabel()
    let cantataLabel = StorageLabel()
    let topLabel = StorageLabel()
    
    var normalMilkCount: Int = 0
    var strawberryMilCount: Int = 0
    var chocolateMilCount: Int = 0
    var fantaCount: Int = 0
    var colaCount: Int = 0
    var spriteCount: Int = 0
    var geogiaCount: Int = 0
    var cantataCount:Int = 0
    var topCount:Int = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ContainerStackView.translatesAutoresizingMaskIntoConstraints = false
        ContainerStackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        width = MilkStackView.frame.width/3
        height = MilkStackView.frame.height/3 + 230
        setupNormalMilk()
        setupStrawberryMilk()
        setupChocolateMilk()
        setupMilkStackView()
        
        setupFanta()
        setupCola()
        setupSprite()
        setupSodaStackView()

        setupGeogia()
        setupCantata()
        setupTop()
        setupCoffeeStackView()
    }
    
    func setupNormalMilk(){
        //MARK: 추가버튼
        let addButton = AddButton()
        addButton.drinkType = drinkFactory.normalMilk
        addButton.addTarget(self, action: #selector(addButtonAction), for: .touchDown)
        //MARK: 이미지
        let normalMilkImage: UIImageView = {
            let imageView = UIImageView()
            let image: UIImage = UIImage(named: "normalMilk")!
            imageView.image = image
            return imageView
        }()
        normalMilkStackView = UIStackView(arrangedSubviews: [addButton,
                                                             normalMilkImage,
                                                             normalMilkLabel])
        
        normalMilkStackView.isLayoutMarginsRelativeArrangement = true
        normalMilkStackView.widthAnchor.constraint(equalToConstant: width).isActive = true
        normalMilkStackView.heightAnchor.constraint(equalToConstant: height).isActive = true
        normalMilkStackView.axis = .vertical
    }
    
    func setupStrawberryMilk(){
        //MARK: 추가버튼
        let addButton = AddButton()
        addButton.drinkType = drinkFactory.strawberryMilk
        addButton.addTarget(self, action: #selector(addStrawberryButtonAction), for: .touchDown)
        
        //MARK: 이미지
        let strawberryMilkIImage: UIImageView = {
            let imageView = UIImageView()
            let image: UIImage = UIImage(named: "strawberryMilk")!
            imageView.image = image
            return imageView
        }()
        addButton.drinkType = drinkFactory.normalMilk
        strawberryMilkStackView = UIStackView(arrangedSubviews: [addButton,
                                                                 strawberryMilkIImage,
                                                                 strawberryMilkLabel])
        strawberryMilkStackView.isLayoutMarginsRelativeArrangement = true
        strawberryMilkStackView.widthAnchor.constraint(equalToConstant: width).isActive = true
        strawberryMilkStackView.heightAnchor.constraint(equalToConstant: height).isActive = true
        strawberryMilkStackView.axis = .vertical
    }
    
    func setupChocolateMilk(){
        //MARK: 추가버튼
        let addButton = AddButton()
        addButton.drinkType = drinkFactory.chocolateMilk
        addButton.addTarget(self, action: #selector(addchocolateButtonAction), for: .touchDown)
        //MARK: 이미지
        let chocolateMilkImage: UIImageView = {
            let imageView = UIImageView()
            let image: UIImage = UIImage(named: "chocolateMilk")!
            imageView.image = image
            return imageView
        }()
        chocolateMilkStackView = UIStackView(arrangedSubviews: [addButton,
                                                                chocolateMilkImage,
                                                                chocolateMilkLabel])
        
        chocolateMilkStackView.isLayoutMarginsRelativeArrangement = true
        chocolateMilkStackView.widthAnchor.constraint(equalToConstant: width).isActive = true
        chocolateMilkStackView.heightAnchor.constraint(equalToConstant: height).isActive = true
        chocolateMilkStackView.axis = .vertical
    }
    
    func setupFanta(){
        //MARK: 추가버튼
        let addButton = AddButton()
        addButton.drinkType = drinkFactory.fantaSoda
        addButton.addTarget(self, action: #selector(addFantaButtonAction), for: .touchDown)
        //MARK: 이미지
        let normalMilkImage: UIImageView = {
            let imageView = UIImageView()
            let image: UIImage = UIImage(named: "fanta")!
            imageView.image = image
            return imageView
        }()
        fantaStackView = UIStackView(arrangedSubviews: [addButton,
                                                        normalMilkImage,
                                                        fantaLabel])
        
        fantaStackView.isLayoutMarginsRelativeArrangement = true
        fantaStackView.widthAnchor.constraint(equalToConstant: width).isActive = true
        fantaStackView.heightAnchor.constraint(equalToConstant: height).isActive = true
        fantaStackView.axis = .vertical
    }
    
    func setupCola(){
        //MARK: 추가버튼
        let addButton = AddButton()
        addButton.drinkType = drinkFactory.colaSoda
        addButton.addTarget(self, action: #selector(addColaButtonAction), for: .touchDown)
        //MARK: 이미지
        let strawberryMilkIImage: UIImageView = {
            let imageView = UIImageView()
            let image: UIImage = UIImage(named: "cola")!
            imageView.image = image
            return imageView
        }()
        colaStackView = UIStackView(arrangedSubviews: [addButton,
                                                       strawberryMilkIImage,
                                                       colaLabel])
        
        colaStackView.isLayoutMarginsRelativeArrangement = true
        colaStackView.widthAnchor.constraint(equalToConstant: width).isActive = true
        colaStackView.heightAnchor.constraint(equalToConstant: height).isActive = true
        colaStackView.axis = .vertical
    }
    
    func setupSprite(){
        //MARK: 추가버튼
        let addButton = AddButton()
        addButton.drinkType = drinkFactory.spriteSoda
        addButton.addTarget(self, action: #selector(addSpriteButtonAction), for: .touchDown)
        //MARK: 이미지
        let chocolateMilkImage: UIImageView = {
            let imageView = UIImageView()
            let image: UIImage = UIImage(named: "sprite")!
            imageView.image = image
            return imageView
        }()
        spriteStackView = UIStackView(arrangedSubviews: [addButton,
                                                         chocolateMilkImage,
                                                         spriteLabel])
        
        spriteStackView.isLayoutMarginsRelativeArrangement = true
        spriteStackView.widthAnchor.constraint(equalToConstant: width).isActive = true
        spriteStackView.heightAnchor.constraint(equalToConstant: height).isActive = true
        spriteStackView.axis = .vertical
    }
    
    func setupGeogia(){
        //MARK: 추가버튼
        let addButton = AddButton()
        addButton.drinkType = drinkFactory.geogiaCoffee
        addButton.addTarget(self, action: #selector(addGeogiaButtonAction(_:)), for: .touchDown)
        //MARK: 이미지
        let georgiaImage: UIImageView = {
            let imageView = UIImageView()
            let image: UIImage = UIImage(named: "georgia")!
            imageView.image = image
            return imageView
        }()
        georgiaStackView = UIStackView(arrangedSubviews: [addButton,
                                                          georgiaImage,
                                                          geogiaLabel])
        
        georgiaStackView.isLayoutMarginsRelativeArrangement = true
        georgiaStackView.widthAnchor.constraint(equalToConstant: width).isActive = true
        georgiaStackView.heightAnchor.constraint(equalToConstant: height).isActive = true
        georgiaStackView.axis = .vertical
    }
    
    func setupCantata(){
        //MARK: 추가버튼
        let addButton = AddButton()
        addButton.drinkType = drinkFactory.cantataCoffee
        addButton.addTarget(self, action: #selector(addCantataButtonAction(_:)), for: .touchDown)
        //MARK: 이미지
        let cantataImage: UIImageView = {
            let imageView = UIImageView()
            let image: UIImage = UIImage(named: "cantata")!
            imageView.image = image
            return imageView
        }()
        cantataStackView = UIStackView(arrangedSubviews: [addButton,
                                                          cantataImage,
                                                          cantataLabel])
        
        cantataStackView.isLayoutMarginsRelativeArrangement = true
        cantataStackView.widthAnchor.constraint(equalToConstant: width).isActive = true
        cantataStackView.heightAnchor.constraint(equalToConstant: height).isActive = true
        cantataStackView.axis = .vertical
    }
    
    func setupTop(){
        //MARK: 추가버튼
        let addButton = AddButton()
        addButton.drinkType = drinkFactory.topCoffee
        addButton.addTarget(self, action: #selector(addtopCoffeeButtonAction(_:)), for: .touchDown)
        //MARK: 이미지
        let topImage: UIImageView = {
            let imageView = UIImageView()
            let image: UIImage = UIImage(named: "TOP")!
            imageView.image = image
            return imageView
        }()
        topStackView = UIStackView(arrangedSubviews: [addButton,
                                                      topImage,
                                                      topLabel])
        
        topStackView.isLayoutMarginsRelativeArrangement = true
        topStackView.widthAnchor.constraint(equalToConstant: width).isActive = true
        topStackView.heightAnchor.constraint(equalToConstant: height).isActive = true
        topStackView.axis = .vertical
    }
    
    func setupMilkStackView(){
        MilkStackView.addArrangedSubview(normalMilkStackView)
        MilkStackView.addArrangedSubview(strawberryMilkStackView)
        MilkStackView.addArrangedSubview(chocolateMilkStackView)
        MilkStackView.axis = .horizontal
        MilkStackView.topAnchor.constraint(equalTo: ContainerStackView.topAnchor).isActive = true
        
        MilkStackView.spacing = 10
        MilkStackView.distribution = .fillEqually
        view.addSubview(MilkStackView)
    }
    
    func setupSodaStackView(){
        SodaStackView.addArrangedSubview(fantaStackView)
        SodaStackView.addArrangedSubview(colaStackView)
        SodaStackView.addArrangedSubview(spriteStackView)
        SodaStackView.axis = .horizontal
        SodaStackView.spacing = 10
        SodaStackView.topAnchor.constraint(equalTo: MilkStackView.bottomAnchor, constant: 10).isActive = true
        SodaStackView.distribution = .fillEqually
        view.addSubview(SodaStackView)
    }
    
    func setupCoffeeStackView(){
        CoffeeStackView.addArrangedSubview(georgiaStackView)
        CoffeeStackView.addArrangedSubview(cantataStackView)
        CoffeeStackView.addArrangedSubview(topStackView)
        CoffeeStackView.axis = .horizontal
        CoffeeStackView.spacing = 10
        CoffeeStackView.topAnchor.constraint(equalTo: SodaStackView.bottomAnchor, constant: 10).isActive = true
        CoffeeStackView.distribution = .fillEqually
        view.addSubview(CoffeeStackView)
    }
    
    @objc func addButtonAction(_ sender: AddButton){
        if sender.drinkType != nil {
            normalMilkCount += 1
            normalMilkLabel.text = "\(normalMilkCount)개"
        }
    }
    
    @objc func addStrawberryButtonAction(_ sender: AddButton)  {
        if sender.drinkType != nil {
            strawberryMilCount += 1
            strawberryMilkLabel.text = "\(strawberryMilCount)개"
        }
    }
    
    @objc func addchocolateButtonAction(_ sender: AddButton)  {
        if sender.drinkType != nil {
            chocolateMilCount += 1
            chocolateMilkLabel.text = "\(chocolateMilCount)개"
        }
    }
    
    @objc func addFantaButtonAction(_ sender: AddButton)  {
        if sender.drinkType != nil {
            fantaCount += 1
            fantaLabel.text = "\(fantaCount)개"
        }
    }
    
    @objc func addColaButtonAction(_ sender: AddButton)  {
        if sender.drinkType != nil {
            colaCount += 1
            colaLabel.text = "\(colaCount)개"
        }
    }

    @objc func addSpriteButtonAction(_ sender: AddButton)  {
        if sender.drinkType != nil {
            spriteCount += 1
            spriteLabel.text = "\(spriteCount)개"
        }
    }
    
    @objc func addGeogiaButtonAction(_ sender: AddButton)  {
        if sender.drinkType != nil {
            geogiaCount += 1
            geogiaLabel.text = "\(geogiaCount)개"
        }
    }
    
    @objc func addCantataButtonAction(_ sender: AddButton)  {
        if sender.drinkType != nil {
            cantataCount += 1
            cantataLabel.text = "\(cantataCount)개"
        }
    }
    
    @objc func addtopCoffeeButtonAction(_ sender: AddButton)  {
        if sender.drinkType != nil {
            topCount += 1
            topLabel.text = "\(topCount)개"
        }
    }
}


