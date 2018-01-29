## Gesture Recognizer
- gesture recognizer는 target-action 패턴으로 노티를 보냄
- gesture recognizer가 뷰에 발생한 이벤트를 감지하면, 뷰의 뷰 컨트롤러 액션메소드를 호출한다. 
- gesture recognizer는 불연속적인 타입과 연속적인 타입으로 나뉜다.
    - **불연속 타입**: 제스처가 인식되면 바로 액션 메소드를 호출한다.
        - **UITabGestureRecognizer**
    - **연속 타입**: 액션 메소드를 여러 번 호출하는데, 이벤트 정보가 바뀔 때마다 알려준다. 예를 들어, UIPanGestureRecognizer 객체는 터치 위치가 변경될 때마다 액션메소드를 호출한다.
        - **UILongPressGestureRecognizer**
        - **UIPanGestureRecognizer**

- gesture recognizer 설정하기
    - 스토리보드: 뷰 위에 gesture recognizer를 드래그 후, 액션 메소드를 구현하고, 액션메소드와 gesture recognizer를 연결
    - 코드: gesture recognizer 객체 생성 시 타깃(보통 self)과 액션 메소드 설정. 또는 객체만 생성 후 addTarget()으로 설정 가능

- 제스처에 응답하기
    - 불연속 타입: 버튼의 액션메소드와 비슷하게 동작한다.
    - 연속 타입: 제스처를 인식하기 전에 이벤트를 추적할 수 있다. 추적 이벤트를 통해 좀 더 인터랙티브한 환경을 생성할 수 있다. 예를 들어, 컨텐츠 위치를 변경하기 위해 UIPanGestureRecognizer 객체로부터 업데이트를 할 수 있다.

- **state** 프로퍼티: 연속 타입의 제스처인 경우, gesture recognizer는 이 프로퍼티의 값을 갱신한다.(began>changed>ended, cancelled) 액션메소드들은 이 프로퍼티를 통해 적합한 액션을 결정한다. 예를 들어, began, changed 상태를 통해 콘텐츠에 일시적인 변화를 줄 수 있고, ended 상태를 통해 변화를 영구적으로 만들 수 있고, cancelled 상태를 통해 이제까지 변경된 것들을 버릴 수 있다. 액션을 취하기 전에 항상 이 프로퍼티를 확인한다.

[참고: Apple Developer Document - Handling UIKit Gestures](https://developer.apple.com/documentation/uikit/touches_presses_and_gestures/handling_uikit_gestures)
