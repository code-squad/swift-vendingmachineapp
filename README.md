# VendingMachineApp step1

>  시작하기 - 아이패드 앱

레벨2 VendingMachine 미션의 Main, InputView, OutputView를 제외하고 전체 클래스를 프로젝트로 복사한다.<br  />
기존 코드들은 MVC 중에서 대부분 Model의 역할을 담당한다.<br  />
iOS 앱 구조는 MVC 중에서도 우선 ViewController-Model 사이 관계에 집중하고, ViewController-View 관계는 다음 단계에서 개선한다.<br  />

---

- ***코드 작성***
```swift
var vendingMachine = VendingMachine()

override func viewDidLoad() {
    super.viewDidLoad()
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyyMMdd"

    let strawberryMilk: Beverage = StrawberryMilk(brand: "서울우유", weight: 200, price: 1000,
    name: "딸기우유", manufactureDate: formatter.date(from: "20171009") ?? Date(),
    strawberrySyrup: 5)
    let bananaMilk: Beverage = BananaMilk(brand: "서울우유", weight: 200, price: 1000, name: "바나나우유",
    manufactureDate: formatter.date(from: "20171012") ?? Date(), bananaSyrup: 3)
    let coke: Beverage = Coke(brand: "팹시", weight: 350, price: 2000, name: "팹시콜라",
    manufactureDate: formatter.date(from: "20171005") ?? Date(), calorie: 25)

    vendingMachine.addInInventory(beverageName: strawberryMilk, number: 2)
    vendingMachine.addInInventory(beverageName: bananaMilk, number: 1)
    vendingMachine.addInInventory(beverageName: coke, number: 3)

    for menu in vendingMachine.showEntireInventory() {
        let beverage = menu.value
        guard let beverageName = beverage.first?.name else {
            return
        }
        print("\(beverageName)(\(beverage.count)개)", terminator: " ")
    }
}
```

- ***콘솔 화면***
<img src="/img/FirstConsole.png" width="80%" height="50%">
<img src="/img/SecondConsole.png" width="80%" height="50%">


- ***실행 화면***

<img src="/img/FirstViewScreen.png" width="30%" height="40%">   <img src="/img/SecondViewScreen.png" width="30%" height="40%">


###  # 애플 UIKit View Management 클래스 중에서 UITabBarController 와 UITabBar에 대해 학습한다.

1. ***UITabBarController***
: 탭바를 누를 때 어떤 화면을 보여줄지 결정 하는 Controller

Main.storyboard를 클릭하면 다음과 같은 화면이 뜬다.

<img src="/img/TabBarController.png" width="50%" height="50%" float="right">

탭바 버튼 선택에 FirstView를 보여줄지, SecondView를 보여줄지를 Controller에서 뻗어나가는 화살표로 이미지화 시켜서 보여주고 있다.
Main.storyboard 오른쪽 마우스클릭 후 Open As > Source Code를 클릭하면 소스코드로도 볼 수 있는데,

```swift
<tabBarController id="49e-Tb-3d3" sceneMemberID="viewController">
<tabBar key="tabBar" contentMode="scaleToFill" id="W28-zg-YXA">
<rect key="frame" x="0.0" y="975" width="768" height="49"/>
<autoresizingMask key="autoresizingMask" widthSizable="YES" flexibleMinY="YES"/>
<color key="backgroundColor" red="0.0" green="0.0" blue="0.0" alpha="0.0" colorSpace="custom" customColorSpace="sRGB"/>
</tabBar>
<connections>
<segue destination="9pv-A4-QxB" kind="relationship" relationship="viewControllers" id="u7Y-xg-7CH"/>
<segue destination="8rJ-Kc-sve" kind="relationship" relationship="viewControllers" id="lzU-1b-eKA"/>
</connections>
</tabBarController>
```

firstView의 ID는 `9pv-A4-QxB`로, SecondView의 ID는  `8rJ-Kc-sve`로 각각 버튼을 누르면 연결할 수 있도록 설정되었다.


2. ***UITabBar***
: 탭 바에 하나 이상의 버튼을 표시하는 Controller

```swift
<tabBar key="tabBar" contentMode="scaleToFill" id="W28-zg-YXA">
<rect key="frame" x="0.0" y="975" width="768" height="49"/>
<autoresizingMask key="autoresizingMask" widthSizable="YES" flexibleMinY="YES"/>
<color key="backgroundColor" red="0.0" green="0.0" blue="0.0" alpha="0.0" colorSpace="custom" customColorSpace="sRGB"/>
</tabBar>
```
Background, Shadow, Selection, Image Tint, Style, Bar Tint, Item Positioning를 설정할 수 있다.

---


