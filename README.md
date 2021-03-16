# [okstring / Isaac] Step6 - ScrollView, xib













# 

---

# 이전 Step

# [okstring / Isaac] Step1 - 프로젝트 생성 및 음료 추상화하는 클래스 생성



- #### 스텝별 작업 목록

- [x] 프로젝트에 대한 일반 설정 (General)에서 Devices 항목을 iPad로 변경하고, Device Orientation 항목을 가로 (Landscape Left, Landscape Right)만 선택한다.

- [x] 기본 상태로 아이패드 프로 (9.7인치) 시뮬레이터를 골라서 실행한다.

- [ ] iOS 앱 프로젝트 기본 구조인 MVC 형태에 맞춰서 기존 레벨2에서 작성한 자판기 소스 파일을 적용한다.

  - 기존 레벨2가 어떤 것인지 잘 모르겠습니다 

- [x] 객체지향 프로그래밍(Object-oriented Programming) 방식에 대해 학습하며 class 객체를 설계한다.

  - [x] struct가 아니라 반드시 class로 작성하세요
  - [x] 클래스 이름, 변수 이름, 함수 이름에서 자신만의 규칙을 만든다.

- [x] 객체지향 프로그래밍 방식으로 아래 예시 음료를 추상화하는 클래스(class)를 설계한다.

- [x] 음료 상품 클래스 출력을 위해서 CustomStringConvertible 프로토콜을 추가하고 구현한다.

- [x] ViewController 에서 특정한 음료수 객체 인스턴스를 클래스별로 구분해서 print() 함수로 출력한다.

- [x] iOS 앱 구조는 MVC 중에서도 우선 ViewController-Model 사이 관계에 집중하고, ViewController-View 관계는 다음 단계에서 개선한다.

- [x] ViewController 클래스에 VendingMachine 객체를 변수로 추가하고 viewDidLoad() 함수에서 음료수 객체 3종류를 추가하고 재고 목록을 print() 한다. (확인만 다음 단계를 할 때 지울 예정)

#### 학습 키워드

- 매개변수 기본 값: 인스턴스 생성 시  `date` 를 입력하지 않는다면 자동 생성하도록 매개변수 기본값을 넣었습니다.
- DateFormatter: format 형식과 String 변환

#### 고민과 해결

- enum의 위치: enum이 class 안에 있어야 하는지 밖에 있어야 하는지 고민했다. enum타입을 밖에서도 쓰는게 아니라 해당 class 인스턴스를 만들 때 사용하므로 안에다가 위치시켰습니다.



---

# [okstring / Isaac] Step2 - VendingMachine 설계, 통합 테스트 시나리오



- #### 스텝별 작업 목록

#### 음료수

- [x] 6가지 종류 음료수 상품을 판매하는 자판기 프로그램을 구현한다.
- [x] 자판기 구조체를 테스트하는 유닛테스트를 추가한다.
- [x] XCTest로 단위 테스트를 위해서 테스트 타깃을 추가하거나 설정한다.
- [x] 음료수 클래스 계층을 음료수 최상위 객체부터 그룹을 만들어서 3단계 이상 구분한다.
- [x] 상속 받은 하위 클래스에도 상위 클래스에 없는 적어도 하나 이상의 속성을 추가한다.
- [x] 추가한 속성에 대한 인터페이스와 함께 추가 인터페이스를 작성한다.
- [x] 음료수 클래스 인터페이스를 테스트하기 위한 테스트 코드를 작성한다.

#### 자판기

- [x] 자판기 금액을 원하는 금액만큼 올리는 메소드

- [x] 특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드

- [x] 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드

- [x] 음료수를 구매하는 메소드

- [x] 잔액을 확인하는 메소드

- [x] 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드

- [x] 유통기한이 지난 재고만 리턴하는 메소드

- [x] 따뜻한 음료만 리턴하는 메소드

- [x] 시작이후 구매 상품 이력을 배열로 리턴하는 메소드

- [x] 각 메소드 동작을 검증할 수 있는 테스트 함수를 작성한다.

- [x] 전체 코드를 확인할 수 있는 통합 테스트 시나리오를 가지고 동작을 확인한다.

  

#### 학습 키워드

- Factory 패턴
- DIP(Dependency Inversion Principle, 의존 관계 역전 원칙)
- 디미터 법칙 
- OCP(Open-Closed Principle, 열림-닫침 원칙)



#### 고민과 해결

- 이번 스텝에서는 객체 지향 프로그래밍 시 기본원칙이 되는 것들을 되새기기 위해 부분 적용해보도록 노력했습니다. 특히 애매한 부분은 `StockManagement` 의 메세지가 같은 부류로 묶이지 않는 것 같아 단일책임원칙을 지키기 않는 것 같지만 그렇다고 나눈다고 해서 프로토콜을 따로 쓰이는 모양새가 나오지 않는 듯 하여 합쳐두게 되었습니다.
- test를 한꺼번에 묶어서 했지만 타입별로 나눠서 한다는 것이 아직까지 익숙치 않은 것 같습니다. 일단은 요구사항의 통합 테스트 시나리오라는 키워드처럼 처럼 일련의 과정을 하나의 함수에 넣고 이후 스텝부터 타입별로 테스트를 해보려 합니다.

#### 질문거리

- `Drink` (`Fanta`, `BingBananaMilk` 등) 객체를 만들 때  `DrinkFactory` 에서 만들고 있는 모양인데 팩토리패턴이 맞는지 모르겠습니다. 타입이 아닌 enum으로 매개변수를 받아서 아리송한거 같습니다.



---

# [okstring / Isaac] Step3 - MVC 패턴 중 View 구체화 및 연결

![screenshot](https://user-images.githubusercontent.com/62657991/110096616-6f19af80-7de1-11eb-8185-4ca9f8c760d6.png)

#### 스텝별 작업 목록

- [x] 각 상품에 대한 재고 추가 버튼을 추가한다.
- [ ] 각 상품에 대한 이미지를 추가한다.
  - 이미지 레이아웃이 안 맞아보여 주말동안 개념 정리하며 맞춰보려 합니다..!
- [x] 각 상품에 대한 재고 레이블을 추가한다. 
- [x] 1000원, 5000원 금액을 입력하는 버튼을 추가한다. 
- [x] 현재 잔액을 표시할 레이블을 추가한다. 
- [x] 각 상품의 재고 추가 버튼을 누르면 각 상품 재고를 추가하도록 코드를 구현한다.
- [x] 재고 추가 버튼을 누르고 나면 전체 레이블을 다시 표시한다.
- [x] 금액 입력 버튼을 누르면 해당 금액을 추가하도록 코드를 구현한다.
- [x] 금액을 추가하고 나면 잔액 레이블을 다시 표시한다.



#### 학습 키워드

- delegate
- MVC
- tag

#### 고민과 해결

- `StackView` 속성 설정, `constraint` 로 인해 완벽하게 보이지 않는 것 같아 아쉬웠습니다. 약간 width가 맞지 않아 margin이 다른데 공식문서를 읽어보고 해봐도 마음대로 화면에 나타나지 않아서 주말에 제대로 정렬될때까지 구현할 계획입니다.

#### 부연 설명

- view에서 Controller로 전달할 때 식별에는 주로 tag를 활용했습니다.

#### 질문거리

- tag를 쓰면서도 맞는 방법인지 의구심이 들면서도 계속 썼었는데 구체적인 식별 정보를 가지게끔 쓰이는건지 궁금합니다.



---

# [okstring / Isaac] Step4 - 아카이브 이해 및 구현



![스크린샷 2021-03-10 오후 5 10 19](https://user-images.githubusercontent.com/62657991/110597177-8e3e8580-81c3-11eb-93a9-c6747aa9406d.png)

### 스텝별 작업 목록

- [x] VendingMachine 변수를 ViewController에서 포함하지 않고 AppDelegate로 옮긴다.
- [x] AppDelegate에 선언한 변수를 ViewController에서 접근하기 위한 방법을 찾는다.
- [x] 앱 종료(background) 시점 콜백 함수에서 VendingMachine 객체 인스턴스 속성을 저장한다.
- [x] 저장할 때는 VendingMachine을 아카이브해서 하나의 데이터 값으로 변형한다.
- [x] 값을 저장하고 복원하는 데에는 UserDefault 라는 파운데이션 라이브러리를 사용한다.
- [x] 앱 시작(activate) 시점 콜백 함수에서 기존에 저장된 값에서 불러와서 VendingMachine 객체 인스턴스를 생성한다.
  - activate라는 시점을 제가 잘 이해한건지 모르겠습니다.
- [x] 복원할 때는 저장된 데이터 값을 언아카이브해서 VendingMachine 객체를 생성한다.



### 학습 키워드

- `NSObject`
- `NSCoding`
- `AppDelegate`
- `SceneDelegate`
- `UserDefaults`



### 고민과 해결

- 데이터를 저장하고 불러오는게 아무래도 생소해서 어려웠습니다. 처음에는 저장을 한다면 저장되는 파일이 있다고 생각을 하고 무작정 `FileManager`와 함께 접근하는 것들을 찾아봤는데 나중에서야 요구사항에서 `UserDefault`를 사용하라고 하신 것을 보고 꽤나 먼 길을 돌아갔다는걸 알았습니다. 해답은 문제에도 있는 것 같습니다.
- `VendingMachine`과 `Factory` 역할을 구분지어 구현했습니다. 리뷰주신 만능 VendingMachine의 모습을 피하고자 Factory에서 해결하도록 해당 로직을 Factory 안에서 하도록 수정했습니다.
- Factory 안에서 다형성을 지키도록 수정했습니다. 메소드를 사용해 Factory 내에서 다형성을 지켜보려 했지만 방법이 마땅히 떠오르지 않아 init으로 구현했는데 다형성 적용이 잘 된건지 궁금합니다.
- 각각의 버튼과 해당하는 타입의 매칭을 고민했습니다.  처음에는 Accessibility Identifier를 활용해서 매칭을 시켰지만 tag 방법과 큰 차이가 없다고 생각이 들어 선회했습니다. `Dictionary` 형식으로 저장, 매칭을 시켰는데 맞는지 확신이 들지는 않습니다.



----

# [okstring / Isaac] Step5 - Observer 활용



![description](https://user-images.githubusercontent.com/62657991/111068531-7725cd80-850c-11eb-9157-210d4efc8704.png)

### 스텝별 작업 목록 (체크박스 형태로 하려고 한 작업 목록 + 완료한 항목만 체크)

 - [x] ViewController는 viewDidLoad에서 Observe를 등록한다.

 - [x] 음식 재고가 바뀌는 Notification을 받으면 화면에 Label을 업데이트한다.

 - [x] 추가 버튼을 누르면 해당 음식 재고를 모델에 추가할 때마다

 - [x] VendingMachine 모델 객체에서는 변화에 대해 NotificationCenter에 post한다.

 - [x] 모든 동작은 이전 단계와 동일하게 동작해야 한다.

### 학습 키워드 : 이번 스텝을 하면서 학습한 내용에 대한 키워드

- `NSObject`
- `higher-order function`
- `NotificationCenter`
- `AppDelegate`
- `SceneDelegate`

### 고민과 해결

- archivedData가 제대로 동작하지 않고 error를 출력해서 이유를 찾아봤습니다. Github 이전 버전으로 돌아가 어느 시점에 저장이 됐었다가 안됐었는지 확인을 했고 enum에서 제대로 저장이 안됐음을 확인했습니다. 버전을 다시 돌아가서 확인을 한 경험이 commit을 더욱 명확하고 작게 나눠야 겠다는 것을 다시 한번 배웠습니다.

### 질문거리

- `UInt`, `enum` 을 encode, decode하려다가 막혀서 enum은 string으로 UInt는 Int로 저장을 했는데 그러면 UInt의 경우 Int 범위에 들어가지 않는 숫자들은 제대로 저장이 되지 않을 것 같아 맞지 않는다는 생각이 계속해서 들었지만 해답을 찾지 못했습니다. UInt를 타입 그대로 아카이빙하는 것이 가능한 방법일까요?



















