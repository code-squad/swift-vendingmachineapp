# 자판기 앱



## 1. 아이패드 앱

#### 음료 클래스 및 자판기 객체 만들기

- 2021.03.02.화 시작

-----

- 객체지향 학습
  - struct 와 class 차이 : 언제 쓰면 좋은지
    - 클래스가 힙 영역을 차지해서 부담스럽고, 구조체는 스택을 차지해서 값이 자주 바뀌지 않는 경우 구조체를 쓰는 것을 권장한다고 들었다.
    - 다만, 구조체 안에 String 이나 클래스가 사용된다면, 그 안에서 참조가 일어나고 오히려 클래스보다 더 복잡해져서, 이 경우는 클래스를 쓰는 것이 더 좋다고 한다.
  - TDD 개발 방법을 사용하면, 함수 기능 구분을 더 신경 쓰게 되어 객체지향적으로 코드를 작성하기 수월해진다고 한다
  - `convenience init()` 사용
    - 지정 생성자를 사용하여 더 편리하게 추가로 생성자를 활용해 봄
- CustomStringConvertible 프로토콜 학습
  - 프로토콜도 함께 학습했지만, 직접 코드를 작성해야 와닿을 것 같다
- VendingMachine 객체 ViewController 에 추가하기
  - ViewController 클래스에 속성으로서 추가하려고 하니, 생성자가 필요했다
  - 그러자 `required init?(coder: NSCoder)` 을 쓰라는 에러가 떴다 (이유는 모름..)
- `DateFormatter()` 학습
  - Date → String
  - String → Date



#### 구현

Beverage → Milk/Soda/Coffee → Strawberry/Fanta/Cantata

- 3단계 상속 관계 클래스 생성
- `CustomStringConvertible` 로 출력 형식 지정
- `DateFormatter` 로 날짜 출력형식 지정



<img width="407" alt="스크린샷 2021-03-02 오후 10 20 03" src="https://user-images.githubusercontent.com/73650994/109655057-3215a900-7ba6-11eb-86ff-f87e54c69111.png">



## 2. 자판기 기본 동작

#### 음료 클래스 3단계 구분하기 & 자판기 동작 설계

- 2021.03.06. step2

-----

- 3 단계 상속 관계 클래스에 각각 메소드 작성
- 테스트 코드 작성
- `init()` 관해 학습
  - `convenient init()`

- 자판기 클래스 작성
  - `Hashable` 
  - `Equatable`
  - `ObjectIdentifier`
  - MetaType



## 3. MVC 패턴

#### 음료수 자판기 앱

- 2021.03.07. step3

-----

- AutoLayout 적용
- subView 로 view 계층 관계 학습
- AutoResizing 적용
- IBOutletCollection 사용
- `required init()`

![buttonTouched](https://user-images.githubusercontent.com/73650994/110742475-c6a09b00-8279-11eb-9392-a3cbee66fd2f.gif)

