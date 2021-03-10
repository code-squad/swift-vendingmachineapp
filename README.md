# [okstring / Isaac] Step4 - 아카이브 이해 및 구현



![스크린샷 2021-03-10 오후 5 10 19](https://user-images.githubusercontent.com/62657991/110597177-8e3e8580-81c3-11eb-93a9-c6747aa9406d.png)

### 스텝별 작업 목록

- [x] VendingMachine 변수를 ViewController에서 포함하지 않고 AppDelegate로 옮긴다.
- [x] AppDelegate에 선언한 변수를 ViewController에서 접근하기 위한 방법을 찾는다.
- [x] 앱 종료(background) 시점 콜백 함수에서 VendingMachine 객체 인스턴스 속성을 저장한다.
- [x] 저장할 때는 VendingMachine을 아카이브해서 하나의 데이터 값으로 변형한다.
- [x] 값을 저장하고 복원하는 데에는 UserDefault 라는 파운데이션 라이브러리를 사용한다.
- [x] 앱 시작(activate) 시점 콜백 함수에서 기존에 저장된 값에서 불러와서 VendingMachine 객체 인스턴스를 생성한다.
  - activate라는 시점을 제가 잘 이해한건지 모르겠습니다.
- [x] 복원할 때는 저장된 데이터 값을 언아카이브해서 VendingMachine 객체를 생성한다.



### 학습 키워드

- `NSObject`
- `NSCoding`
- `AppDelegate`
- `SceneDelegate`
- `UserDefaults`



### 고민과 해결

- 데이터를 저장하고 불러오는게 아무래도 생소해서 어려웠습니다. 처음에는 저장을 한다면 저장되는 파일이 있다고 생각을 하고 무작정 `FileManager`와 함께 접근하는 것들을 찾아봤는데 나중에서야 요구사항에서 `UserDefault`를 사용하라고 하신 것을 보고 꽤나 먼 길을 돌아갔다는걸 알았습니다. 해답은 문제에도 있는 것 같습니다.
- `VendingMachine`과 `Factory` 역할을 구분지어 구현했습니다. 리뷰주신 만능 VendingMachine의 모습을 피하고자 Factory에서 해결하도록 해당 로직을 Factory 안에서 하도록 수정했습니다.
- Factory 안에서 다형성을 지키도록 수정했습니다. 메소드를 사용해 Factory 내에서 다형성을 지켜보려 했지만 방법이 마땅히 떠오르지 않아 init으로 구현했는데 다형성 적용이 잘 된건지 궁금합니다.
- 각각의 버튼과 해당하는 타입의 매칭을 고민했습니다.  처음에는 Accessibility Identifier를 활용해서 매칭을 시켰지만 tag 방법과 큰 차이가 없다고 생각이 들어 선회했습니다. `Dictionary` 형식으로 저장, 매칭을 시켰는데 맞는지 확신이 들지는 않습니다.



