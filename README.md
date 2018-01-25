# Vending Machine App

## iPad 프로젝트 설정
- General - Deployment Info: 
	- Devices: iPad
	- Device Orientation: Landscape Left, Landscape Right 만 체크
- 시뮬레이터: 아이패드 프로 10.5

### 레벨2 VendingMachine 코드 복사
- **기존 코드**들은 대부분 **Model 역할**을 담당
- iOS 앱 구조는 MVC 중에서도 우선 **ViewController-Model 관계부터 집중**하고, ViewController-View 관계는 다음 단계에서 개선한다.

### 기본 자판기 모델 적용
- 레벨 2에서 구현한 ActivateMode 프로토콜, 프로토콜을 채택한 AdminMode, UserMode 구조체 제거
	- 모드 및 모드별 메뉴를 입력받아 선택된 메뉴의 기능 수행하고 출력(InputView, OutputView)하는 역할이었으나, UI로 대체할 수 있는 부분이므로 제거함
- ViewController 클래스에서 VendingMachine 객체를 사용하여 음료 객체를 추가하고 재고목록을 출력
	- ActivateMode 타입이 제거되어 VendingMachine의 함수를 그대로 사용함

### 학습 내용

>- **[앱 인터페이스와 구성요소](https://github.com/undervineg/swift-vendingmachineapp/blob/vending-step2/md/app_interfaces.md)**
>- **[시스템 프레임워크 - 1. 앱 초기화 과정](https://github.com/undervineg/swift-vendingmachineapp/blob/vending-step2/md/app_initialization.md)**
>- **[시스템 프레임워크 - 2. 메인 런 루프](https://github.com/undervineg/swift-vendingmachineapp/blob/vending-step2/md/main_run_loop.md)**
>- **[시스템 프레임워크 - 3. MVC 패턴구조](https://github.com/undervineg/swift-vendingmachineapp/blob/vending-step2/md/mvc_structure.md)**
>- **[시스템 프레임워크 - 4. 앱 생명주기](https://github.com/undervineg/swift-vendingmachineapp/blob/vending-step2/md/app_lifecycle.md)**
>- **[시스템 프레임워크 - 5. iOS와 코코아 터치 프레임워크](https://github.com/undervineg/swift-vendingmachineapp/blob/vending-step2/md/cocoatouch_framework.md)**

2017-01-09 (작업시간: 1일)

<br/>

## 자판기 앱 화면(view) 구현

![](img/2_vendingmachine_v1.png)

### 화면 구성
>- 각 상품에 대한 이미지를 추가한다.
>- 각 상품에 대한 재고 추가 버튼을 추가한다.
>- 각 상품에 대한 재고 레이블을 추가한다.
>- 100원, 500원, 1000원 금액을 입력하는 버튼을 추가한다.
>- 현재 잔액을 표시할 레이블을 추가한다.

- 각 상품과 라벨 등을 Stack View에 넣어 오토레이아웃 적용
- 중복되는 아웃렛들을 IBOutletCollection으로 만들고 tag를 부여하여 사용

#### IBOutletCollection 사용하기
1. 중복되는 요소들 중 하나를 View Controller로 끌어서 IBOutletCollection 만듦
2. 만든 IBOutletCollection 옆의 동그라미(+) 버튼을 Main.storyboard의 중복되는 요소들로 드래그하여 UI 객체배열 완성
3. 각 요소를 구분하기 위한 tag 부여
4. IBAction을 하나 만들어서 각 요소와 연결
5. IBAction 내에서 IBOutletCollection으로 만든 배열 사용
	- 예시:

		```swift
		@IBAction func buttonTapped(_ sender: UIButton) {
			for button in starButtons {
				// 액션이 일어난 버튼의 태그와 같거나 작은 버튼들에
				if button.tag <= sender.tag {
					button.setImage(UIImage.init(named: “star_selected”), 				for: .normal)
				} else {
					button.setImage(UIImage.init(named: “star_normal”), for: .normal)
				}
			}
		}
		```

>- IBOutletCollection은 순서를 보장하지 않는다.
>- 연결된 ViewController에는 NSArray로 생성된다.

[참고: What is an IBOutletCollection in iOS](https://medium.com/@abhimuralidharan/what-is-an-iboutletcollection-in-ios-78cfbc4080a1)

#### 라벨 내 마진 주기
- UILabel에 배경색을 주면 콘텐츠(텍스트)와 배경색 사이에 공간이 없어 보기 좋지 않음.
- **UILabel에는 마진을 줄 수 없다.**
- **버튼을 라벨 대신 사용한다 :**
    - Accessibility > **User Interaction Enabled 체크 해제**
    - Accessibility > **Static Text 체크**
    - View > **User Interaction Enabled 체크 해제**
    - Size Inspector > **Content Insets** 값 정의

![](img/2_margin.png)

#### UI 요소에 테두리/색상테두리/둥근테두리 주기
- Identity Inspector > User Defined Runtime Attributes에 키 추가 :
    - 테두리: **layer.borderWidth** (Number)
    - 테두리색상: **layer.borderUIColor** (Color) 
    - 둥근테두리: **layer.cornerRadius** (Number)

![](img/2_runtime_attribute.png)

#### StackView에 spacing을 주면 이미지가 올라감
- Baseline Relative 체크

![](img/2_baseline.png)

#### 이미지뷰와 재고라벨에 Set vertical compression resistance priority to 123 에러가 남
- 문제원인: stackview에 spacing을 주면 콘텐츠가 무너질 수도 있기 때문에 나타나는 에러로 추정.
- 해결방법: 재고라벨에 Height 제약을 줌.

<img src="img/2_height.png" width="30%"></img>

#### 이미지뷰 크기 동일하게 고정하기(150x150)
- 자기자신에게 제약조건 width, height를 주면 됨

<img src="img/2_width_height.png" width="40%"></img>

<br/>

### 기능 구현
>- 각 상품의 재고 추가 버튼을 누르면 각 상품 재고를 추가하도록 코드를 구현한다.
>- 재고 추가 버튼을 누르고 나면 전체 레이블을 다시 표시한다.
>- 금액 입력 버튼을 누르면 해당 금액을 추가하도록 코드를 구현한다.
>- 금액을 추가하고 나면 잔액 레이블을 다시 표시한다.

#### 프로토콜 UserServable에 insertMoney(_ money: MoneyManager.Unit) 정의 시, MoneyManager 클래스에 제네릭 제약조건이 필요
- 문제사항: 
	- insertMoney() 함수의 파라미터로 쓰이는 MoneyManager 클래스가 (Machine을 제네릭으로 가지는) 제약조건을 가짐. 
	- 하지만, 프로토콜 정의 시 `MoneyManager<Machine>.Unit`으로 적으면 `Using 'Machine' as a concrete type conforming to protocol 'Machine' is not supported` 에러 발생. 
	- 하지만 따로 associatedtype을 정의해주기에는 부수적인 제약조건 문제가 생길 가능성이 큼.
- 해결방법: `insertMoney(_ money: MoneyManager<Self>.Unit)`로 정의. UserServable은 Machine 클래스를 상속받으므로, <Self>를 사용하여 자기자신 타입(Self)을 넣어줘도 됨.

#### NSUnknownKeyException 에러발생
- 에러코드: VendingMachineApp[37705:2367314] *** Terminating app due to uncaught exception 'NSUnknownKeyException', reason: **'[<VendingMachineApp.ViewController 0x7fef47508040> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key productImages.'**
- 문제원인: 뷰컨트롤러에 연결한 IBOutlet을 지우고나서 연결을 끊지 않음

2017-01-14 (작업시간: 1일)

<br/>

### Feedback
#### 스토리보드보다 코드로 객체를 만들고 표현하는 연습을 하는 편이 동작 방식을 이해하는 데 좋다. 
- `layer.cornerRadius` 값을 디자인 타임에 적용해서 확인하는 것도 좋지만, 코드로 속성을 어디에 넣어야 바뀌는지 공부하고 동작 방식을 이해하는 게 더 중요함
- 개선사항: 기존에 스토리보드의 Identity Inspector > User Defined Runtime Attributes에 줬던 `layer.cornerRadius`를 viewController에서 작성

#### 하나의 파일로 extension을 합치면 어떤 장단점이 있을까요?
- 익스텐션을 각 타입에 따라 여러 파일로 분리해놓는게 필요한 경우에만 선택적으로 확장할 수 있는 장점이 있다.
	
#### ★ 화면 요소와 데이터를 매칭해야 하는 경우는 항상 발생한다.
- 직접적으로 스토리보드에서 태그값을 넣어놓고 sender.tag 에 접근하기 보다는 화면요소와 데이터를 매칭할 수 있는 데이터 구조를 갖고 있는 것이 좋다.
- 값을 바꾸거나 데이터 구조가 변경되면 이에 따라 화면 요소까지 바꿔야 하기 때문이다.
	
	``` swift
	@objc func insertMoney(_ sender: UIButton) {
		// 버튼 태그에 따라 특정 금액 삽입.
		machine.insertMoney(MoneyManager<VendingMachine>.Unit(rawValue: sender.tag)!)
	}	
	```
- 개선사항: Mapper 구조체를 작성하여 UI요소인 sender의 tag에 따라 특정 model 값을 리턴하는 함수들 추가
	- 개선 1: (여러 UI 요소 타입을 받으려면 **UIView** 사용)

	```swift
	struct Mapper {
	    static func mappingUnit(with sender: UIButton) -> MoneyManager<VendingMachine>.Unit? {
	        var unit = MoneyManager<VendingMachine>.Unit(rawValue: 100)
	        switch sender.tag {
	        case 1: unit = MoneyManager<VendingMachine>.Unit(rawValue: 100)
	        case 2: unit = MoneyManager<VendingMachine>.Unit(rawValue: 500)
	        case 3: unit = MoneyManager<VendingMachine>.Unit(rawValue: 1000)
	        default: break
	        }
	        return unit
    	}
   	 	...
    }
	```
	- 개선 2: 
	
	```swift
	static func mappingUnit(with sender: UIButton) -> MoneyManager<VendingMachine>.Unit? {
        return MoneyManager.Unit(rawValue: sender.tag)
    }
	```
	>- 이전처럼 직접 tag값을 사용하는 것 같지만, init?(rawValue:) 를 쓰면 sender.tag 를 넣더라도 범위에 들어가면 열거형 타입이 생성될꺼고 아니면 nil 값이 된다.
	>- 결과적으로는 동일하지만 switch-case 로 모든 값을 매칭해주지 않아도 init() 함수로 매칭할 수 있다.
	>- 이렇게 작성할 경우, 유지보수나 확장성 측면에서도 **Menu에 case가 추가되거나 삭제해도 이 부분을 수정할 필요가 없다**는 장점이 있다. 
	>- **개발자가 코드로 실수할 수 있는 부분을 컴파일러가 검사할 수 있도록 만드는 방식**이 있다면 그걸 선택하는 게 좋다.

#### 하드코딩해서 단위를 붙이지 않는다.
- 단위를 붙일 때, 여러 국가를 지원할 때를 고려해서 하드코딩 값을 넣기보다는 Formatter를 만드는 편이 좋다.
- 기존:

	```swift
	@objc func updateBalanceLabel() {
		if let balance = machine.showBalance().currency() {
			balanceLabel.text = balance + "원"
		}
	}	
	```
- 개선: Formatter 열거형 정의

	```swift
	enum Formatter {
	    case kor(Int)
	    case eng(Int)
	    var moneyUnit: String {
	        switch self {
	        case .kor(let value):
	            guard let valueInCurrencyFormat = value.currency() else { return "원" }
	            return valueInCurrencyFormat + "원"
	        case .eng(let value):
	            guard let valueInCurrencyFormat = value.currency() else { return "won" }
	            return valueInCurrencyFormat + "원"
	        }
    }
	```	
	사용 시: `Formatter.kor(machine.showBalance()).moneyUnit`
	
<br/>

## 앱 생명주기와 객체 저장

<img src="img/3_initial.png" width="45%">
<img src="img/3_update.png" width="45%">

### 저장 가능한 모델 구현: Codable 사용
- 기존: NSObject, NSCoding 사용. class에만 적용 가능함
- 개선: swift4부터 **Codable** 프로토콜 지원됨. **struct, enum 등에도 적용 가능함**
- 에러코드: `Ambiguous reference to member 'encode(_:forKey:)'`
    - 문제원인: Codable 하지 않은 타입을 인코드 할 때 생기는 문제
    - 해결방법: enum, struct, class 등 원시타입이 아니라면 Codable 채택 및 구현

1. Codable 채택
2. CodingKey 타입의 enum 추가
3. `func encode(to encoder: Encoder) throws` 및 `required init(from decoder: Decoder) throws` 구현
4. 상속관계에 있는 서브 클래스의 경우, Codable은 채택하지 않고 `required init(from decoder: Decoder) throws`를 오버라이드한 후 `try super.init(from: decoder)` 추가

**[참고: Start Developing iOS Apps](https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/PersistData.html)**

**[참고: Swift 4.0 Codable — Decoding subclasses](https://medium.com/tsengineering/swift-4-0-codable-decoding-subclasses-inherited-classes-heterogeneous-arrays-ee3e180eb556)**

### 파일시스템에 저장할 공간 마련: 어플리케이션 샌드박스, UserDefaults 등
#### UserDefaults란
- **사용자 설정을 저장하는 용도의 직렬화(plist)**
- 저장: `UserDefaults.standard.set(data, forKey: MachineStore.Key)`
- 불러오기: `let data = UserDefaults.standard.data(forKey: MachineStore.Key)`

#### 어플리케이션 샌드박스란
- **모든 iOS 앱은 어플리케이션 샌드박스(application sandbox)를 가진다.** 이는 파일 시스템상의 디렉터리로, 앱은 반드시 자신의 샌드박스 안에 위치해야 하고 다른 앱들은 접근할 수 없다.
- 다음과 같은 디렉토리가 있다:
    - **Documents/** : 앱이 실행 중에 생성한 데이터를 다시 실행 시에도 유지할 수 있도록 저장하는 디렉토리. 아이튠즈나 아이클라우드와 동기화할 때 백업되기 때문에 문제가 생겼을 시 복원 가능하다.
    - **Library/Caches/** : Documents/와 비슷한 역할이지만, 아이튠즈나 아이클라우드와 동기화 시 백업되지 않는다. 시스템은 기기의 디스크 공간이 부족하면 이 디렉토리의 내용을 지울 수도 있다.
    - **Library/Preferences/** : 설정 내용이 저장되고, Settings앱이 앱의 설정을 검색하는 디렉토리. UserDefaults 클래스가 자동으로 처리한다. 아이튠즈나 아이클라우드와 동기화 시 백업된다.
    - **tmp/** : 앱 실행 중에 임시로 사용하는 데이터를 저장하는 디렉토리.  파일들을 더 이상 사용하지 않을 때는 지워야 한다. OS는 앱이 실행되지 않을 때 이 디렉토리의 파일들을 제거할 수도 있다.

### 데이터를 저장하고 로딩하는 과정 구현: 이름있는 아카이브
#### 에러코드
`VendingMachineApp[87522:3770545] Unrecognized selector -[VendingMachineApp.VendingMachine replacementObjectForKeyedArchiver:]`

- 해결방법: **Codable을 사용할 때는 꼭 PropertyListEncoder/PropertyListDecoder 로 encode/decode 해줘야 한다.**
	- `try PropertyListEncoder().encode()`
	- `try PropertyListDecoder().decode()`

#### 참고
* 시뮬레이터로 아카이빙 테스트할 때는 시뮬레이터 내에서 앱을 끄지 말고 xocde에서 정지했다가 다시 켜는 식으로 확인한다.
* ViewController에서 AppDelegate를 받아와서 처리할 때, `let delegate = UIApplication.shared.delegate as? AppDelegate self.machine = delegate?.machineStore.machine` 구문을 init에 넣지 말고 **viewDidLoad**에 넣어야 한다.
* 왜냐하면 **AppDelegate보다 init이 먼저 호출될수도 있기 때문**이다.
* 또, viewDidLoad에서 기존 데이터를 뷰에 표시하도록 update함수들을 한 번 호출해야 화면이 표시되자마자 이전 데이터가 표시된다.


### 학습 내용
>- **[객체 복사](https://github.com/undervineg/swift-vendingmachineapp/blob/vending-step3/md/copy_object.md)**
>- **[Codable과 NSCoding을 아카이빙하는 방법의 차이 및 장단점](https://github.com/undervineg/swift-vendingmachineapp/blob/vending-step4/md/archiving_difference.md)**
>- **[Dynamic Type](https://github.com/undervineg/swift-vendingmachineapp/blob/vending-step3/md/dynamic_type.md)**

<br/>

## 싱글톤(Singleton) 패턴 적용
### VendingMachine 객체를 싱글톤으로 접근할 수 있도록 개선
- static 변수로 VendingMachine 객체 생성
- 직접 접근하지 않도록 class 메소드를 만들어 싱글톤 객체 반환
- 직접 값 변경하지 못하도록 class 메소드 추가
```swift
private static var sharedInstance = VendingMachine()
class func shared() -> VendingMachine {
    return sharedInstance
}
class func restoreStates(_ machine: VendingMachine) {
    sharedInstance = machine
}
```

### 의존성 주입
ViewController에서 VendingMachine의 sharedInstance에 직접 접근하지 않고 외부에서 주입하도록 수정
#### ViewController의 model 객체 타입을 프로토콜 타입으로 선언
- 기존: Managable, UserServable이 제네릭 프로토콜인 Machine을 상속하고 있기 때문에 ViewController<제약조건>으로 작성함.
	- 에러코드: **Unknown class _TtC17VendingMachineApp14ViewController in Interface Builder file.**
	- 해결방법: **IB 사용 시, 뷰컨트롤러에 제네릭 제약조건을 주면 동작하지 않는다.** (제네릭 프로토콜 다 지워서 해결)
	- 개선: `var machine: (Managable&UserServable)?`

#### MachineStore를 VendingMachine.swift로 이동
VendingMachine 싱글톤 객체를 MachineStore를 통해서만 접근할 수 있도록 VendingMachine.swift로 옮긴 후 shared()를 fileprivate으로 변경

#### AppDelegate에서 ViewController에 의존성 주입
- 기존: ViewController에서 VendingMachine.shared()로 직접 접근
- 변경: AppDelegate에서 machineStore를 통해 데이터를 가져와서 ViewController의 machine에 주입
	
	```swift
	if let mainVC = window?.rootViewController as? ViewController {
		mainVC.machine = machineStore.loadData()
	}
	```

### 학습 내용
>- **[싱글톤 객체의 장점과 단점](https://github.com/undervineg/swift-vendingmachineapp/blob/vending-step4/md/singleton.md)**
>- **[Class 메소드와 Static 메소드의 차이](https://github.com/undervineg/swift-vendingmachineapp/blob/vending-step4/md/class_method.md)**
>- **[의존성 주입(DI)](https://github.com/undervineg/swift-vendingmachineapp/blob/undervineg/md/dependency_injection.md)**


## 옵저버(Observer) 패턴 적용
### Model 업데이트 시, NotificationCenter 사용
### MVC에 맞추어 함수 설계

![](img/5_observer.png)

#### **View ➔ Controller**
- **IBAction** 사용

#### **Controller ➔ Model**
- Model의 싱글턴 객체 사용

#### **Model ➔ Controller**
- **NotificationCenter.default.post()** 사용
    - 처음에는 ViewController의 View 업데이트 함수를 직접 호출하도록 만듦
    - iOS에서 Model은 직접 ViewController에 메시지를 보내지 않음 ➔ NotificationCenter 를 사용하는 방법으로 변경
    - (예) 잔액이 변경되면 노티를 보냄

	    ```swift
	    private(set) var balance: Balance {
	        didSet {
	            NotificationCenter.default.post(
	                name: .didUpdateBalance,
	                object: nil)
	        }
	    }
	    ```

#### **Controller ➔ View**
- **update 함수** 정의
- **NotificationCenter.default.addObserver()**로 Model에서 post한 Notification.Name에 해당하는 노티 발생 시, update 함수에 연결.
	- (예) 뷰컨트롤러: 잔액이 변경되었다는 노티를 받으면 잔액라벨을 업데이트

		```swift
		NotificationCenter.default.addObserver(
	            self,
	            selector: #selector(updateBalanceLabel),
	            name: .didUpdateBalance,
	            object: nil)
		```

	- 옵저버 제거: 뷰 컨트롤러 객체가 사라질 때 옵저버도 제거한다.
	
		```swift
		deinit {
	        NotificationCenter.default.removeObserver(
	            self,
	            name: .didUpdateBalance,
	            object: self)
	    }
		```


#### 문제점: 뷰 업데이트가 안 됨
- 문제원인: NotificationCenter.default 메소드들의 **object 파라미터 값**을 잘못 넣음
	- **addObserver 메소드의 object**: 노티를 **받을** 객체. nil인 경우, 어느 객체에서 보내든 상관 안 함
	- **post 메소드의 object**: 노티를 **보내는** 객체. 보통 post를 보내는 객체인 자기자신, **self**를 넣는다. nil인 경우, 보내는 객체가 어딘지 전달하지 않음.
	- **addObserver의 object가 정의되면, post의 object도 같이 정의해야 한다. 아니면 둘 다 nil로 정의해야 한다.**

### 학습 내용
>- **[옵저버 패턴과 느슨한 결합, 장점](https://github.com/undervineg/swift-vendingmachineapp/blob/vending-step5/md/loose_coupled.md)**
	
<br/>

### Feedback
#### Notification.Name(enum.rawValue) 형태보다는 Notification.Name() 자체를 만들어두고 활용한다.
- 기존: 

	```swift
	enum Notifications: CustomStringConvertible {
	    case didUpdateInventory = "didUpdateInventory"
	    case didUpdateBalance = "didUpdateBalance"
	    var name: Notification.Name {
	        return Notification.Name(self.description)
	    }
	    var description: String {
	        switch self {
	        case .didUpdateInventory: return
	        case .didUpdateBalance: return
	        }
	    }
	}
	```
	사용 시: `Notification.Name(NotificationNames.didUpdateBalance.description)`
- 개선 1: 

	```swift
	enum Notifications: String {
	    case didUpdateInventory
	    case didUpdateBalance
	    var name: Notification.Name {
	        return Notification.Name(self.rawValue)
	    }
	}
	```
	사용 시: `Notifications.didUpdateBalance.name`
- 개선 2:

	```swift
	extension Notification.Name {
	    static let didUpdateInventory = Notification.Name("didUpdateInventory")
	    static let didUpdateBalance = Notification.Name("didUpdateBalance")
	}
	```
	사용 시: `.didUpdateInventory` 또는 `Notification.Name.didUpdateInventory`
	

## 구매 상품 이미지를 코드로 추가

![](img/6_vendingmachine_v2.png)

### 구매 버튼 클릭 시 인벤토리 변경 → 알림
- 인벤토리에 변경이 있을 시, 뷰 컨트롤러에 알림: 구매한 음료수 정보도 전송

```swift
func notifyPurchasing(_ isPurchased: Bool) {
    if isPurchased {
        NotificationCenter.default.post(
            name: .didUpdateInventory,
            object: nil,
            userInfo: [UserInfoKeys.purchasedBeverage: recentChanged])
	}
}
```

### 인벤토리 변경 시 하단에 구매한 상품 이미지 노출
- 인벤토리 변경 시, 뷰 컨트롤러에서 받은 노티의 음료수 정보를 꺼내어 사용

```swift
NotificationCenter.default.addObserver(
            self,
            selector: #selector(catchNotification(notification:)),
            name: .didUpdateInventory, 
            object: nil)

func catchNotification(notification: Notification) {
    if let purchased = notification.userInfo,
        let purchasedBeverage = purchased[UserInfoKeys.purchasedBeverage] as? Beverage {
        // 뷰 업데이트
        updatePurchasedImages(purchasedBeverage)
    }
}
```

#### addObserver(_:selector:name:object) vs. addObserver(forName:object:queue:using:)
- 둘 다 Notification 객체를 받는 메소드를 selector에 지정해주면 Notification 객체의 UserInfo를 가지고 처리할 수 있다.
- addObserver(forName:object:queue:using:)는 셀렉터 대신 block 안에서 노티를 받은 후의 작업을 수행할 수 있는데, queue 인자를 통해 작업순서를 지정할 수 있고, block 인자는 이스케이프 클로저 형태로 되어있어 노티가 끝난 후 작업 수행이 보장돼있기 때문에 멀티쓰레드 환경에서 노티피케이션 처리를 병렬화할 수 있는 형태이다.

- 화면 하단에 이미지 추가

```swift
private func updatePurchasedImages(_ purchasedInfo: Beverage) {
    let source = Mapper.mappingImage(purchasedInfo)
    let imageView = imageMaker.imageViewWithPosition(source)
    self.view.addSubview(imageView)
}
```

- 이미지 뷰 생성 구조체: 최초 생성 시 외에는 좌상단 x좌표를 50pt씩 업데이트.

```swift
class ProductImageMaker {
    private var leftTop: CGPoint
    private let size: CGSize
    private var count: Int
    init(_ startX: Int, _ startY: Int) {
        self.leftTop = CGPoint(x: startX, y: startY)
        self.size = CGSize(width: 140, height: 100)
        count = 0
    }

    func imageViewWithPosition(_ source: UIImage?) -> UIImageView {
        let imageView = UIImageView(image: source)
        imageView.contentMode = .scaleAspectFit
        updatePosition()
        imageView.frame = CGRect(origin: leftTop, size: size)
        count += 1
        return imageView
    }

    private func updatePosition() {
        if count > 0 {
            self.leftTop.x += 50
        }
    }
}
```


### 학습 내용
>- **[뷰: 코드 생성 vs. 스토리보드 생성](https://github.com/undervineg/swift-vendingmachineapp/blob/undervineg/md/code_vs_storyboard.md)**

<br/>

## Frame과 Bounds

<img src="img/7_vendingmachine_v3_1.png" width="45%"><img src="img/7_vendingmachine_v3_2.png" width="45%">

### Action Segue로 Unwind하기 (AdminViewController→ViewController) 
1. unwind 시 호출할 함수를 직접 입력한다. 주의할 것은 돌아갈 뷰컨트롤러에 입력해야 동작한다.

	```swift
	@IBAction func dismiss(_ segue: UIStoryboardSegue) {
		// 아무것도 안 써도 된다.
	}
	```

	> An unwind segue is created by adding an action method to the destination view controller (the view controller you want to unwind to).
	...
	Because you want to unwind back to XYZToDoListTableViewController, you need to add an action method with this format to the XYZToDoListTableViewController interface and implementation.
	> [출처: Stack Overflow](https://stackoverflow.com/questions/23721818/unwind-segue-not-working)

2. 현재 뷰컨트롤러의 트리거를 exit으로 드래그하면 Action 메소드가 뜬다. 방금 추가한 메소드를 선택한다. 단, 스토리보드에서 추가한 뷰 컨트롤러의 class를 지정해줘야 연결할 수 있다.
    > 코코아 터치 시스템은 앱 내부에 정의된 모든 메소드를 스캔하여 UIStoryboard 타입의 인자값을 입력받는 액션 메소드를 모두 수집한다. 그리고 Exit 아이콘의 목록으로 출력한다.
    > [출처: 재은씨의 swift3 기본편]()

<br/>

### Action Segue로 데이터 넘기기 (ViewController→AdminViewController)
1. AdminViewController에 넘길 데이터와 같은 타입의 변수들을 선언한다.

	```swift
	class AdminViewController: UIViewController {
	    var machine: (Managable&UserServable)?
	    ...
	}
	```

2. ViewController에서 prepare 메소드를 오버라이드한다.
    + segue.destination을 AdminViewController로 다운캐스팅
    + 1번에서 추가한 변수에 ViewController의 데이터를 직접 대입한다.

	```swift
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let adminVC = segue.destination as? AdminViewController {
            adminVC.machine = self.machine
        }
    }
    ```

### 학습 내용
>- **[디스플레이에 관하여: 포인트 vs. 픽셀](https://github.com/undervineg/swift-vendingmachineapp/blob/vending-step7/md/point_and_pixel.md)**
>- **[Frame vs. Bounds](https://github.com/undervineg/swift-vendingmachineapp/blob/vending-step7/md/frame_and_bounds.md)**

<br/>

## 코어 그래픽스(Core Graphics)
![](img/8_vendingmachine_v4.png)

### AdminViewController 위 UIView: PieGraphView 클래스 추가
- Main.storyboard에 UIView 추가: 400x400 크기 및 바탕색과 동일한 연회색으로 설정
- UIView 클래스 추가: PieGraphView
- 코드와 스토리보드 연결: Main.storyboard에 추가한 UIView의 Identity > Custom Class를 PieGraphView로 선택

### Segment 구조체: PieGraphView에 쓰일 데이터 구조
파이차트의 각 요소를 나타내는 데이터구조인 Segment 구조체 추가

```swift
struct Segment: CustomStringConvertible {
    let name: String
    let value: Int
    let color: UIColor
}
```

### VendingMachine 수정
#### 음료별 총 판매개수 기록
파이차트에 나타내기 위한 음료별 총 판매개수 기록
- 판매기록 시 새 메뉴가 추가되면 AdminViewController에 알림 (새 메뉴가 판매되면 세그먼트 추가하기 위함)

	```swift
	private(set) var totalPurchasedCount: [VendingMachine.Menu:Int] {
        didSet {
            // 새 음료 종류가 추가된 경우에만 알림.
            if oldValue.count < totalPurchasedCount.count {
                // 가장 최근 구매이력 항목을 이용.
                guard let lastRecord = purchasedHistory.last else { return }
                NotificationCenter.default.post(
                    name: .didUpdateRecord,
                    object: nil,
                    userInfo: [UserInfoKeys.addedRecord: lastRecord])
            }
        }
    }
	```

### AdminViewContoller: 구매이력을 통한 Segment 생성 및 뷰 업데이트
- viewDidLoad: 음료별 총 판매개수 데이터를 이용하여 Segment 객체 생성. pieGraphView 객체의 Segment 파라미터에 주입.

	```swift
	pieGraphView.segments = machine?.purchasedCount().map({ (menu, count) -> Segment in
		Segment(name: menu.productName, value: purchasedCount, color: UIColor.random)
	})
	```

- 음료별 총 판매개수 업데이트 시: 새 음료수의 판매개수가 업데이트되면 (노티를 받은 후) 새 세그먼트를 생성하여 pieGraphView에 주입.

	```swift
	@objc func addSegment(_ notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        if let addedRecord = userInfo[UserInfoKeys.addedRecord] as? HistoryInfo {
            let newSegment = generateSegment(addedRecord.purchasedMenu, addedRecord.count)
            pieGraphView.segments?.append(newSegment)
        }
    }
	```

- AdminViewController가 노출될 때, 즉 viewWillAppear인 시점에 pieGraphView도 새로 그린다.

	```swift
	override func viewWillAppear(_ animated: Bool) {
        pieGraphView.setNeedsDisplay()
    }
	```

### PieGraphView 구현
#### 음료별 파이 그리기
- Core Graphics 컨텍스트에 addArc()를 이용하여 부채꼴을 그린 후 색상을 채운 후 테두리선을 그림
> Q. UIBezierPath로는 그려지지 않는다. (CALayer를 사용하지 않고) 어떻게 그려야 하나?

	```swift   
	private func drawGraph(_ segment: Segment, in sector: Sector) {
	    let ctx = UIGraphicsGetCurrentContext()
	    ctx?.addArc(
	        center: sector.origin,
	        radius: sector.radius,
	        startAngle: sector.startAngle,
	        endAngle: sector.endAngle,
	        clockwise: false)
	    // 테두리를 그릴 선.
	    ctx?.addLine(to: sector.origin)
	    ctx?.setFillColor(segment.color.cgColor)
	    ctx?.setLineWidth(3)
	    ctx?.setStrokeColor(UIColor.black.cgColor)
	    ctx?.drawPath(using: .fillStroke)
	}
	```
> **Q. addArc 시 clockwise를 false로 설정했는데 시계방향으로 진행된다. 이유는?**
- 모든 세그먼트들을 돌면서 개별 파이를 그린다.
- startAngle은 0(오른쪽)부터 시작하여 시계방향으로 진행된다.
- 한 개 파이를 그린 후, 끝난 지점의 endAngle을 다시 startAngle에 대입하여 다음 파이를 그린다.

	```swift
	override func draw(_ rect: CGRect) {
        let origin = CGPoint(x: bounds.width/2, y: bounds.height/2)
        // 경계 부분이 잘릴 수 있으니 -6 정도로 여유를 준다.
        let radius = CGFloat(min(bounds.width, bounds.height)/2-6)
        var startAngle: CGFloat = 0
        segments?.forEach { segment in
            let endAngle: CGFloat = startAngle + radians(from: degree(of: segment.value))
            let sector = Sector(origin: origin, radius: radius, startAngle: startAngle, endAngle: endAngle)
            drawGraph(segment, in: sector)
            drawText(segment, inside: sector)
            startAngle = endAngle
        }
    }
	```

#### 파이 위에 텍스트 그리기
- 텍스트 위치 계산: 파이 중간쯤에 텍스트를 그리기 위해 **반지름의 1/2**, **파이 각도의 2/3** 를 이용하여 **cos**, **sin** 공식으로 텍스트 위치 계산
- 텍스트 중앙정렬: 글자 개수(length)가 아니라, CG로 나타낼 수 있는 실제 길이의 절반만큼 뺀다.
	- **text.size().width** 사용

```swift
private func drawText(_ segment: Segment, inside sector: Sector) {
    let text = NSMutableAttributedString(string: segment.name, attributes: textAttributes)
    let halfAngle = sector.startAngle + (sector.endAngle-sector.startAngle)/2
    // 절반은 너무 좁아서 반지름길이의 2/3 정도로 잡음.
    let halfRadius = sector.radius*2/3
    // 텍스트 중앙정렬을 위해 글자 실제길이의 절반을 왼쪽으로 옮김(-).
    let centerOfSegment = CGPoint(
        x: sector.origin.x+cos(halfAngle)*halfRadius-text.size().width/2,
        y: sector.origin.y+sin(halfAngle)*halfRadius)
    text.draw(at: centerOfSegment)
}
```

### 학습 내용
>- **[UIView와 Core Graphics 개요](https://github.com/undervineg/swift-vendingmachineapp/blob/vending-step8/md/uiview_and_coregraphics.md)**
>- **[View Drawing Cycle](https://github.com/undervineg/swift-vendingmachineapp/blob/vending-step8/md/coordinate_in_ios.md)**
>- **[Arcs and Rotations](https://github.com/undervineg/swift-vendingmachineapp/blob/vending-step8/md/arcs_and_rotations.md)**