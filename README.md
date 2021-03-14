# [okstring / Isaac] Step5 - Observer 활용



![description](https://user-images.githubusercontent.com/62657991/111068531-7725cd80-850c-11eb-9157-210d4efc8704.png)

### 스텝별 작업 목록 (체크박스 형태로 하려고 한 작업 목록 + 완료한 항목만 체크)

 - [x] ViewController는 viewDidLoad에서 Observe를 등록한다.

 - [x] 음식 재고가 바뀌는 Notification을 받으면 화면에 Label을 업데이트한다.

 - [x] 추가 버튼을 누르면 해당 음식 재고를 모델에 추가할 때마다

 - [x] VendingMachine 모델 객체에서는 변화에 대해 NotificationCenter에 post한다.

 - [x] 모든 동작은 이전 단계와 동일하게 동작해야 한다.

### 학습 키워드 : 이번 스텝을 하면서 학습한 내용에 대한 키워드

- `NSObject`
- `higher-order function`
- `NotificationCenter`
- `AppDelegate`
- `SceneDelegate`

### 고민과 해결

- archivedData가 제대로 동작하지 않고 error를 출력해서 이유를 찾아봤습니다. Github 이전 버전으로 돌아가 어느 시점에 저장이 됐었다가 안됐었는지 확인을 했고 enum에서 제대로 저장이 안됐음을 확인했습니다. 버전을 다시 돌아가서 확인을 한 경험이 commit을 더욱 명확하고 작게 나눠야 겠다는 것을 다시 한번 배웠습니다.

### 질문거리

- `UInt`, `enum` 을 encode, decode하려다가 막혀서 enum은 string으로 UInt는 Int로 저장을 했는데 그러면 UInt의 경우 Int 범위에 들어가지 않는 숫자들은 제대로 저장이 되지 않을 것 같아 맞지 않는다는 생각이 계속해서 들었지만 해답을 찾지 못했습니다. UInt를 타입 그대로 아카이빙하는 것이 가능한 방법일까요?

