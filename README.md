# Swift Vending Machine App



## Step 1. 음료 클래스 설계

2020.02.29 Sat

- 상위 클래스 Beverage와 이를 상속받은 Milk, Soda, Coffee 클래스 구현
- VendingMachine 클래스에서 현재 보유한 음료 목록 출력 



### 실행 화면

<img src="https://user-images.githubusercontent.com/40784518/75602870-81954500-5b0c-11ea-84c1-819746c989a5.png " width="50%"></img>



<br>

<br>



## Step 2. 자판기 기본 동작

2020.03.05 Thur

### 구현 내용 

- Milk, Soda, Coffee 각각의 세분화된 클래스 구현 (Coke, StarbucksCoffe, BananaMilk...)
- `Beverages` 클래스를 만들어 `Beverage` 추가, 삭제 기능 및 순회하고 각 종류당 수량 조회 기능 구현
- `VendingMachine` 에 기능 추가
  - 자판기 금액을 원하는 금액만큼 올리는 메소드
  - 특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
  - 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
  - 음료수를 구매하는 메소드
  - 잔액을 확인하는 메소드
  - 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
  - 유통기한이 지난 재고만 리턴하는 메소드
  - 따뜻한 음료만 리턴하는 메소드
  - 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
- `Beverage`, `Beverages`, `VendingMachine`에 대한 테스트 케이스 추가 

### 고민한 점

- 자판기에서 돈을 어떻게 가지고 있을지 고민했다. `Money`라는 객체를 따로 만들까 고민했으나 Money는 상태만 가지고 있지 행위는 가지고 있지 않아 자판기의 프로퍼티로 있는게 낫겠다 판단했다. 그래서 실제 자판기에 지폐와 동전 넣는 것을 생각하여 돈의 단위(오천원,천원,오백원,백원)로 자판기 금액을 증가시킬 수 있게 하였다.
- 음료 각각의 갯수가 자판기에서 만들어져야할 지 `Beverage`에서 만들어져야 할 지 고민했다. 허나 둘 다 아닌 것 같아 복수개의 음료를 가지고 있는 `Beverages`를 따로 만들었다.



### 수정사항

2020.03.07 Sat

- 기존에 `Beverage` 가 가지고 있던 날짜를 변환하는 기능을 Date 타입이 가지도록 확장했음
- 기존 `manufacturedDate` 와 `expirationDate` 를 `vendingMachine` 에서 접근해서 유통기한이 만료된 음료를 찾았는데, 만료된건지 확인만 하도록 `Beverage` 내부에 오늘 날짜와 유통기한 비교하는 메소드 추가함
- 기존에 expirationDate이 생성하는 시점에 Calendar.current.... 해서 음료 제조 날짜보다 7일 이전 날짜로 생성되도록 했었는데, 그러면 생성할때마다 저렇게 길게 입력해줘야 하므로 이것또한 Date 타입을 확장해 과거 날짜로 만들어지는 메소드를 생성함.
- 기존에 isHot을 Bool값으로 정했을 때는, 자판기에 ‘따뜻한 음료’ 로 따로 따뜻하게 보관해놓은 음료를 생각해두고 거기에 포함되면 true 로 주면 되겠다고 생각해서 Bool타입의 isHot 변수를 만들었음
  -  `Bool타입은 확장성이 부족한 타입이고, 데이터를 다루는 모델을 설계할 때 상태를 결정하는 것도 기준값으로 비교하는 로직으로 구현하는 것이 좋다`는 피드백을 받아 `온도` 라는 변수를 추가해 따뜻한지 기준값으로 비교하게끔 변경
- `Money` 타입을 새로 만들어서 잔액 계산 등의 역할을 가지게 함
- `flavor`나 `fatRatio`등의 선택지를 제한하고 싶어서 enum 타입의 속성을 가지도록 한건데, 음료라는 객체의 확장성을 '맛'이라는 관점에서 생각해봤을 땐 새로운 클래스를 추가하는게 나을 것 같아 `enum Flavor`  은 삭제함. 다만, `fatRatio`같은 지방 비율을 나타내는 건 아무리 선택지를 확장해도 제한된 범위 이내라고 생각해 enum 속성 그대로 두었음
- `VendingMachin` 에서 현재 잔액으로 구매 가능한 음료를 찾는 기능을 했는데, 하위 객체인 `Beverages` 가 잔액과 음료 가격을 비교해서 구매 가능한지 비교하는 역할을 리턴하도록 변경



<br>

<br>



## step3. 음료수 자판기 앱_MVC 패턴

2020.03.08 Sun

### 구현 내용

- 스토리보드에 아이패드 앱 화면을 구현
  - 각 상품에 대한 재고 추가 버튼을 추가
  - 각 상품에 대한 이미지를 추가
  - 각 상품에 대한 재고 레이블을 추가
  - 1000원, 5000원 금액을 입력하는 버튼을 추가
  - 현재 잔액을 표시할 레이블을 추가한다.
- 각 상품의 재고 추가 버튼을 누르면 각 상품 재고를 추가하도록 코드를 구현
- 재고 추가 버튼을 누르고 나면 전체 레이블 다시 표시
- 금액 입력 버튼을 누르면 해당 금액을 추가하도록 코드를 구현
- 금액을 추가하고 나면 잔액 레이블을 다시 표시



### 실행 화면

[재고 추가] 버튼과 [금액] 버튼 누른 경우 알맞게 화면이 변경되는 것을 볼 수 있다

<img src = "https://user-images.githubusercontent.com/40784518/76164087-53a8a400-618f-11ea-94cf-49ec2616aabb.png" width = "80%"/>



### 수정 사항

- `moneyType` 이름을 좀 더 명확한 `moneyUnit` 으로 변경
- `Money` 클래스에서 `balance`의 접근 제한자를 private 으로 변경해, `Money` 객체 자체를 타입으로 활용
  - `Money` 타입이 CumstomStringConvertible을 채택해 `balance` 를 문자열로 리턴해주게 함 
- `VendingMachine` 클래스에서 `raiseMoney(index:) `의 Int 타입인 인자 index를 `MoneyUnit`으로 변경해 조금 더 안전하게 동작하도록 변경
- `ViewController`에서 각 음료에 재고 추가시 재고 갯수를 리턴받는 코드를 `VendingMachine`에 클로저로 넘겨서 처리하도록 변경
- `ViewController`에서 `addMoney(button:)` 메서드에서 **Controller -> View** 로만 있던 흐름을 **Model -> View -> Controller** 의 흐름이 되도록 Observer Pattern 사용 





<br>



## step4. 앱 생명주기와 객체 저장

2020.3.13. Fri



### 요구사항

- VendingMachine 변수를 ViewController에서 포함하지 않고 AppDelegate로 옮긴다.
- AppDelegate에 선언한 변수를 ViewController에서 접근하기 위한 방법을 찾는다.
- 앱 종료(background) 시점 콜백 함수에서 VendingMachine 객체 인스턴스 속성을 저장한다.
  - 저장할 때는 VendingMachine을 아카이브해서 하나의 데이터 값으로 변형한다.
  - 값을 저장하고 복원하는 데에는 UserDefault 라는 파운데이션 라이브러리를 사용한다.
- 앱 시작(activate) 시점 콜백 함수에서 기존에 저장된 값에서 불러와서 VendingMachine 객체 인스턴스를 생성한다.
  - 복원할 때는 저장된 데이터 값을 언아카이브해서 VendingMachine 객체를 생성한다.



### 구현 내용

- VendingMachine이 NSObject를 상속받고 NSCoding을 채택하도록 클래스로 변경
- 자판기의 모든 속성 아카이빙
- 앱 라이프사이클에 따라 데이터를 저장하고 로드해오도록 구현



### 고민한 사항

- 데이터를 저장하고 불러오는 시점에 관해 고민함

  1. **데이터를 불러오는 시점은 앱이 시작할 때**

  - 처음에는 화면이 active됐을 때도 데이터를 로드해오면 좋을 것 같아 DidBecomeActive에서 로드를 해줬으나, 화면이 active됐을 때 앱델리게이트의 DidBecomeActive는 호출되지 않았고 씬델리게이트의 DidBecomeActive가 호출됐음..  

    런칭 시점에 이미 데이터를 로드해왔으므로 Active되는 시점에 데이터를 불러오지 않아도 될 것 같아서 런칭시점에만 로드되도록 변경함

  2. **데이터를 저장하는 시점은 앱이 (예상치 못하게)종료될 때와 백그라운드로 들어갈때**

  - 앱 종료시점앱 스위처에서 앱을 종료했을 때는 willTerminate 가 잘 호출되었음.
    허나 앱이 메모리가 부족해지면 suspend 상태인 앱을 별도의 알림 없이 종료시키는데 이때는 willTerminate가 호출되지 않으므로 foreground에서 background로 넘어갈때도 데이터를 저장해주면 좋을 것 같다.
  - foreground에서 background로 가는 시점앱델리게이트의 ResignActive는 불려지지 않았고 씬델리게이트의 ResignActive가 불려졌고 앱델리게이트의 didEnterBackground가 불려졌다.
    앱델리게이트의 ResignActive가 아닌 didEnterBackground에서 데이터를 저장해주면 될 것 같아 그렇게 반영.

- 디코딩 실패시 `decodeInteger`, `decodeDouble` 같은 건 0이나 0.0 등의 기본값을 넣어주지만 `decodeObject` 는 기본값을 넣어주지 않으므로 흐름에 따라서 nil을 리턴할건지 지정된 기본값을 넣어줄건지 정해서 그대로 하면 됨.

- 열거형은 인코딩이 안됨. 그래서 rawValue를 가지게 해서 rawValue 기반으로 인/디코딩 해줌

  



<br>

<br>

## step 6.구매목록 View에 반영



### 구현 내용

- 실행이후 구매 목록을 화면 아래 이미지로 추가
- 구매 목록도 앱 종료이후에 저장되고 앱 시작이후 불러오도록 개선
- 특정 제품을 구매할 때마다 해당 제품 이미지를 추가하도록 구현



### 실행 화면

<img src = "https://images.velog.io/images/delmasong/post/d0ecab66-26a9-46a4-b19d-4305697113dd/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202020-03-14%20%EC%98%A4%ED%9B%84%207.34.42.png" width = "80%"/>

