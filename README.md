# 1단계 아이패드 앱

2021.02.25(목)

### 1. 프로젝트에 대한 일반 설정 (General)에서 Devices 항목을 iPad로 변경하고, Device Orientation 항목을 가로 (Landscape Left, Landscape Right)만 선택
### 2. 기본 상태로 아이패드 프로 (9.7인치) 시뮬레이터를 골라서 실행
<img width="1371" alt="스크린샷 2021-02-24 오후 4 56 28" src="https://user-images.githubusercontent.com/73586326/108966548-a55c7e00-76c1-11eb-827d-4d7df6e813c2.png">

### 3.객체지향 프로그래밍 방식으로 아래 예시 음료를 추상화하는 클래스(class)를 설계
- 필수 속성 : 브랜드(String), 용량(Int), 가격(Int), 이름(String), 제조일자(Date)
- 우유 - 딸기우유, 초코우유, 바나나우유 택 1
- 탄산음료 - 콜라, 사이다, 환타 택 1
- 커피 - TOP, 칸타타, 조지아 택 1
### 4. 음료 상품 클래스 출력을 위해서 CustomStringConvertible 프로토콜을 추가
### 5. ViewController 에서 특정한 음료수 객체 인스턴스를 클래스별로 구분해서 print() 함수로 출력
<img width="419" alt="스크린샷 2021-02-25 오후 10 59 31" src="https://user-images.githubusercontent.com/73586326/109164575-f356ac00-77bd-11eb-8e53-1336c29f3a31.png">

### 구현설명
1. 상위 클래스로 Beverage 클래스를 생성하였고 제품 내용 출력을 위해 CustomStringConvertible 프로토콜을 사용하였다. Beverage 클래스 내부엔 각각 brand, volume, price, name, manufacturedDate 속성을 가지게 하였다.
2. 하위 클래스로는 각각 Soda, Coffee, Milk를 가지고 있으며 Beverage를 상속하고 있다. 
3. Soda 클래스 내부엔 kindOfSoda라는 enum을 생성하였고 coke, fanta, cider 라는 case를 만들어주었다. 
4. Coffee 클래스 내부엔 kindOfCoffee enum을 생성하였고 catata, top, georgia 라는 case를 만들어주었다.
5. Milk 클래스 내부엔 kindOfMilk enum을 생성하였고 strawberryMilk, chocolateMilk, bananaMilk 라는 case를 만들어주었다.
6. 각각 하위 클래스의 enum은 세부적인 제품들의 종류라는 상위타입으로 사용할 수 있을 것 같아 만들어주었다.

# 2단계 자판기 기본 동작

2021.03.05(수)

## 요구사항

### 음료수
1.  음료수 클래스 계층을 음료수 최상위 객체부터 그룹을 만들어서 3단계 이상 구분한다.
2. 상속 받은 하위 클래스에도 상위 클래스에 없는 적어도 하나 이상의 속성을 추가한다.
3. 추가한 속성에 대한 인터페이스와 함께 추가 인터페이스를 작성한다.
4. 음료수 클래스 인터페이스를 테스트하기 위한 테스트 코드를 작성한다.

### 자판기
1. 자판기 구조체를 설계하고, 다음과 같은 동작을 위한 메소드를 작성한다.
2. 각 메소드 동작을 검증할 수 있는 테스트 함수를 작성한다.
3. 전체 코드를 확인할 수 있는 통합 테스트 시나리오를 가지고 동작을 확인한다.

### 구현설명
1. 클래스간 계층 구조: Beverage -> Soda, Coffee, Milk -> Coke, Cantata, StrawberryMilk 형태로 구현 각각 최소 속성 1개 이상씩 추가
2. Beverage를 바탕으로 Beverages 구현
3. 자판기의 기능을 위한 VendingMachine 구현
4. 음료수의 추가 인터페이스를 위하여 Beveragable 프로토콜 생성
5. 동작 테스트를 위한 XCTest 시행

# 3단계 MVC 패턴

2021.03.11(목)

## 프로그래밍 요구사항
### 1. 스토리보드에 아이패드 앱 화면을 구현
- 각 상품에 대한 재고 추가 버튼을 추가
- 각 상품에 대한 이미지를 추가
- 각 상품에 대한 재고 레이블을 추가
- 1000원, 5000원 금액을 입력하는 버튼을 추가
- 현재 잔액을 표시할 레이블을 추가
### 2. 각 상품의 재고 추가 버튼을 누르면 각 상품 재고를 추가하도록 코드를 구현
### 3. 재고 추가 버튼을 누르고 나면 전체 레이블을 다시 표시
### 4. 금액 입력 버튼을 누르면 해당 금액을 추가하도록 코드를 구현
### 5. 금액을 추가하고 나면 잔액 레이블을 다시 표시

<img width="927" alt="스크린샷 2021-03-11 오후 3 23 58" src="https://user-images.githubusercontent.com/73586326/110746934-f010f500-8280-11eb-918c-930711deb8e6.png">
