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

<img width="575" alt="스크린샷 2021-03-03 오후 2 12 07" src="https://user-images.githubusercontent.com/69951890/110292344-64a12500-8030-11eb-895a-a76c16fab134.png">

### VendingMachine 구조

<img width="526" alt="스크린샷 2021-03-08 오후 5 05 27" src="https://user-images.githubusercontent.com/69951890/110292401-7e426c80-8030-11eb-9600-469046936d21.png">


### 설명

- 팩토리 메소드를 구현하여, 인스턴스의 타입을 각 각의 서브 클래스에서 결정하도록 구현
    - (확장에 대해서는 열려있고, 변화에 대해서는 닫혀있게 하기 위함)
- metaType을 이용하여 Class의 Type을 통해 적절한 인스턴스 생성
    - (인스턴스 생성 시 Class.Type을 매개변수로 넘겨주어, 원하는 인스턴스 생성하도록)
- VendingMachine 아래에 하위 모듈 Inventory, VendingMachineManager 를 두어 추상화 하여 구현

- 완성날짜 2021-03-03

## Step3

### VendingMachineApp 실행화면

<img width="959" alt="스크린샷 2021-03-10 오후 2 37 09" src="https://user-images.githubusercontent.com/69951890/110581552-19ad1c00-81ae-11eb-912a-b250b5e11bb3.png">

### 설명

- 각 각의 음료수 재고추가 버튼
- 재고추가 버튼을 눌렀을 때 해당 음료의 재고 수 증가하고 라벨에 표시
- 잔액 추가 버튼 (+1000, +5000)

## Step4

### 설명

App LifeCylce & NSCoding 채택
 
- 자판기 인스턴스의 저장을 위해 NSCoding, NSObject 채택하도록 구현
- AppDelegate, SceneDelegate 를 통해 앱이 꺼져도 자판기의 재고 및 금액 저장되도록 구현

## Step5

### 설명

- NotificationCenter 를 통한 observer 패턴 구현


