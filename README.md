## Step1

## Step2

2020/Feb/25

#### ObjectIdentifier

```swift
private(set) var stockOf: [ObjectIdentifier: Beverages] = [:]
```

ObjectIdentifier를 사용하면 세분화 되어져 만들어진 Class를 활용하여 충분히 분류작업을 처리할 수 있다.

#### DateFormatter

```swift
extension Date {
    func dateFormatString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}
```

extension을 활용한 기능 확장

## Step3

2020/March/01

#### IBOutletCollection

```swift
private func setupUI() {
    beverageImageViews.forEach {
        $0.layer.cornerRadius = 16
    }
}
```

#### UIButton과 UILabel의 tag 활용

```swift
@IBAction func putMoneyTouched(_ sender: Any) {
    let button = sender as! UIButton
    vendingMachine.putMoney(Money(button.tag))
}
```

<br>


#### Notification Obsever 사용하여 변경된 Model 값을 View에 반영

> NotificationCenter - addObserver

```swift
NotificationCenter.default.addObserver(self, selector: #selector(updateBalanceLabel(_:)), name: NSNotification.Name(rawValue: "BalanceChange"), object: nil)
```

Notification에 대한 observer를 viewcontroller에 추가한다.

> View - action

재고 추가 버튼과 잔액 추가 버튼을 누르면 model 값이 변경되도록 `@IBAction`을 통해 구현

<br>

> Model - didSet

```swift
didSet {
	  postNotification()
}

func postNotification() {
		NotificationCenter.default.post(name: NSNotification.Name(rawValue: "BalanceChange"), object: nil, userInfo: ["balance": balance])
}
```

model이 변경될 때마다 Notification을 날려주기 위해서 didSet에 post 메소드를 호출 하도록 구현한다. post 메소드에 인자인`userInfo`로 변경된 데이터를 전달한다.

<br>

<img src="https://github.com/corykim0829/swift-vendingmachineapp/blob/corykim0829/Screenshots/step3.png?raw=true" width="560px">

