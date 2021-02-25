# 음료 자판기 앱

![image](https://user-images.githubusercontent.com/60323625/109226747-992c0a00-7802-11eb-9aca-2cfbd56580da.png)

## step1

* Devices 설정: 아이패드, Device Orientation: Landscape Left, Landscape Right
* iOS 앱 프로젝트 기본 구조인 MVC 형태에 맞춰서 작업한다.



*  객체지향 프로그래밍 방식으로 아래 예시 음료를 추상화하는 Beverage 클래스(class)를 정의한다.

  * 필수 속성 : 브랜드(String), 용량(Int), 가격(Int), 이름(String), 제조일자(Date)
  * 우유 - 딸기우유, 초코우유, 바나나우유 택 1
  * 탄산음료 - 콜라, 사이다, 환타 택 1
  * 커피 - TOP, 칸타타, 조지아 택 1

* 음료 상품 클래스 출력을 위해서 CustomStringConvertible 프로토콜을 추가하고 구현한다.

*  ViewController 에서 특정한 음료수 객체 인스턴스를 클래스별로 구분해서 print() 함수로 출력한다.

* Project의 Devices 설정을 iPad로 변경, Device Orientation 설정을 Landscape Left, Landscape Right만 가능하도록 변경

* 음료를 추상화하는 클래스 Beverage 정의, Beverage를 상속받는 하위클래스 Milk, SoftDrink, Coffee 클래스를 정의

* VendingMachine 내의 음료 재고들을 가리키는 Stock 클래스 정의하여 추상화

* ViewController 내에서 vendingMachine, Staff 객체 생성,

  Milk, Coffee, Soda 객체를 생성하고 Staff가 이를 자판기에 추가하고 재고를 출력



* 결과화면

<img width="432" alt="스크린샷 2021-02-26 오전 6 35 00" src="https://user-images.githubusercontent.com/60323625/109221565-dc837a00-77fc-11eb-8fd7-119081357134.png">