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
