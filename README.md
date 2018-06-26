# 음료 자판기 앱

## Step. 1

* 주요 쟉업 내용
	- 기존 자판기 코드의 Model 역할 가져와서 활용하기 (전부 가져오지 않고 필요한 부분을 점진적으로 가져와서 개선할 예정)
	- 각 객체의 역할
		- VendingMachine: 자판기 객체
		- StockManager: 자판기에서 재고를 관리하는 객체
		- Stock: 같은 종류의 음료객체를 가진 배열을 추상화하기 위한 객체. StockManager가 가지고 있음.
		- MoneyManager: 자판기에서 잔액을 관리하는 객체
		- BeverageFactory: 입력받은 타입을 통해 타입에 맞는 음료수를 생성해주는 팩토리객체
		- DefaultData: 각 음료수가 default값으로 초기화 되어 생성될 때에 default값을 가지고 있는 객체
		- 그 외에 Beverage객체들...(타입과 이름과 가격을 가지고 있음)

* [앱프로그래밍 가이드 - 앱 라이프 사이클](https://developer.apple.com/library/archive/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/TheAppLifeCycle/TheAppLifeCycle.html#//apple_ref/doc/uid/TP40007072-CH2-SW1)
* [앱의 초기화 UIApplicationMain()함수](docs/앱의초기화(main).md)

## Step. 2
* 요구사항
	- 각 상품에 대한 재고 추가 버튼을 추가한다.
	- 각 상품에 대한 이미지를 추가한다.
	- 각 상품에 대한 재고 레이블을 추가한다.
	- 1000원, 5000원 금액을 입력하는 버튼을 추가한다.
	- 현재 잔액을 표시할 레이블을 추가한다.
	- 각 상품의 재고 추가 버튼을 누르면 각 상품 재고를 추가하도록 코드를 구현한다.
	- 재고 추가 버튼을 누르고 나면 전체 레이블을 다시 표시한다.
	- 금액 입력 버튼을 누르면 해당 금액을 추가하도록 코드를 구현한다.
	- 금액을 추가하고 나면 잔액 레이블을 다시 표시한다.
* 구현화면

![demo_step2](demo_step2.gif)

* 학습꺼리
	- IBOutlet Collection 기능에 대해 학습하고 중복되는 아웃렛을 제거한다.
		- 같은 속성의 뷰에 대해서 모아놓은 Outlet.
		- ex) 여러 개의 UIButton을 [UIButton]의 하나의 IBOutlet Collection으로 사용가능
		- StackView와의 차이점 : StackView는 Layout에 활용에 더 적합하다.
	- UIImageView 에서 이미지를 표시할 때 사각형 코너를 둥글게하도록 변경해본다.
		- `View.layer.cornerRadius`로 조절
* 문서정리
	- [MVC에 대한 간단한 정리](docs/MVC간단한개념.md)
	- [clipsToBoduns,maskToBounds](docs/clipsToBounds_maskToBounds.md)