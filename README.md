# Vending Machine App 🥫

## Step 1 - Beverage Class (🎉 Feb 24)

- 자판기의 음료수를 포괄하는 `Beverage` class를 생성하고, subclass `Milk`, `Soda`, `Coffee`를 각각 생성하였다.
  - 중분류 class **init** 시 클래스 내부에 정의된 enum `Kind`를 통해 종류를 선택하면 각 제품에 맞는 가격/용량/브랜드를 불러오도록 하였다. 제작날짜는 오늘 날짜로부터 10일 전의 랜덤한 날짜를 지정.
- `VendingMachine` class를 생성하고, 음료 정보를 프린트하는 클로저를 받고 정보를 전달하는 메소드를 생성하였다.
- `ViewController` 를 통해 음료 객체를 생성한 뒤, `VendingMachine`의 메소드를 활용하여 콘솔에 음료 정보를 프린트하였다.

<img width="713" alt="step1" src="https://user-images.githubusercontent.com/72188416/108961437-b229a380-76ba-11eb-865d-b5032b81bc17.png">

<br>

## Step 2 - More Beverages & VendingMachine Struct (🎉 Mar 2)

- 음료수의 class 계층을 3단계로 나누어 구현하였다.
  - `Beverage`: 최상위 클래스. 음료수 기본 정보 포함
  - `Milk`, `Soda`, `Coffee`: `Beverage`의 하위 클래스, 각 특성에 맞는 프로토콜 채택
  - `Chocolate/Plain`,  `Cola/Milkis`, `Americano/CafeLatte`: 가장 하위의 클래스. 각각 `Milk`, `Soda`, `Coffee`의 하위 클래스이며 각 특성에 맞는 프로토콜 채택
- `VendingMachine` Struct를 생성하고, 자판기가 해야하는 일의 특성에 따라 연관 클래스를 포함하도록 하였다. 
  - `VendingMachine`: 해당 클래스에서는 아래 객체들의 동작을 총괄한다.
  - `Beverages`: 음료 창고 역할을 하는 클래스. 재고 관리 동작을 하며, 상품 리스트를 가지고 있다. 해당 타입의 productList, soldList 객체를 생성하여 상품 리스트와 팔린 리스트를 각각 관리하도록 하였다.
  - `MoneyBox`: 투입한 금액과 관련된 책임을 모아 둔 클래스. 금액 입출, 현재 금액으로 살 수 있는 음료 리스트를 반환하는 일을 한다.
  - `Filterer`: 특정 조건에 따라 필터된 음료수의 목록을 불러오는 역할을 한다.