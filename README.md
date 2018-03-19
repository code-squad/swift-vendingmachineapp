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


# VendingMachineApp step2

>  MVC 패턴

스토리보드에 다음과 같이 아이패드 앱 화면을 구현한다.<br  />
    각 상품에 대한 재고 추가 버튼을 추가한다.<br  />
    각 상품에 대한 이미지를 추가한다.<br  />
    각 상품에 대한 재고 레이블을 추가한다.<br  />
    1000원, 5000원 금액을 입력하는 버튼을 추가한다.<br  />
    현재 잔액을 표시할 레이블을 추가한다.<br  />
각 상품의 재고 추가 버튼을 누르면 각 상품 재고를 추가하도록 코드를 구현한다.<br  />
재고 추가 버튼을 누르고 나면 전체 레이블을 다시 표시한다.<br  />
금액 입력 버튼을 누르면 해당 금액을 추가하도록 코드를 구현한다.<br  />
금액을 추가하고 나면 잔액 레이블을 다시 표시한다.<br  />

---


- ***실행 화면***
<img src="/img/step1-1.png" width="30%" height="30%"><br  />
<img src="/img/step1-2.png" width="30%" height="30%"><br  />
<img src="/img/step1-3.png" width="30%" height="30%"><br  />
<img src="/img/step1-4.png" width="30%" height="30%"><br  />


- ***학습꺼리***
###  # IBOutlet Collection 기능에 대해 학습하고 중복되는 아웃렛을 제거한다.
: 전체 UILabel을 한꺼번에 다시 표시할 때, UIImageView의 사각형 코너를 둥글게 만들 때 사용해봄<br  />

```swift
@IBOutlet var countOfMenu: [UILabel]!
@IBOutlet var imageOfMenu: [UIImageView]!
func updateCountOfEachBeverage() {
    for (index, menu) in countOfMenu.enumerated() {
        menu.text = String(countOfEachBeverage[index])
    }
}
```

### # UIImageView 에서 이미지를 표시할 때 사각형 코너를 둥글게하도록 변경해본다.
: imageOfMenu[index].frame.width/**Radius** 에서 Radius 값을 낮게 할 수록 더 둥근 테두리의 사각형을 만들 수 있다.<br  />

```swift
for index in 0..<9 {
    imageOfMenu[index].layer.cornerRadius = imageOfMenu[index].frame.width/4
    imageOfMenu[index].clipsToBounds = true
}
```

---


# VendingMachineApp step3

>  앱 생명주기와 객체 저장

앱 시작부터 종료까지 생명주기를 관리하는 방법을 학습한다.<br  />
앱 실행 이후 마지막 자판기 재고 상태와 잔액 등 VendingMachine 객체의 속성을 앱을 종료하더라도 저장하도록 개선한다.<br  />
앱을 다시 실행하면 마지막 재고 상태를 그대로 복원한다.<br  />
객체의 속성을 저장하기 위한 아카이브(Archive) 관련된 내용을 학습한다.<br  />
실행하고 새로운 화면을 캡처해서 readme.md 파일에 포함한다.<br  />

---


- ***실행 화면***
<br  />
<img src="/img/vending_step3.gif" width="80%" height="80%"><br  />


- ***학습꺼리***
###  # 사용자 설정값을 저장하는 UserDefault 클래스에 대해 학습한다. (UserDefault에서 저장할 수 있는 데이터 타입들을 학습한다.)<br  />
: UserDefault에서 저장할 수 있는 데이터 타입은 NSData, NSString, NSNumber, NSDate, NSArray, or NSDictionary가 있다.

---

