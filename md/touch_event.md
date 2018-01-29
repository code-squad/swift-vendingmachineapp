## 터치 이벤트
- UIKit은 어디에서 터치 이벤트가 발생했는지 알기 위해 view 기반의 hit-testing을 사용한다.
- 터치가 눌리면 UIView의 **hitTest()** 메소드는 뷰 계층에서 touch를 포함한 **가장 깊은 서브 뷰**를 찾는다. 그렇게 찾은 뷰가 **first responder**가 된다.
- UIKit은 **터치이벤트와 뷰를 영구적으로 연결**한다.(바꿀 수 없다.)
- UIKit은 처음 터치가 발생하면 각 **UITouch 객체**를 만들고, 터치가 끝났을 때만 터치 객체를 내보낸다. 
- 터치 위치가 변경되거나 다른 파라미터값이 변경되면 UITouch 객체는 새 값으로 갱신된다. 
- **변하지 않는 값**은 UITouch 객체를 포함하는 **view 프로퍼티 뿐**이다. 터치 위치가 뷰의 바깥으로 벗어나도 변하지 않는다.

> 만약 터치 위치가 view bounds의 밖에 있는 경우, hitTest() 메소드는 해당 뷰와 모든 서브뷰를 무시한다. 결과적으로, 뷰의 clipsToBounds 프로퍼티가 false 인 경우, view bounds 밖에 있는 모든 서브 뷰들은 터치를 포함하고 있어도 반응하지 않는다.

* 수행과정
- 터치가 눌리면, **hitTest()**가 hit-test 뷰를 찾음.
    1. UIApplication/UIWindow의 **sendEvent()** 실행하여 이벤트 전달
    2. hit-test 뷰가 이벤트 받음. 영구히 연결됨. **UITouch** 객체를 만듦.
    3. **touchesBegan()** 메서드 수행
- 터치가 움직이면
    - 1~2번 실행 후, **touchesMoved()** 메서드 수행
    - 터치위치 등에 변경이 발생하면 UITouch 객체는 새 값으로 갱신됨.
- 터치가 떨어지면
    - 1~2번 실행 후, **touchesEnded()** 메서드 수행
- 터치가 취소되면
    - 1~2번 실행 후, **touchesCancelled()** 메서드 수행
- 즉, 터치가 시작할 때 hit-test 뷰를 찾고, hit-test 뷰가 모든 메서드를 받는다.

## UIEvent 객체와 UITouch 객체의 관계
- UIEvent 객체가 UITouch 객체들을 포함. 즉, UIEvent 객체를 통해 UITouch 객체에 접근 가능. (이미지 삽입)
- **UIEvent**: 
    - touch, motion, remote-control, press 이벤트들이 있다.
    - 터치 이벤트 객체는 **한 개 이상의 UITouch 객체를 포함**한다.
    - 멀티터치 발생 시, UIKit은 같은 UIEvent 객체를 재사용한다. 
    - UIEvent 객체는 **터치 정보를 제공**
        - **allTouches**: 이벤트와 관련된 모든 터치 정보
        - **touchesForView**: 특정 뷰와 관련된 모든 터치 정보
- UITouch:
    - UITouch 객체가 제공하는 정보:
        - **터치 발생 view** 또는 window
        - **터치 발생 위치**
        - 대략적인 **터치 반경(radius)**
        - 발생한 **터치의 압력정도(force)** (3D 터치나 Apple Pencil 지원하는 기기 위함)
        - 터치 **발생 시간(timestamp)**
        - **유저가 탭한 횟수**
        - **터치 종류(phase)**: began, moved, ended, cancelled 등
        - 터치가 포함하는 **gesture recognizers 정보**
    - UITouch 객체는 멀티터치가 발생해도 지속됨

[참고: Apple Developers Document - UIEvent](https://developer.apple.com/documentation/uikit/uievent)
[참고: Apple Developers Document - UITouch](https://developer.apple.com/documentation/uikit/uitouch)
