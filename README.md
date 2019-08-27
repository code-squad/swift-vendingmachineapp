# 음료 자판기 앱

기존 커맨드라인 음료 자판기 모델을 재사용하여 제작하는 음료 자판기 아이패드 앱입니다.

## Step1 (2019-07-16)

ViewController에 모델을 연결함.

## Step2 (2019-08-03)

MVC 패턴을 적용하여 음료 재고 추가 및 잔액 추가를 구현함.

Collection View를 사용하여 음료 객체를 표시함.

![13-2](Screenshots/13-2.png)

## Step3 (2019-08-19)

Codable 프로토콜을 준수하도록 하여 객체를 UserDefaults에 저장하도록 함.
Codable을 준수하면 PropertyListEncoder/Decoder 및 JSONEncoder/Decoder 등에서 인코딩/디코딩을 할 수 있음.
```swift
// 인코딩 시 호출되는 메소드
func encode(to encoder: Encoder) throws

// 디코딩 시 호출되는 이니셜라이저
required init(from decoder: Decoder) throws
```

### Codable로 UIImage 저장하기
```swift
// 인코딩
func encode(to encoder: Encoder) throws {

    // CodingKeys로부터 컨테이너를 생성합니다.
    var container = encoder.container(keyedBy: CodingKeys.self)
    
    // photo 프로퍼티로부터 Data 유형의 객체를 생성합니다.
    let photoData = photo?.jpegData(compressionQuality: 1)
    
    // 적합한 CodingKey에 인코딩합니다.
    try container.encode(photoData, forKey: .photo)
}

// 디코딩
required init(from decoder: Decoder) throws {

    // CodingKeys로부터 컨테이너를 생성합니다.
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    // Data 유형의 객체를 적합한 CodingKey를 통해 디코딩하여 생성합니다.
    let photoData = try container.decode(Data.self, forKey: .photo)
    
    // Data 유형으로부터 UIImage를 초기화합니다.
    self.photo = UIImage(data: photoData)
}
```


### NSCoding 사용하기
클래스에 NSObject를 상속받고 NSCoding 프로토콜을 채택해야 한다. 그리고 두 개의 메소드를 구현해야 한다.
```swift
// 인코딩
encode(with coder: NSCoder)
// 디코딩
required init?(coder: NSCoder)
```
### 구현 방법
```swift
func encode(with coder: NSCoder) {
    coder.encode(myProperty, forKey: "myProperty")
}

required convenience init?(coder aDecoder: NSCoder) {
		// 필요하다면 as?를 사용하여 조건부 캐스트를 해줍니다.
    let myProperty = coder.decodeObject(forKey: "myProperty")
    // 지정 이니셜라이저를 호출하여 초기화를 마칩니다. 또는 직접 프로퍼티에 값을 넣어도 됩니다(convenience 키워드 필요 없음).
    self.init(myProperty: myProperty)
}
```

```swift
// UserDefaults에 저장하기
UserDefaults.standard.set(value, forKey: String)

// UserDefaults에서 로드하기
UserDefaults.standard.data(forKey: String)
// data의 경우 bool 및 interger 등 적합한 유형으로 변경하여 사용할 수 있음
```
`UserDefaults` - 사용자의 기본 정보 저장소입니다.
`.standard` - `UserDefaults`의 싱글톤 객체입니다.

## Step4 (2019-08-21)

자판기 인스턴스를 싱글톤 인스턴스로 만들어 사용함.

## Step5 (2019-08-27)

옵저버 패턴을 사용하여 뷰를 업데이트하도록 작성함.

### NotificationCenter를 사용하여 옵저버 패턴 적용하기

1. 알림을 식별하기 위한 `Notification.Name`을 등록합니다.
```swift
// Notification.Name에 익스텐션을 하여 정적 상수로 저장하게 되면 매개 변수에 넣을 때에 타입추론을 통해 `.`으로 접근할 수 있어 편리합니다.
extension Notification.Name {
    static let reloadCoinsDeposited = Notification.Name("reloadData")
}
```

2. 알림을 전송하기 위해 `post` 메소드를 호출합니다.
```swift
var data = 0 {
        didSet {
            NotificationCenter.default.post(name: .reloadData, object: nil, userInfo: ["data": data])
        }
    }
```
- `.default`: 앱의 기본 Notification Center입니다. 앱으로 전송된 모든 알림은 `default`에 게시됩니다.
- `.post(name:object:userInfo:)`: 이름, 발신자 및 정보를 가지고 알림을 생성하여 Notification Center로 전송합니다.
  - `name`: 알림의 이름입니다. (예시에선 익스텐션을 통해 만들어준 알림 이름을 사용함)
  - `object`: 알림을 전송하는 객체입니다.
  - `userInfo`: 선택적으로 전송할 수 있는 알림에 대한 정보입니다. (예시에선 `"data"` 문자열 키에 `data` 정수 값을 담아 보냄)

3. 알림을 받기 위해 `addObserver`를 사용하여 옵저버를 추가합니다.
```swift
// 예시에서는 ViewController.viewDidLoad 메소드 내부에 작성합니다.
NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: .reloadData, object: nil)
```
- `observer`: 옵저버를 등록할 객체입니다.  (예시에선 ViewController를 옵저버로 등록함)
- `selector`: 알림이 전송되었음을 옵저버에게 알리기 위해 메시지를 보내는 Selector입니다. `selector`로 지정된 메소드는 인자로 `Notification`를 전달받을 수 있어야 합니다.
- `name`: 어떤 알림을 받을 것인지에 대한 알림의 이름입니다. `name` 알림만 받게됩니다. 만약 `nil`을 전달하면, 알림 이름에 따른 수신 여부를 결정하지 않게 됩니다.
- `object`: 옵저버가 알림 수신을 허용할 객체입니다. `object`로부터만 알림을 받게 됩니다. 만약 `nil`을 전달하면, 전송자가 누구인지에 따라 알림 수신 여부를 결정하지 않게 됩니다.

#### `selector`로 전달할 메소드에서 메시지를 받아 사용하기

```swift
@objc private func reloadData(notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: Int] else {
            print("알 수 없는 메시지: \(notification.userInfo)")
            return
        }
        print(userInfo["data"]!)
    }
```

`notification` 인스턴스에서 `userInfo`에 접근하여 전달 받은 메시지를 사용할 수 있습니다. 이  예시에서는 위에서 전달한 `[String: Int]` 자료형으로 다운캐스트 후에 적합한 키로 접근하여 사용하였습니다.