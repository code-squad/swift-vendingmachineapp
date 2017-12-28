# 음료 자판기 앱 Step1
## 프로그래밍 요구사항
* 레벨2 VendingMachine 미션의 Main, InputView, OutputView를 제외하고 전체 클래스를 프로젝트로 복사한다.
> 복사할때 폴더보다는 옵션에서 **그룹**으로 해야 우리가 알고 있던 방식으로 폴더가 된다.

* 기존 코드들은 MVC 중에서 대부분 Model의 역할을 담당한다.

* iOS 앱 구조는 MVC 중에서도 우선 ViewController-Model 사이 관계에 집중하고, ViewController-View 관계는 다음 단계에서 개선한다.
![MVC](./ScreenShot/vendingapp-MVC.png)

* ViewController 클래스에 VendingMachine 객체를 변수로 추가하고 viewDidLoad() 함수에서 음료수 객체 3종류를 추가하고 재고 목록을 print() 한다.
```
[StarBucksCoffee: 1, LightBananaMilk: 1, Coke: 2]
```

# MVC 패턴 Step2
## 프로그래밍 요구사항
* 각 상품의 재고 추가 버튼을 누르면 각 상품 재고를 추가하도록 코드를 구현한다.
* 재고 추가 버튼을 누르고 나면 전체 레이블을 다시 표시한다.
* 금액 입력 버튼을 누르면 해당 금액을 추가하도록 코드를 구현한다.
* 금액을 추가하고 나면 잔액 레이블을 다시 표시한다.
![step2](./ScreenShot/vendingapp-step2.png)
