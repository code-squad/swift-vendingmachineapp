## Codable과 NSCoding을 아카이빙하는 방법의 차이
### NSCoding 채택 클래스 객체를 아카이빙

> *NSCoding provides intelligent serialization of complex object graphs and works with your own types, but works with a poorly documented serialization format not suitable for cross-platform work, and requires writing code to manually encode and decode your types.*

- NSCoder는 encodeObject(forKey:) 등 여러 메소드를 직접 호출한다.
- NSCoding은 복잡한 객체그래프를 직렬화해주지만, **크로스 플랫폼 작업에 적합하지 않은 문서화된 직렬화 형식**으로 작동하며 암호화하기 위해 암호화 코드가 필요하다.
- NSPropertyListSerialization와 NSJSONSerialization는 표준 코코아 타입과 plist,JSON 간 변환을 가능하게 해준다.
<br/>

### Codable 채택 클래스 객체를 아카이빙
>- *Make your data types encodable and decodable for compatibility with external representations such as JSON.*
>- *A Structure or a Class can be encoded using both the PropertyListEncoder and JSONEncoder classes, even though the structure or class itself contains no code to specifically handle property lists or JSON.*

- 기존의 NSCoder와 달리 swift api는 더 간접적인데, Encoder가 직접 메소드를 가지지 않고, 인코딩 메소드가 포함돼 있는 container를 제공한다. 
- 키가 있는 인코딩(keyed encoding), 키 없는 인코딩(unkeyed encoding), 단일 값 코딩(encoding a single value)을 지원한다.
- 이런 간접적인 방식이 portable한 직렬화 포맷에 더 적합하다. NSCoder는 애플의 인코딩 포맷으로만 처리됐지만, Encoder(PropertyListEncoder, JSONEncoder)는 JSON과 같은 외부 포맷으로도 처리된다. 예를 들어, 키 있는 인코딩 시에는 JSON 딕셔너리를 제공하고, 키 없는 인코딩 시에는 JSON 배열을 제공한다. 객체가 비어있는 경우, NSCoder는 어떤 값을 제공해야 할 지 모르지만, Encoder는 컨테이너를 요구한다.

**[참고: Apple Developer Documentation - Codable](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)**

**[참고: mikeash.com](https://www.mikeash.com/pyblog/friday-qa-2017-07-14-swiftcodable.html)**

### 정리
NSCoding 채택 클래스를 아카이빙하는 NSCoder는 크로스 플랫폼 지원이 따로 안 되지만, Codable 채택 클래스는 Encoder를 통해 외부 포맷으로 직렬화될 수 있다.