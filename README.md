## Step1

### 클래스 계층구조
<img width="931" alt="스크린샷 2021-02-25 오후 5 46 09" src="https://user-images.githubusercontent.com/69951890/109127086-59790a00-7791-11eb-8aac-e2f731b3ba31.png">

### 설명
* 각 각의 클래스들의 Init() 함수 구현
* VendingMachine Class 에서 [Beverage] 배열을 바로 처리하지 않고, Inventory Class를 추가하여 구현
    * addBeverage(beverage: Beverage), eachBeverage( handler: (Beverage) ->  () )
* Date Type 처리
    * StringType <-> Date 처리를 해주기 위하여 Date Extension 을 이용 

* 완성날짜 2021-02-25

## Step2

### Factory Method 구조

<img width="575" alt="스크린샷 2021-03-03 오후 2 12 07" src="[https://user-images.githubusercontent.com/69951890/109756036-7ba7d780-7c2a-11eb-8ca4-bbf02c4be78b.png](https://user-images.githubusercontent.com/69951890/109756036-7ba7d780-7c2a-11eb-8ca4-bbf02c4be78b.png)">

### VendingMachine 구조

<img width="404" alt="스크린샷 2021-03-03 오후 2 18 47" src="[https://user-images.githubusercontent.com/69951890/109756481-61222e00-7c2b-11eb-80ee-f8de9b335355.png](https://user-images.githubusercontent.com/69951890/109756481-61222e00-7c2b-11eb-80ee-f8de9b335355.png)">

### 설명

- 팩토리 메소드를 구현하여, 인스턴스의 타입을 각 각의 서브 클래스에서 결정하도록 구현
    - (확장에 대해서는 열려있고, 변화에 대해서는 닫혀있게 하기 위함)
- metaType을 이용하여 Class의 Type을 통해 적절한 인스턴스 생성
    - (인스턴스 생성 시 Class.Type을 매개변수로 넘겨주어, 원하는 인스턴스 생성하도록)
- VendingMachine 아래에 하위 모듈 Inventory, VendingMachineManager 를 두어 추상화 하여 구현

- 완성날짜 2021-03-03
