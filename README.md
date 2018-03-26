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
<br  />
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
<br  />
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

<br  />
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

### # 애플 Archive와 Serialization 개발자 문서를 학습한다.

### # 스위프트 4 Encoding, Decoding 개발자 문서를 학습한다.


---


# VendingMachineApp step4

>  싱글톤 모델

VendingMachine 객체를 싱글톤(Singleton)으로 접근할 수 있도록 개선한다.<br />
VendingMachine 싱글톤으로 sharedInstance 인터페이스를 통해서 AppDelegate와 ViewController에서 접근하도록 코드를 수정한다.<br />
모든 동작은 이전 단계와 동일하게 동작해야 한다.<br />

---

- ***학습꺼리***

###  # 구조체 Struct를 싱글톤으로 생성하는 방식을 찾아서 학습한다.
: 구조체 싱글톤의 경우 클래스와 동일하게 static 인스턴스를 이용하여 생성할 수 있다.

### # 클래스 경우 싱글톤을 생성하는 방법과 어떻게 다른지 학습한다.
: 클래스의 경우 싱글톤으로 만들고자 하는 클래스 안에 static 변수로 클래스 인스턴스를 생성한다. 그리고 클래스의 init()을 private로 하고 따로 인터페이스를 구현하여 생성한 인스턴스를 return 하도록 한다.
<br  /><br  />
구조체와 클래스의 싱글톤의 큰 차이점은 없으나 쓰레드 사용시 구조체는 crash가 날 상황도 생길 수 있기도 하고, 보다 세밀한 제어가 어렵기 때문에 클래스로 구현하는 것이 더 낫다.

### # 싱글톤 객체의 장점과 단점에 대해 학습한다.
: 장점 - 메모리 낭비를 줄일 수 있다.
<br  />
단점 - 클래스들 간의 결합도가 높아져서 객체지향 설계 원칙인 개방-폐쇄 원칙에 위배된다.

---


# VendingMachineApp step5

> 관찰자(Observer) 패턴

ViewController는 viewDidLoad에서 Observe를 등록한다.<br  />
음식 재고가 바뀌는 Notification을 받으면 화면에 Label을 업데이트한다.<br  />
추가 버튼을 누르면 해당 음식 재고를 모델에 추가할 때마다
VendingMachine 모델 객체에서는 변화에 대해 NotificationCenter에 post한다.<br  />
모든 동작은 이전 단계와 동일하게 동작해야 한다.<br  />

---

- ***학습꺼리***

### # 다양한 Observer 등록 패턴을 학습한다.
: Observer 등록은 다음과 같다.


```swift
NotificationCenter.default.addObserver(self,
			selector: #selector(changeInventoryBox),
			name: Notification.Name.DidResetInventoryBox,
			object: nil)
```

옵저버는 프로토콜, 클래스 등에서 생성하여 등록할 수 있다.

```swift 
protocol Observable {
    func addObserver(_ observer: Observer)
    func removeObserver(_ observer: Observer)
}
protocol Observer: class {
    func update(_ temp: Float, density: Float)
}
```

```swift
class Observation: Observable {
    var observers = [Observer]()
    func addObserver(_ observer: Observer) {
        observers.append(observer)
    }
    func removeObserver(_ observer: Observer) {
        observers = observers.filter({ $0 !== observer })
    }
}
```

출처: https://magicmon.github.io/2017/07/04/Observer-Pattern/

### # 모델과 컨트롤러가 직접 참조하지 않고 느슨하게 연결된 (loosed coupled) 구조가 왜 좋은지 토론한다.
: 모델과 컨트롤러 간의 의존성이 낮아져서 확장성이 좋아지기 때문이다.

---


# VendingMachineApp step6

> 구매목록 View 코드

실행이후 구매 목록을 화면 아래 이미지로 추가한다.<br  />
구매 목록도 앱 종료이후에 저장되도록 개선한다.<br  />
특정 제품을 구매할 때마다 해당 제품 이미지를 추가하도록 구현한다.<br  />
(NotificationCenter를 활용하자!)<br  />
특정 시점에 self.view.addSubView() 메서드로 UIImageView를 수동 추가<br  />

---

- ***학습꺼리***

### # 뷰를 코드로 생성해서 추가하는 것과 스토리보드 상에서 미리 생성하는 것의 차이에 대해 학습한다.

: 뷰를 코드로 생성해서 추가하는 것은 동적으로 필요할 때 뷰를 만들 수 있다는 장점이 있고, 스토리보드 상에서 미리 생성하여 정적으로 안정적인 뷰를 만들 수 있다.  

- ***실행 화면***

<img src="/img/vending_step6.gif" width="80%" height="80%">

---


# VendingMachineApp step7

> Frame과 Bounds

스토리보드에서 Button을 추가하고, Attributes에서 Type을 Info Light로 설정한다.  
새로운 ViewController를 옆에 추가하고, Button에서 Segue를 연결한다.  
Segue를 선택하고 Kind를 Present Modally로 지정하고, Transition을 Flip Horizontal로 설정한다.  
새롭게 추가한 화면을 관리자 모드로 동작하도록 개선한다.  
이미지와 재고 추가 버튼을 복사해서 관리자 화면으로 복사하고, 동작하도록 코드를 수정한다.  
재고 추가 버튼은 기존 화면에서 삭제한다.  
관리자 화면에 [닫기] 버튼을 추가하고, 버튼을 누르면 dissmiss()를 호출한다.  
다른 동작은 이전 단계와 동일하게 동작해야 한다.  
---
 
- ***실행 화면***

<img src="/img/vending_step6.gif" width="80%" height="80%">

---

