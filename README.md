# VendingMachine

## Step 1 - iPad App
-  Project의 Devices 설정을 iPad로 변경, Device Orientation 설정을 Landscape Left, Landscape Right만 가능하도록 변경
- Milk, Coffee, Soda 클래스를 정의하고, 공통 속성을 갖는 Drinkable 프로토콜 정의
- VendingMachine이 음료 객체의 배열을 속성으로 갖고 있지 않도록 Drinks 타입의 하위 모듈 생성
- ViewController 내에서 Milk, Coffee, Soda 객체를 생성하고, closure를 이용해 drinks 출력
```
서울우유, 200ml, 1000원, 날마다딸기우유, 20210223
서울우유, 200ml, 1000원, 날마다딸기우유, 20210223
펩시, 350ml, 2000원, 다이어트콜라, 20210223
맥심, 400ml, 3000원, 아메리카노, 20210223
```

## Protocol
- Protocol은 property를 선언할 때 var 만을 사용한다.
- Protocol은 stored property 또는 computed property를 구분해서 명시하지 않는다. 프로퍼티 요구를 준수할 때 원하는대로 해석할 수 있다.
- Protocol도 하나의 data type이다.
- Protocol 정의 시, AnyObject을 상속하면 class만 채택할 수 있다.
- 선택적(optional) 요구사항은 `@objc`를 Protocol과 요구사항 앞에 붙여야 한다.
- associated types을 선언해서 Protocol 내에서 사용될 type의 placeholder를 작성할 수 있다. associated type의 실제 타입은 Protocol이 실제 채택되기 전까지는 정해지지 않는다.

## Protocol vs. Interface
- Swift의 Protocol은 `optional` 키워드를 붙여서 선택적으로 준수(confrom)하도록 설계할 수 있지만, Interface를 구현한 class는 모든 요구사항을 필수적으로 구현해야 한다.
- Protocol은 `static` 키워드로 타입 프로퍼티/메서드를 선언할 수 있다.
- Protocol은 extension을 통해 초기 값을 지정할 수 있다(초기 구현).

## Protocol vs. Inheritance
- Protocol은 Struct, Enum과 같은 값(value) 타입도 채택 가능하다.
- 상속은 단일 상속만 가능하지만, Protocol은 다중 상속이 가능하다.

## Step 2 - Vending Machine
- 3단계로 객체 생성
```
Drinks (1단계)
Coffee Milk Soda (2단계)
Cantata BananaMilk Fanta (3단계)
```
- `Drink` 클래스에 Hashable 프로토콜 채택해서 Dictionary의 key로 사용할 수 있도록 변경
- VendingMachine에 자판기 기능을 위한 method 추가
- 단위 테스트를 위해 XCTest를 추가하고, 테스트 코드를 추가

## Step 3 - MVC
- main 스토리보드에 음료 ImageView와 Button, Label UI 추가
- IBOutlet Collection으로 outlet을 묶고, UIButton.tag을 이용해서 각 버튼 객체를 구분하도록 구현
- 음료 객체 생성을 위한 DrinkFactory 추가
<img width="812" alt="" src="https://user-images.githubusercontent.com/75113784/109928382-bda74b00-7d08-11eb-893b-de88d6cffb68.png">

## Step 4 - App Lifecycle, NSCoding
- 재고 추가 버튼 인스턴스를 key로 갖는 딕셔너리 선언
- VendingMachine 객체 저장을 위한 NSCoding 프로토콜 채택
- UserDefaults에 VendingMachine 객체를 저장하기 위한 ArchivingManager 추가
- 재고 개수와 자판기 잔액을 저장하고, 저장된 데이터를 표시하도록 수정

## Step 5 - Observer
- 재고 개수와 충전된 금액 표시를 NotificationCenter를 통해 표시하도록 수정
- VendingMachine 객체를 Singleton으로 변경
- 충전 금액 단위를 위해 새로운 enum type `ChargeUnit` 생성
- App Switcher에서 앱을 종료하더라도 자판기 객체를 저장할 수 있도록  `sceneWillResignActive` 가 호출되는 시점에 객체를 저장
