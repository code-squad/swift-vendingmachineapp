# Vending Machine App 🥫

## Step 1 - Beverage Class (🎉 Feb 24)

- 자판기의 음료수를 포괄하는 `Beverage` class를 생성하고, subclass `Milk`, `Soda`, `Coffee`를 각각 생성하였다.
  - 중분류 class **init** 시 클래스 내부에 정의된 enum `Kind`를 통해 종류를 선택하면 각 제품에 맞는 가격/용량/브랜드를 불러오도록 하였다. 제작날짜는 오늘 날짜로부터 10일 전의 랜덤한 날짜를 지정.
- `VendingMachine` class를 생성하고, 음료 정보를 프린트하는 클로저를 받고 정보를 전달하는 메소드를 생성하였다.
- `ViewController` 를 통해 음료 객체를 생성한 뒤, `VendingMachine`의 메소드를 활용하여 콘솔에 음료 정보를 프린트하였다.

<img width="713" alt="step1" src="https://user-images.githubusercontent.com/72188416/108961437-b229a380-76ba-11eb-865d-b5032b81bc17.png">