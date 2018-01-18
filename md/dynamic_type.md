## Dynamic Type
### 메타타입
- String.Type처럼 **타입자체를 나타냄**
- 타입 자체를 비교할 경우 필요하다.
- 이런 타입 자체를 값으로 사용 가능 ex) **let SType: String.Type = String.self**
- 이름이 Dynamic Type인 이유는, **인스턴스의 경우 프로토콜 타입을 쓸 수도 있으므로 여러 타입으로 이뤄질 수 있기 때문**이다.
- Any Type은 사실상 아무 타입과 매칭되지 않으므로 쓰지 않는 편이 좋다.

### ObjectIdentifier
- **클래스**와 관련있다.
- **AnyClass는 AnyObject의 메타타입**으로, 즉 모든 클래스들의 메타타입이다.
- 클래스만 AnyObject 타입으로 만들 수 있다.
- **Metatype : Type : Value**
- 위의 관계에서, Metatype과 Type을 비교할 때 **일반적인 타입은 Any.Type**이고 **클래스인 경우엔 AnyClass**를 사용
- **ObjectIdentifier를 거치면 메타타입이 된다**. 즉, **ObjectIdentifier(값)을 넣으면 “타입” 이 나오고, ObjectIdentifier(타입)이 나오면 “메타타입”이 나온다**.
- ObjectIdentifier는 **Hashable을 채택**한 타입이다. 
- 클래스 자체 타입을 딕셔너리 키로 사용하고 싶으면 ObjectIdentifier 타입을 키 타입으로 넣으면 된다. ex) **[ObjectIdentifier:Int]**

```swift
var v1 = VendingMachine()
var v2 = VendingMachine()
```

일 때,

```swift
var type1 = ObjectIdentifier(v1)
var type2 = ObjectIdentifier(v2)
```

위 둘은 서로 다른 객체이기 때문에 다르지만,

```swift
var type1 = ObjectIdentifier(type(of: v1))
var type2 = ObjectIdentifier(type(of: v2))
```

위 둘은 VendingMachine으로 같다.