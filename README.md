# 자판기 앱

1. <a href="#1-시작하기---아이패드-앱">시작하기 - 아이패드 앱</a>

<br>

## 1. 시작하기 - 아이패드앱

### 추가내용

- Single View App 템플릿의 VendingMachineApp 프로젝트를 생성했습니다.

- 이전 <a href="https://github.com/popsmile/swift-vendingmachine/tree/popsmile">VendingMachine</a> 프로젝트 에서 View에 관련된 `InputView` 와 `OutputView`  그리고 `Main` 파일을 제외한 나머지 전체 소스파일을 해당 프로젝트로 복사했습니다. 복사한 파일의 코드는 대부분 MVC 중에서 Model의 역할을 담당합니다.
- `ViewController` 클래스에 `VendingMachine` 객체를 변수로 추가하고, `viewDidLoad()`  에서 음료 추가 및 재고 목록을 `print()` 했습니다.

### 실행결과

```swift
✅ 언니몰래먹는딸기우유(2개)
✅ 스프라이트(3개)
✅ 칸타타 더치블랙(2개)
```

