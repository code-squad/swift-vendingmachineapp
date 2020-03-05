# Swift Vending Machine App



## Step 1. 음료 클래스 설계

2020.02.29 Sat

- 상위 클래스 Beverage와 이를 상속받은 Milk, Soda, Coffee 클래스 구현
- VendingMachine 클래스에서 현재 보유한 음료 목록 출력 



### 실행 화면

<img src="https://user-images.githubusercontent.com/40784518/75602870-81954500-5b0c-11ea-84c1-819746c989a5.png " width="50%"></img>



## Step 2. 자판기 기본 동작

2020.03.05 Thur

- Milk, Soda, Coffee 각각의 세분화된 클래스 구현 (Coke, StarbucksCoffe, BananaMilk...)
- `Beverages` 클래스를 만들어 `Beverage` 추가, 삭제 기능 및 순회하고 각 종류당 수량 조회 기능 구현
- `VendingMachine` 에 기능 추가
  - 자판기 금액을 원하는 금액만큼 올리는 메소드
  - 특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
  - 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
  - 음료수를 구매하는 메소드
  - 잔액을 확인하는 메소드
  - 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
  - 유통기한이 지난 재고만 리턴하는 메소드
  - 따뜻한 음료만 리턴하는 메소드
  - 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
- `Beverage`, `Beverages`, `VendingMachine`에 대한 테스트 케이스 추가 