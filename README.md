# Swift-VendingMachine

## Step1

### 프로그래밍 요구사항
- 객체지향 프로그래밍 방식으로  음료를 추상화하는 클래스(class)를 설계한다.
- 음료 상품 클래스 출력을 위해서 CustomStringConvertible 프로토콜을 추가하고 구현한다.

## Step2
### 프로그래밍 요구사항
- 음료수 클래스 계층을 음료수 최상위 객체부터 그룹을 만들어서 3단계 이상 구분한다.
```
예시) 음료 (1단계)    
+---- 우유, 탄산음료, 커피, 에너지드링크 (2단계)
+---- 딸기우유,초코우유 / 콜라,사이다 / TOP,칸타타,조지아 (3단계)
```

- 상속 받은 하위 클래스에도 상위 클래스에 없는 적어도 하나 이상의 속성을 추가한다.
- 추가한 속성에 대한 인터페이스와 함께 추가 인터페이스를 작성한다.
- 음료수 클래스 인터페이스를 테스트하기 위한 테스트 코드를 작성한다.
- 팩토리 패턴을 적용한다.

#### 자판기
- 자판기 구조체를 설계하고, 다음과 같은 동작을 위한 메소드를 작성한다.
    - 자판기 금액을 원하는 금액만큼 올리는 메소드
    - 특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    - 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    - 음료수를 구매하는 메소드
    - 잔액을 확인하는 메소드
    - 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    - 유통기한이 지난 재고만 리턴하는 메소드
    - 따뜻한 음료만 리턴하는 메소드
    - 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    - 각 메소드 동작을 검증할 수 있는 테스트 함수를 작성한다.
    - 전체 코드를 확인할 수 있는 통합 테스트 시나리오를 가지고 동작을 확인한다.

### Class Diagram

<img width="963" alt="Screen Shot 2021-02-27 at 11 14 30 PM" src="https://user-images.githubusercontent.com/60229909/109389838-8f64ec80-7951-11eb-86f4-a07e32a2385b.png">

## Step3

### 프로그래밍 요구사항
- 각 상품에 대한 재고 추가 버튼을 추가한다.
- 각 상품에 대한 이미지를 추가한다.
- 각 상품에 대한 재고 레이블을 추가한다.
- 1000원, 5000원 금액을 입력하는 버튼을 추가한다.
- 현재 잔액을 표시할 레이블을 추가한다.
- 각 상품의 재고 추가 버튼을 누르면 각 상품 재고를 추가하도록 코드를 구현한다.
- 재고 추가 버튼을 누르고 나면 전체 레이블을 다시 표시한다.
- 금액 입력 버튼을 누르면 해당 금액을 추가하도록 코드를 구현한다.
- 금액을 추가하고 나면 잔액 레이블을 다시 표시한다.

### 결과

<img width="1104" alt="Screen Shot 2021-03-08 at 3 43 48 PM" src="https://user-images.githubusercontent.com/60229909/110284382-13d7ff00-8025-11eb-8d6b-76ad7aa08761.png">

## 고찰

### 🔑 Beverage.Type을 Dictionary의 Key값으로 사용하기

Beverage.Type을 Dictionary의 Key값으로 사용하고자 한다. Beverage.Type은 Hashable하지 않기 때문에 Key로 사용할 수 없다. 메타 타입 자체는 hashable하지 않으므로 key로 사용할 수 없다. 두 가지 접근 방법을 생각하였다.

1. **메타 타입을 확장하여 hashable하게 정의 해보자.** → 메타 타입은 확장하여 사용할 수 없다.
2. **Dictionary를 확장하여 Type을 key값으로 가질 수 있도록 구현한다.** → 구현하기가 어렵다.

ObjectIdentifier(Type) 를 사용하면 Key값으로 사용 할 수 있으나, 이는 ObjectIdentifier가 Key값이 된다. 현재로써는 가장 최선의 방법이다.

### 🌅 이미지 저장

사용자가 이용하는 화면에서 음료의 이미지를 보여주어야 한다. 이는 각 타입마다 고유의 이미지를 가지고 있어야 함을 의미한다. 그렇다면 이 이미지는 어디에 저장되어야 할까?

1. 클래스에 상수로 image를 가지고 있도록 한다 → 인스턴스를 생성할 때마다 클래스가 이미지를 가지고 있어야하는데, 이는 음료가 많아질 수록 굉장한 메모리 낭비를 초래할 수 있다.
2. View와 관련된 클래스에서 직접 이미지를 넣는다.
    ```swift
    private let images : [UIImage?] = [UIImage(named: "top"),UIImage(named: "georgia"),UIImage(named: "cantata"), .... ]
    ```
 다소 하드코딩의 느낌이 나지만, 현 단계에서는 2번의 방법을 택했다. 모든 인스턴스들이 가지고 있는것 보다는 나아 보였기 때문이다.

### 다형성 이용하기
- 음료 인스턴스를 생성하기 위해 음료의 타입을 매개변수로 넘겨준다. 각 음료의 타입을 체크하지 않고 다형성을 이용해서 바로 생성 하고자 했다.
    - Before
    ```swift
    static func createBeverage<T>(type value: T) -> Beverage? {
        switch value {
        case is ChocolateMilk.Type : return ChocolateMilk(createdAt: Date().toString(), expiredAt: Date(.toString())
        case is StroberryMilk.Type : return StroberryMilk(createdAt: Date().toString(), expiredAt: Date().toString())
        case is BananaMilk.Type : return BananaMilk(createdAt: Date().toString(), expiredAt: Date().toString())
        default:
            return nil
        }
    }
    ```
    - After 
    ```swift
    static func createInstance(type value : Beverage.Type) -> Beverage? {
        return value.init()
    }
    ```

# Step4

## 요구사항
- 앱을 다시 실행하면 마지막 재고 상태를 그대로 복원한다.

## 프로그래밍 요구사항
- VendingMachine 변수를 ViewController에서 포함하지 않고 AppDelegate로 옮긴다.
- 앱 종료(background) 시점 콜백 함수에서 VendingMachine 객체 인스턴스 속성을 저장한다.
- 저장할 때는 VendingMachine을 아카이브해서 하나의 데이터 값으로 변형한다.
- 값을 저장하고 복원하는 데에는 UserDefault 라는 파운데이션 라이브러리를 사용한다.
- 앱 시작(activate) 시점 콜백 함수에서 기존에 저장된 값에서 불러와서 VendingMachine 객체 인스턴스를 생성한다.
- 복원할 때는 저장된 데이터 값을 언아카이브해서 VendingMachine 객체를 생성한다.


## 결과
<img width="1104" alt="Screen Shot 2021-03-12 at 3 11 16 PM" src="https://user-images.githubusercontent.com/60229909/110899875-33349c00-8345-11eb-8018-4f351a8f6352.png">

## 고찰

### MVC의 역할 분담
- view에서 view를 변경하는 것이 아닌 controller에게 넘겨준 후 변경해야한다. view에서 view를 변경하는 코드를 모두 제거하였다.
- 버튼의 역할은 버튼이 눌려졌다는 것만 알려주면 된다. button의 action을 수행할때 매개 변수를 넘겨주지 않도록 했다. 오롯이 sender를 이용하기 위해서, UIButton을 상속받는 custom 버튼을 생성하여 해결하였다.

### 커스텀 뷰 안에있는 버튼에 action 지정하기
- 버튼은 모두 같은 인터페이스를 갖지만, 각기 다른 행동을 해야한다. 버튼을 누를 때 마다 추가되는 음료수가 달라야 하는 것이다. 기존에는 button에 delegation을 이용하여 viewController에서 동작을 구현했다. 그런데, Button은 target-action을 정할 수 있으므로 delegation을 이용하지 않고, target으로 상위 viewcontroller를 지정하도록 변경하였다. 

    - Before
        ```swift
        @objc func appendBeverageToMachine(_ sender : UIButton!){
            delegate?.appendBeverage(sender)
        ```
    - After
        ```swift
        button.addTarget(superview, action: #selector(ViewController.appendBeverageToMachine), for: .touchDown)
        ```

### View에서 가지고 있는 값과 실제 vendingMachine이 가지고 있는 값이 다른 경우에 대한 우려
- view는 음료의 재고 값을 변수로 가지고 있다. vendingmachine이 가지고 있는 재고량은 증가하였지만, view가 가지고 있는 재고량는 증가 하지 않는 경우를 고려하게 되었다. 
- 이러한 오류를 방지하기 위해, view는 model에 대한 값을 직접 가지고 있을 필요가 없다고 판단하여 model에 관련된 값을 직접 가지고 있지 않도록 하였다. 
- 재고량은 반드시 vendingmachine이 가지고 있는 값을 이용하여 보여주게 된다. vendingmachine의 재고량이 변할 때, NotificationCenter에 변경사항에 대한 알림을 주도록 하였고 알림을 받은 경우 재고를 나타내는 label을 업데이트 한다.

### NSCoding VS Codable
인코딩/디코딩을 위한 프로토콜로 NSCoding과 Codable은 유사하다. 하지만 Codable은 상송을 이용한 객체의 다형성을 적용 할 수 없다. 이 프로젝트의 경우 Beverage > Coffee > Top 와같이 다중 상속을 가지고 있으므로 Codable보다는 NSCoding이 적합하였다. 때문에 String 키값의 오타의 위험성에도 불구하고 NSCoding을 이용였다.

### NSCoding의 Key값은 프로젝트 전체에서 유일해야한다.
Coffee도 Enum 타입의 kind 가지고, Monster도  Enum 타입의 kind를 가진다. 동일하게 key값을 "kind"로 주었더니 문제가 발생했다. 이 후 키값을 "Coffeekind", "Monsterkind"로 변경하였다.

# Step5

## 프로그래밍 요구사항
- ViewController는 viewDidLoad에서 Observe를 등록한다.
- 음식 재고가 바뀌는 Notification을 받으면 화면에 Label을 업데이트한다.
- VendingMachine 모델 객체에서는 변화에 대해 NotificationCenter에 post한다.
- 모든 동작은 이전 단계와 동일하게 동작해야 한다.

[코드리뷰 과정](https://github.com/code-squad/swift-vendingmachineapp/pull/306)

# Step6

## 프로그래밍 요구사항

- 실행이후 구매 목록을 화면 아래 이미지로 추가한다.
- 화면 아래 부분을 좌우로 스크롤 가능하도록 만들고 상품 이미지를 추가한다. 계속 추가해도 스크롤할 수 있어야 한다.
- 특정 제품을 구매할 때마다 해당 제품 이미지를 추가하도록 구현한다.
- NotificationCenter를 활용하자!
- 특정 시점에 self.scrollView.addSubView() 메서드로 UIImageView를 수동 추가한다.
- 모든 동작은 이전 단계와 동일하게 동작해야 한다.

## 결과

<img width="1104" alt="Screen Shot 2021-03-16 at 9 09 47 PM" src="https://user-images.githubusercontent.com/60229909/111306744-f1d12300-869b-11eb-970d-b79a25c7bdf7.png">

## 고찰
### [Beverage.type : String] 자료를 만들어 UIImage 매칭
`getImage` 메소드 에서는 파라미터로 넘어온 `Beverage.Type`를 받아 UIImage를 반환하고자 하였다.

```swift
static func getImage(with currentType : Beverage.Type) -> UIImage {

    print(ObjectIdentifier(type(of: currentType)))

    guard let name = imageDict[ObjectIdentifier(currentType.self)] else {          
        return UIImage()
    }
    return UIImage(named: name) ?? UIImage()
}
```

 하지만, `static`으로 만들어 놓은 `ObjectIdentifier(Top.Type)`의 값과 앱 실행 도중 넘겨받은 Type의 `ObjectIdentifier(Top.Type)`의 값이 달라 이와 같은 로직을 적용할 수 없었다. 

<img width="1106" alt="Screen Shot 2021-03-18 at 4 43 57 PM" src="https://user-images.githubusercontent.com/60229909/111590177-23b3c800-8809-11eb-8691-4417292aa47b.png">


디버깅을 위해서 getImage 함수 내에서 ObjectIdentifier를 Print문으로 확인해 보니 다음과 같이 확인 할 수 있었다.

```
// image dictionary안에 들어있는 key값과 value 값
key: ObjectIdentifier(0x00007fff873f8f10), value : coke
key: ObjectIdentifier(0x00007fff873f8e48), value : top
key: ObjectIdentifier(0x00007fff873f8f60), value : stroberry
key: ObjectIdentifier(0x00007fff873f8e70), value : georgia
key: ObjectIdentifier(0x00007fff873f8f38), value : banana
key: ObjectIdentifier(0x00007fff873f8f88), value : chocolate
key: ObjectIdentifier(0x00007fff873f8ec0), value : sprite
key: ObjectIdentifier(0x00007fff873f8e98), value : cantata
```
```
ObjectIdentifier(0x00007fff873f8978)
```

`getImage()`에서 매개 변수로 넘기는 값의 자료형은 `Beverage.Type`이다. 이 위치의 `Top.self` 넣고 테스트 함수를 돌렸다. (`Top.Type.self`를 넣어야 할 것 같았지만, 이는 Top.Type.Type' 을 넣는 것이므로 `Top.self`를 넣는다.)

`imageDict`의 키값을 찾기 위해서 필요한 값은 `Top.Type`이다. 그런데 현재 매개 변수로 넘어온 값은 Top.Type 이 아닌 Top이다. Top의 타입을 추출하기 위해 type(of: Top.self)를 하는 경우 나의 예상과 달리 `Top.Type`가 아닌 `Beverage.Type`을 리턴한다.
```
print(currentType) // Top
print(type(of: currentType.self))   // Beverage.Type     
print(type(of: Top.self))    // Top.Type
```
때문에 모든 파라미터에 대하여 `Beverage.Type`에 대한 ObjectIdentifier를 반환하므로 원하는 이미지를 추출하지 못했던 것이다.

이와 같은 문제가 발생하였지만, 아직 해결하지 못했다.

### ScrollView의 isScrollEnabled
ScrollVeiw의 스크롤이 가능하게 하기 위해서는 다음의 옵션 설정이 필요 한 것 같다.
```swift
scrollVeiw.isScrollEnabled = true
```

### ScrollView의 contentSize, 과도하게 스크롤 되는 현상 방지
contentSize는 기본적으로 `CGSizeZero`의 값을 가지고 있다. 때문에, 아무리 ScrollView의 sub뷰를 추가하여도 스크롤이 생성되지 않는다. 세로로 스크롤 될 필요는 없으므로, `self.bounds.height`값으로 높이를 지정하였고, 넓이는 구매 이미지가 추가될 때 마다 ContentSize값을 변경하도록 하였다. 동시에 과도하게 스크롤 되는 현상을 해결 할 수 있었다.

[코드리뷰 과정](https://github.com/code-squad/swift-vendingmachineapp/pull/321)
# Step7

## 프로그래밍 요구사항
- 스토리보드에서 Button을 추가하고, Attributes에서 Type을 Info Light로 설정한다.
- 새로운 ViewController를 옆에 추가하고, Button에서 Segue를 연결한다.
- Segue를 선택하고 Kind를 Present Modally로 지정하고, Transition을 Flip Horizontal로 설정한다.
- 자판기에 음료수를 관리하는 관리자 기능(AdminMode)과 음료를 구매하는 사용자 기능(UserMode)을 담당하는 객체를 분리한다.
- 새롭게 추가한 화면을 관리자 모드로 동작하도록 개선한다.
- 이미지와 재고 추가 버튼을 복사해서 관리자 화면으로 복사하고, 동작하도록 코드를 수정한다.
- 재고 추가 버튼은 기존 화면에서 삭제한다.
- 관리자 화면에 [닫기] 버튼을 추가하고, 버튼을 누르면 dissmiss()를 호출한다.
- 다른 동작은 이전 단계와 동일하게 동작해야 한다.

## 결과
**사용자 화면**
<img width="1104" alt="Screen Shot 2021-03-18 at 3 52 49 PM" src="https://user-images.githubusercontent.com/60229909/111584991-fe6f8b80-8801-11eb-90da-a932babd2c31.png">
**관리자 화면**
<img width="1104" alt="Screen Shot 2021-03-18 at 3 52 27 PM" src="https://user-images.githubusercontent.com/60229909/111584959-f1529c80-8801-11eb-9e5f-d790fb04ef9e.png">

## 고찰

### 기존에 만들어 놓은 View 재활용하기
기존에 만들어 놓은 재고를 보여주는 화면을 최대한 재사용하기 위해 노력했다. "구매하기 버튼" 혹은 "추가하기 버튼"의 `isHidden`의 플래그를 활용하였다. 사용자의 화면에서는 재고 추가하기 버튼을 숨기고, 관리자 화면에서는 구매하기 버튼을 숨김으로써, 같은 재고뷰를 재사용 하였다. 또한, 기존에 한 줄에 몇개의 음료수를 보여줄 것인지에 대한 기준 값을 변경할 수 있도록 `let`이 아닌 `var`로 변경하였다.