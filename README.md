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