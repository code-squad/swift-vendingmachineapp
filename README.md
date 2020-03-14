<details>
<summary>step 3 : MVC 패턴</summary>
<div markdown="1">

### 초기 화면

<img width="500" alt="image" src="https://user-images.githubusercontent.com/37682858/76142979-33f17d00-60b6-11ea-83b9-14b1a1314b81.png">

### 초코우유 추가 버튼 누른 후

<img width="500" alt="image" src="https://user-images.githubusercontent.com/37682858/76142981-394ec780-60b6-11ea-813d-7d12096143fb.png">

### 잔액 + 5000 누른 후

<img width="500" alt="image" src="https://user-images.githubusercontent.com/37682858/76142983-3c49b800-60b6-11ea-9348-d0ed4fce14ca.png">

</div>
</details>



<details>
<summary>step 4 : 앱 생명주기와 객체 저장</summary>
<div markdown="1">

### 음료 개수 및 잔액 변경

<img width="500" alt="image" src="https://user-images.githubusercontent.com/37682858/76678903-335d6700-661f-11ea-9df3-ba77c07f94ed.png">

### 앱을 다시 실행해도 이전 값 남아있음

<img width="500" alt="image" src="https://user-images.githubusercontent.com/37682858/76678907-3c4e3880-661f-11ea-9fd8-f72528759857.png">



Archving

```swift
func archive(with things: VendingMachine) -> Data {
  do {
    let archived = try NSKeyedArchiver.archivedData(withRootObject: things,
                                                    requiringSecureCoding: false)
    return archived
  } catch {
    print(error)
  }
  return Data()
}
```



UnArchving

```swift
func unarchive(with text: Data) -> VendingMachine? {
  do {
    let object = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(text)
    return object as? VendingMachine
  } catch {
    print(error)
  }
  return nil
}
```

위 두 메소드를 각각 scene이 inActive가 되는 시점,  scene이 연결되기 전에 호출하여 데이터를 저장 및 불러옴. 이 데이터는 UserDefault에 저장됨.



``` swift
if let data: Data = UserDefaults.standard.object(forKey: "model") as? Data {
  /// code
}
```

위 코드를 통해 UserDefault에 "model"이라는 키값으로 저장되어 있던 data를 불러옴



```swift
UserDefaults.standard.set(archive(with: vendingMachine), forKey: "model")
```

위 코드를 통해 VendingMachine 객체를 "model" 이라는 키값으로 UserDefault에 저장함 



또한 swift에서 지원하는 enum은 objective-C와 호환이 되지않기 때문에 enum type 대신 rawValue를 저장하고, rawValue로 매핑하여 값을 불러옴.

</div>
</details>

