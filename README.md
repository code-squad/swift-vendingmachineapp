# 자판기 앱 만들기

## Step.1

#### Beverage Class 생성
```swift
import Foundation

class Beverage {
    
    private var brand: Brand
    private var volume: Int
    private var price: Int
    private var productName: String
    private var manufactureDate: Date
    
    init(brand:Brand, volume: Int, price: Int, productName: String, manufactureDate: Date) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.productName = productName
        self.manufactureDate = manufactureDate
    }
}
```
- 프로퍼티 선언 및 초기화 작업 완료
- 브랜드는 별도로 구조체로 생성 예정

#### Brand 구조체 생성
```swift
import Foundation

struct Brand {
    
    enum Milk: String {
        case seoul = "서울우유"
        case bing = "빙그레"
        case namyang = "남양유업"
    }
    
    enum SoftDrik: String {
        case coca = "코카콜라"
        case pepsi = "펩시"
        case lotte = "롯데칠성음료"
    }
    
    enum Coffee: String {
        case maxim = "맥심"
        case lotte = "롯데칠성음료"
        case coca = "코카롤라"
    }
}
```
- 브랜드는 구조체로 따로 분리하여 생성하였으나, 기타 Beverage 프로퍼티들에 대해서는 고민 중
- 브랜드는 우유, 탄산음료, 커피 등에 따라 나눠서 enum으로 타입생성

#### CustomStringConvertible 프로토콜 채택
```swift
extension Beverage: CustomStringConvertible {
    var description: String {
        return "\(brand), \(volume), \(price), \(productName), \(manufactureDate)"
    }
}
```
```swift
enum Milk: String, CustomStringConvertible {
    case seoul = "서울우유"
    case bing = "빙그레"
    case namyang = "남양유업"
        
    var description: String {return "\(rawValue)"}
    }
```
```swift
enum SoftDrik: String, CustomStringConvertible {
    case coca = "코카콜라"
    case pepsi = "펩시"
    case lotte = "롯데칠성음료"
        
    var description: String {return "\(rawValue)"}
    }
```
```swift
enum Coffee: String, CustomStringConvertible {
    case maxim = "맥심"
    case lotte = "롯데칠성음료"
    case coca = "코카롤라"
        
    var description: String {return "\(rawValue)"}
    }
```
- print() 함수 활용하여 콘솔 출력 예정으로 CustomStringConvertible 프로토콜을 채택

#### Brand 구조체 enum 타입 수정
```swift
import Foundation

struct Brand {
    
    enum Brand: String, CustomStringConvertible {
        case seoul = "서울우유"
        case bing = "빙그레"
        case namyang = "남양유업"
        case coca = "코카콜라"
        case pepsi = "펩시"
        case lotte = "롯데칠성음료"
        case maxim = "맥심"
        
        var description: String {return "\(rawValue)"}
    }
    
}
```
- 롯데칠성, 코카콜라 등 겹치는 요소가 있고 외부접근시 코드 가독성을 위하여 수정

#### Beverage Class CustomStringConvertible 리턴값 수정
```swift
extension Beverage: CustomStringConvertible {
    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return "\(brand), \(volume)ml, \(price)원, \(productName), \(dateFormatter.string(from: manufactureDate))"
    }
}
```
- DateFormatter() 활용하여 202210224와 같은 형식으로 리턴값 수정

#### ViewController에 print함수 추가하여 콘솔출력
```swift
class VendingMachineViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Beverage(brand: Brand.Brand.seoul, volume: 200, price: 1000, productName: "날마다딸기우유", manufactureDate: Date()))
        print(Beverage(brand: Brand.Brand.lotte, volume: 500, price: 900, productName: "콘트라베이스 콜드브루 블랙", manufactureDate: Date(timeIntervalSinceNow: -86400 * 10)))
        print(Beverage(brand: Brand.Brand.maxim, volume: 400, price: 3000, productName: "TOP아메리카노", manufactureDate: Date(timeIntervalSinceNow: -86400 * 2)))
    }

}
```
#### MVC
- Model : 앱의 데이터와 비즈니스 로직을 관리한다.
- View : 데이터를 시각화하여 보여준다.
- Controller : Model과 View의 중간다리 역할을하며 둘 사이에서 데이터를 넘겨준다.

#### UIApplicationMain()
- 앱이 시작되면 시스템은 UIApplicationMain()을 호출
- application객체와 application delegate를 만들고, 이벤트 사이클을 설정하는 역할
- application객체의 주요역할은 들어오는 사용자 이벤트의 초기 라우팅을 처리하는 것
- UIApplication클래스는 UIApplicationDelegate프로토콜을 준수
- application객체는 delegate에게 중요한 런타임 이벤트(앱 시작, 메모리 부족, 앱 종료 등)를 알리고, 응답할 기회를 제공

#### 프로토콜
- 스위프트는 프로토콜 지향 언어
- 중요한 키워드는 Protocol과 extension
- 특정 역할을 하기 위한 메소드, 프로퍼티, 기타 요구사항 등의 청사진
- 프로토콜은 정의를 하고 제시를 할 뿐, 스스로 기능을 구현하지 않음
- 프로토콜은 구현해야 하는 동작을 지장하는데 사용되는 추상적 표현을 정의
- extension은 프로토콜이 원하는 기능을 구현
- POP(Protocal Oriented Programming Language)는 클래스의 추상적인 상속의 한계를 탈피
- 의존성없이 유연하게 사용이 가능하고, 기능을 더욱 명확하게 해주는 목표를 가지고 있음

#### 실행화면
<img width="372" alt="스크린샷 2021-02-24 오전 11 44 24" src="https://user-images.githubusercontent.com/74946802/108939842-b55e6880-7695-11eb-81c6-fe58ed56dff1.png">

## Step3.

#### IBOutlet Collection 활용하기
```swift
@IBOutlet var imagesOfBeverages: [UIImageView]!
```
- 이런 방식으로 IBOutlet Collection을 활용하여 여러 뷰를 한데 묶어주면 동일처리에 용이

```swift
private func setUpImageView() {
    for beverage in imagesOfBeverages {
        beverage.layer.cornerRadius = beverage.frame.height / 4
    }
}
```
- for-loop를 통해서 각 이미지뷰에 대해 코너를 동그랗게 처리할 수 있음

#### 실행화면

<img src="https://user-images.githubusercontent.com/74946802/109743005-56f43580-7c13-11eb-822f-5181cb22d6e2.png" width="500" height="300">

## Step.4

#### 앱딜리와 신딜리
[AppDelegate & SceneDelegate](https://velog.io/@torch-ray/iOSlearn1)

#### 실행화면

![AnyConv com__Step4 VendingMachine (2) (1)](https://user-images.githubusercontent.com/74946802/110284249-da9f8f00-8024-11eb-84d1-5b9d1170c444.gif)
