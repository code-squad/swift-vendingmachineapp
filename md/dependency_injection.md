## 의존성 주입(Dependency Injection, DI)
객체를 내부에서 생성하는 대신 외부에서 주입하는 개념

### 내부에서 RealService를 생성하는 경우:

```swift
protocol Service {}
class RealService: Service {}

class Client {
	let service: Service
	init() {
		service = RealService()
	}
}
```

### 외부에서 주입받는 경우:

```swift
protocol Service {}
class RealService: Service {}

class Client {
	let service: Service
	init(service: Service) {
		self.service = service
	}
}
```

- 프로토콜 타입으로 의존성을 주입하게 만들면 프로토콜을 채택한 모든 객체를 테스트할 수 있다. (특히, 싱글톤 패턴 테스트 시 mock 객체 작성에 필요)

- 생성자 기반 의존성 주입
    - 의존성 주입의 종류: **setter-, interface-, constructor-based**
    - 이 중 생성자 기반(constructor-based)이 제일 많이 쓰임

- ViewController에서의 DI
    - ViewController를 테스트하려면 외부에서 의존성 주입을 하는 구조가 좋다. 또, 싱글톤인 경우, 객체가 프로토콜 타입으로 선언되어 있어 해당 프로토콜을 채택한 객체는 모두 테스트할 수 있도록 하는 게 바람직하다.
    - 단, IB를 사용하는 경우엔 ViewController에 제네릭 프로토콜을 사용하면 안 된다.