# 음료 자판기 앱



## step1

ViewController 클래스에 VendingMachine 객체를 변수로 추가하고 viewDidLoad() 함수에서 음료수 객체 3종류를 추가하고 재고 목록을 print() 한다.

* Device Orientation

  Home Button의 위치로 구분한다!

![스크린샷 2021-02-24 오후 5.36.26](/Users/kimjisun/Library/Application Support/typora-user-images/스크린샷 2021-02-24 오후 5.36.26.png)

[`case portrait`](https://developer.apple.com/documentation/uikit/uideviceorientation/portrait)

The device is in portrait mode, with the device held upright and the **Home button at the bottom.**

홈버튼이 아래쪽으로 고정되어있는 모드

[`case portraitUpsideDown`](https://developer.apple.com/documentation/uikit/uideviceorientation/portraitupsidedown) (<-> case portrait)

The device is in portrait mode but upside down, with the device held upright and the **Home button at the top.**

[`case landscapeLeft`](https://developer.apple.com/documentation/uikit/uideviceorientation/landscapeleft)

The device is in landscape mode, with the device held upright and the **Home button on the right side.**

[`case landscapeRight`](https://developer.apple.com/documentation/uikit/uideviceorientation/landscaperight)

The device is in landscape mode, with the device held upright and the **Home button on the left side.**



* [Date 타입](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/DataFormatting/Articles/dfDateFormatting10_4.html#//apple_ref/doc/uid/TP40002369-SW1)

  * Date

  * DateFormatter: Date타입과 문자열을 양방향으로 변환

    ( Formatter: 특정한 타입의 값과 문자열을 양방향으로 변환하는 도구) 

    

  * Calendar: 달력과 관련된 정보를 담는 구조체

  * DateComponent: 각 달력의 요소 (ex. day, month)

* extension

  * 상수인 저장프로퍼티를 추가할 수는 없다 -> 타입 전체에 적용하기 위해 타입 프로퍼티를 선언해야한다
  * 연산 프로퍼티를 추가할 수 있다

## 고민

* 상속과 확장을 비교해보면, 확장이 응집도를 높이고 결합성을 낮추는 데에 더욱 좋다??

  왜냐하면, 확장은 상속받지 않고 기존타입에 기능을 추가하기에 응집도가 높아지고 재정의가 되지 않기에 기존 타입과 결합성이 낮다! 

-> DateFormatter 구현할 때, Date구조체를 상속받고 싶지만 구조체를 상속받는 것은 불가능했다. -> extension으로 확장