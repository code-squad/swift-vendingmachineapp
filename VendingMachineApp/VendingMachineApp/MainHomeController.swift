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
    @IBOutlet weak var ContainerView: UIStackView!
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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        width = MilkStackView.frame.width/3
        height = MilkStackView.frame.height/3 + 200
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
        //MARK: 이미지
        let normalMilkImage: UIImageView = {
            let imageView = UIImageView()
            let image: UIImage = UIImage(named: "normalMilk")!
            imageView.image = image
            return imageView
        }()
        
        let storageLabel = StorageLabel()
        normalMilkStackView = UIStackView(arrangedSubviews: [addButton,
                                                             normalMilkImage,
                                                             storageLabel])
        
        normalMilkStackView.isLayoutMarginsRelativeArrangement = true
        normalMilkStackView.widthAnchor.constraint(equalToConstant: width).isActive = true
        normalMilkStackView.heightAnchor.constraint(equalToConstant: height).isActive = true
        normalMilkStackView.axis = .vertical
    }
    
    func setupStrawberryMilk(){
        //MARK: 추가버튼
        let addButton = AddButton()
        //MARK: 이미지
        let strawberryMilkIImage: UIImageView = {
            let imageView = UIImageView()
            let image: UIImage = UIImage(named: "strawberryMilk")!
            imageView.image = image
            return imageView
        }()
        let storageLabel = StorageLabel()
        strawberryMilkStackView = UIStackView(arrangedSubviews: [addButton,
                                                                 strawberryMilkIImage,
                                                                 storageLabel])
        
        strawberryMilkStackView.isLayoutMarginsRelativeArrangement = true
        strawberryMilkStackView.widthAnchor.constraint(equalToConstant: width).isActive = true
        strawberryMilkStackView.heightAnchor.constraint(equalToConstant: height).isActive = true
        strawberryMilkStackView.axis = .vertical
    }
    
    func setupChocolateMilk(){
        //MARK: 추가버튼
        let addButton = AddButton()
        //MARK: 이미지
        let chocolateMilkImage: UIImageView = {
            let imageView = UIImageView()
            let image: UIImage = UIImage(named: "chocolateMilk")!
            imageView.image = image
            return imageView
        }()
        let storageLabel = StorageLabel()
        chocolateMilkStackView = UIStackView(arrangedSubviews: [addButton,
                                                                chocolateMilkImage,
                                                                storageLabel])
        
        chocolateMilkStackView.isLayoutMarginsRelativeArrangement = true
        chocolateMilkStackView.widthAnchor.constraint(equalToConstant: width).isActive = true
        chocolateMilkStackView.heightAnchor.constraint(equalToConstant: height).isActive = true
        chocolateMilkStackView.axis = .vertical
    }
    
    func setupFanta(){
        //MARK: 추가버튼
        let addButton = AddButton()
        //MARK: 이미지
        let normalMilkImage: UIImageView = {
            let imageView = UIImageView()
            let image: UIImage = UIImage(named: "fanta")!
            imageView.image = image
            return imageView
        }()
        let storageLabel = StorageLabel()
        fantaStackView = UIStackView(arrangedSubviews: [addButton,
                                                        normalMilkImage,
                                                        storageLabel])
        
        fantaStackView.isLayoutMarginsRelativeArrangement = true
        fantaStackView.widthAnchor.constraint(equalToConstant: width).isActive = true
        fantaStackView.heightAnchor.constraint(equalToConstant: height).isActive = true
        fantaStackView.axis = .vertical
    }
    
    func setupCola(){
        //MARK: 추가버튼
        let addButton = AddButton()
        //MARK: 이미지
        let strawberryMilkIImage: UIImageView = {
            let imageView = UIImageView()
            let image: UIImage = UIImage(named: "cola")!
            imageView.image = image
            return imageView
        }()
        let storageLabel = StorageLabel()
        colaStackView = UIStackView(arrangedSubviews: [addButton,
                                                       strawberryMilkIImage,
                                                       storageLabel])
        
        colaStackView.isLayoutMarginsRelativeArrangement = true
        colaStackView.widthAnchor.constraint(equalToConstant: width).isActive = true
        colaStackView.heightAnchor.constraint(equalToConstant: height).isActive = true
        colaStackView.axis = .vertical
    }
    
    func setupSprite(){
        //MARK: 추가버튼
        let addButton = AddButton()
        //MARK: 이미지
        let chocolateMilkImage: UIImageView = {
            let imageView = UIImageView()
            let image: UIImage = UIImage(named: "sprite")!
            imageView.image = image
            return imageView
        }()
        let storageLabel = StorageLabel()
        spriteStackView = UIStackView(arrangedSubviews: [addButton,
                                                         chocolateMilkImage,
                                                         storageLabel])
        
        spriteStackView.isLayoutMarginsRelativeArrangement = true
        spriteStackView.widthAnchor.constraint(equalToConstant: width).isActive = true
        spriteStackView.heightAnchor.constraint(equalToConstant: height).isActive = true
        spriteStackView.axis = .vertical
    }
    
    func setupGeogia(){
        //MARK: 추가버튼
        let addButton = AddButton()
        //MARK: 이미지
        let georgiaImage: UIImageView = {
            let imageView = UIImageView()
            let image: UIImage = UIImage(named: "georgia")!
            imageView.image = image
            return imageView
        }()
        let storageLabel = StorageLabel()
        georgiaStackView = UIStackView(arrangedSubviews: [addButton,
                                                          georgiaImage,
                                                          storageLabel])
        
        georgiaStackView.isLayoutMarginsRelativeArrangement = true
        georgiaStackView.widthAnchor.constraint(equalToConstant: width).isActive = true
        georgiaStackView.heightAnchor.constraint(equalToConstant: height).isActive = true
        georgiaStackView.axis = .vertical
    }
    
    func setupCantata(){
        //MARK: 추가버튼
        let addButton = AddButton()
        //MARK: 이미지
        let cantataImage: UIImageView = {
            let imageView = UIImageView()
            let image: UIImage = UIImage(named: "cantata")!
            imageView.image = image
            return imageView
        }()
        let storageLabel = StorageLabel()
        cantataStackView = UIStackView(arrangedSubviews: [addButton,
                                                          cantataImage,
                                                          storageLabel])
        
        cantataStackView.isLayoutMarginsRelativeArrangement = true
        cantataStackView.widthAnchor.constraint(equalToConstant: width).isActive = true
        cantataStackView.heightAnchor.constraint(equalToConstant: height).isActive = true
        cantataStackView.axis = .vertical
    }
    
    func setupTop(){
        //MARK: 추가버튼
        let addButton = AddButton()
        //MARK: 이미지
        let topImage: UIImageView = {
            let imageView = UIImageView()
            let image: UIImage = UIImage(named: "TOP")!
            imageView.image = image
            return imageView
        }()
        let storageLabel = StorageLabel()
        topStackView = UIStackView(arrangedSubviews: [addButton,
                                                      topImage,
                                                      storageLabel])
        
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
}

