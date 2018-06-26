[원본](https://developer.apple.com/library/content/documentation/General/Conceptual/DevPedia-CocoaCore/MVC.html)

> 개인의 이해와 공부를 위해 정리한 것이므로 잘못된 사항이 있을 수 있습니다.

* 패턴들의 공통된 목표 : "프로그램의 유지보수를 쉽게 그리고 단위 테스트를 할 수 있게"

* Model : 데이터에 관한 로직을 담는 부분
* View : 사용자에게 보여지는 화면
* Controller : Model과 View간의 동작관리

MVC패턴은 object들의 역할을 정의할 뿐만 아니라 객체간 서로 통신하는 법도 정의한다.

* MVC는 Cocoa application에 좋은 디자인이다.
* 재사용성 증가, better defined interfaces, 확장성이 좋음
* 많은 Cocoa technologies와 architectures가 MVC기반이다.

#### Model Objects
* persistent state of the application ?
* Model object는 view object와 연결되면 안된다.
* UI나 presentation issues와 관련있어서도 안된다.
* Communication : 데이터의 생성이나 데이터의 수정이 일어나는 view layer에서 User actions은 controller object를 통해 통신해야하고, 그 결과로 모델 객체를 생성하거나 업데이트 해야 한다. model object가 변경될 때(for example, new data is received over a ntework connection), controller object에게 알리고 controller object가 적절한 view obejct를 업데이트한다.

#### View Objects
* 어플리케이션에서 view object는 사용자가 볼 수 있는 object.
* view object는 어떻게 자신을 그리는 방법을 알고 있고 user action에 반응할 수 있다.
* View Object의 주된 목적은 어플리케이션의 model object에 있는 data를 보여주고 data를 edit할 수 있는 것이다. 하지만 그럼에도 불구하고 MVC application에서 view object는 model object와 분리되어 있다.
* Communication : View object는 어플리케이션의 controller objects를 통해서 model data안에서 변화를 학습하고 View object는 controller object들을 통해서 model object와 통신한다.


#### Controller Objects
* View obejct와 Model object 중개자 역할
* application의 setup과 coordinating tasks를 수행할 수 있고, 다른 객체들의 life cycle을 관리한다.
* Communication : controller object는 view object에서 만들어진 user actions을 해석하고 새로운 데이터나 변경된 데이터를 model layer에 전달한다. model object가 수정되었을 때 controller object는 새로운 model data를 view object에 보내고, view object는 이를 디스플레이할 수 있다.
