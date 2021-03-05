## step-1 

- 설명

  - 음료를 추상화하기 위해 여러 클래스들을 설계하고 제작하였다.
  - 우선 VendingMachine타입 이 안에는 자판기가 갖고있는 drinks를 속성으로 갖고 있다. 그리고 음료수를 추가하는 add()메소드, 갖고있는 음료수들을 출력하는 printDrinks()메소드가 구현되어있다.
  - Drinks타입은 음료수들을 지칭하는 타입이다. drinks를 Beverage타입을 배열형태로 갖는 속성이다. 그리고 add(), printDrinks()메소드를 갖고있다.
  - Beverage는 음료수를 지칭하는 타입이다. 브랜드(String), 용량(Int), 가격(Int), 이름(String), 제조일자(Date)의 속성을 갖는다.
  - 그 외 Coffee, Soda, Milk타입은 Beverage를 상속받았고 그리고 그 하위타입 TOP, Cola, StrawberryMilk는 앞에 언급한 3개의 타입들을 각각 상속하였다.

  

- 실행화면

<img width="389" alt="스크린샷 2021-02-24 오후 10 47 59" src="https://user-images.githubusercontent.com/42647277/109010462-241ddf00-76f3-11eb-94e6-36ac68172926.png">

- 완성 날짜

  2021-02-24 22:53



## step-2 

- 설명
  - 음료수의 계층을 최상위 객체로부터 3단계 이상으로 구분하였다.
  - 전 상품을 종류별로 재고를 확인하기위해 Dict타입으로 해야한다. Beverage타입은 Hashable과 Equatable프로토콜을 채택하여 Dict타입의 key타입에 사용할 수 있게 되었다.
  - XCTest는 시나리오에 따라 구현하였다. (금액충전 -> 재고추가 -> 구매가능목록반환 -> 잔액확인 -> 전 상품 종류별 재고확인 -> 유통기한 지난 재고 확인 -> 재고중에서 따뜻한음료 반환 -> 구매상품이력 확인)



- 완성 날짜

  2021-03-02 19:55



## step-3

- 설명
  - 상품 관련 객체들, 잔액 관련 객체들을 스택뷰로 묶어주었고 이 객체들 또한 전부 스택뷰로 묶어주었다. (상품, 잔액, 전체)
  - IBAction은 재고 추가할 때, 금액 충전할 때, 이렇게 2가지로 작성하였다.
  - 각 상품의 Label들, 잔액 Label들, 이미지들을 IBOutlet Collection을 생성하여 연결하였다.
  - 각각 UI의 Label, Button들에 Restoration ID를 부여하여 data가 view의 ID를 식별하여 연결되도록 구현하였다.

- 실행 화면

  <img width="959" alt="스크린샷 2021-03-05 오후 4 05 48" src="https://user-images.githubusercontent.com/42647277/110080341-a4b49d80-7dcd-11eb-9672-0b6978f4de26.png">



- 완성 날짜
  - 2021-03-05 16:00


