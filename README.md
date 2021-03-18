# 아이패드 앱


#### 요구사항

- 객체 지향 프로그래밍 방식으로 음료를 추상화하는 클래스를 설계
- CustomStringConvertible 프로토콜을 추가하고 구현 
- ViewController 에서 특정한 음료수 객체 인스턴스를 클래스별로 구분해서 print() 함수로 출력

#### 학습

- 심플 팩토리, 팩토리 메소드 패턴, 추상 팩토리 패턴



#### 완료날짜: 2021년 3월 2일(화) 15: 35


# 자판기 기본동작


#### 요구사항

- 음료수
  -  음료수 3계층으로 구분
  -  하위 클래스에 속성 한개이상 추가
  -  추가한 속성에 대한 인터페이스 작성 (3개만 작성했음)
- 자판기
  -  원하는 금액만큼 추가 기능
  -  음료 재고 추가
  -  현재 금액으로 살 수 있는 음료 목록 반환 기능
  -  음료수 구매 기능
  -  잔액 확인 기능
  -  종류별 재고(사전형태)로 반환 기능
  -  유통기한 지난 음료 목록 반환 기능
  -  뜨거운 음료수 목록 반환 기능
  -  음료 구매 이력 반환 기능
  -  각 메소드의 테스트 코드 및 통합 테스트 시나리오 작성

- 학습 키워드
  - 심플 팩토리, 팩토리 메소드 패턴, 추상 팩토리 패턴
  - Designated init, Convenience init
  - XCTest
  - Hashable 프로토콜, Equatable 프로토콜, 해시테이블, 해시충돌,
  - SRP: enum, if의 사용에 대한 고찰



#### 완료날짜: 2021년 3월 5일(금) 18: 35

# MVC 패턴

#### 요구사항

-  각 상품에 대한 재고 추가 버튼을 추가한다.
-  각 상품에 대한 이미지를 추가한다.
-  각 상품에 대한 재고 레이블을 추가한다.
-  1000원, 5000원 금액을 입력하는 버튼을 추가한다.
-  현재 잔액을 표시할 레이블을 추가한다.
-  각 상품의 재고 추가 버튼을 누르면 각 상품 재고를 추가하도록 코드를 구현한다.
-  재고 추가 버튼을 누르고 나면 전체 레이블을 다시 표시한다.
  > 해당 레이블의 text만 변경하도록 했다.
-  금액 입력 버튼을 누르면 해당 금액을 추가하도록 코드를 구현한다.
-  금액을 추가하고 나면 잔액 레이블을 다시 표시한다.

#### 학습

- required init
- Collection View
- Target - action
- xib

<img width="914" alt="스크린샷 2021-03-11 오후 3 22 48" src="https://user-images.githubusercontent.com/73683735/111288059-2e465400-8687-11eb-85a2-026bd0cfb406.png">



#### 완료날짜: 2021년 3월 15일(월) 18: 15


# 관찰자(Observer) 패턴

#### 요구사항

-  VendingMachine 변수를 ViewController에서 포함하지 않고 AppDelegate로 옮긴다.
-  AppDelegate에 선언한 변수를 ViewController에서 접근하기 위한 방법을 찾는다.
-  앱 종료(background) 시점 콜백 함수에서 VendingMachine 객체 인스턴스 속성을 저장한다.
-  앱 시작(activate) 시점 콜백 함수에서 기존에 저장된 값에서 불러와서 VendingMachine 객체 인스턴스를 생성한다.

#### 학습

- archive, unarchive
- appdelegate, scenedelegate
- xib

#### 초기 불리는 메소드 순서 

AppDelegate

sceneWillConnetct

viewDidLoad()

sceneWillEnterForeground

sceneDidBecomeActive



#### 완료날짜: 2021년 3월 18일(목) 23: 15

