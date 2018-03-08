# VendingMachineApp step1

>  시작하기 - 아이패드 앱

레벨2 VendingMachine 미션의 Main, InputView, OutputView를 제외하고 전체 클래스를 프로젝트로 복사한다.<br  />
기존 코드들은 MVC 중에서 대부분 Model의 역할을 담당한다.<br  />
iOS 앱 구조는 MVC 중에서도 우선 ViewController-Model 사이 관계에 집중하고, ViewController-View 관계는 다음 단계에서 개선한다.<br  />

---

- ***코드 작성***
```swift
var vendingMachine = VendingMachine()

override func viewDidLoad() {
    super.viewDidLoad()
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyyMMdd"

    let strawberryMilk: Beverage = StrawberryMilk(brand: "서울우유", weight: 200, price: 1000, name: "딸기우유", manufactureDate: formatter.date(from: "20171009") ?? Date(),
    strawberrySyrup: 5)
    let bananaMilk: Beverage = BananaMilk(brand: "서울우유", weight: 200, price: 1000, name: "바나나우유", manufactureDate: formatter.date(from: "20171012") ?? Date(), bananaSyrup: 3)
    let coke: Beverage = Coke(brand: "팹시", weight: 350, price: 2000, name: "팹시콜라", manufactureDate: formatter.date(from: "20171005") ?? Date(), calorie: 25)

    vendingMachine.addInInventory(beverageName: strawberryMilk, number: 2)
    vendingMachine.addInInventory(beverageName: bananaMilk, number: 1)
    vendingMachine.addInInventory(beverageName: coke, number: 3)

    for menu in vendingMachine.showEntireInventory() {
        let beverage = menu.value
        guard let beverageName = beverage.first?.name else {
            return
        }
        print("\(beverageName)(\(beverage.count)개)", terminator: " ")
    }
}
```

- ***콘솔 화면***
<img src="/img/consolePrint.png" width="80%" height="50%">


- ***학습꺼리***
###  # iOS 앱을 구성하는 핵심 객체들과 iOS 메인 런루프 동작 이해하기 위해서 애플 앱 프로그래밍 가이드 문서를 학습한다.

### # macOS 프로젝트 템플릿과 iOS 프로젝트 템플릿 구조의 차이점을 학습한다.
- iOS 프로젝트에는 main.swift 가 생략되어 있다.
- UIApplicationMain() 함수의 역할에 대해 찾아보고 학습한다.

---


