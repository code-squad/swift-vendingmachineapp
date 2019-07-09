# Vending Machine App - step1. 아이패드 앱



## iOS 앱을 구성하는 핵심 객체 

UIKit은 시스템과 상호 작용하고 앱의 메인 이벤트 루프를 실행하며 화면에 콘텐츠를 표시하는 앱의 핵심 객체를 제공합니다. UIKit 구조는 MVC 디자인 패턴을 기반으로 객체를 용도에 따라 구분합니다. 

Model : 앱의 데이터 및 비지니스 로직 관리

View : 데이터의 시각적 표현

Controller : 모델과 뷰 객체 사이의 다리역할을 하며 적절한 시간에 데이터를 이동

UIKit은 앱의 데이터 구조를 나타내는 모델을 제공하고 뷰는 필요에 따라 데이터에 대한 사용자 정의 뷰를 정의할 수 있습니다. 데이터와 뷰 사이의 데이터 교환을 조정하는 것은 뷰 컨트롤러와 앱델리게이트 입니다. 

<img alt="core object of App" src="https://docs-assets.developer.apple.com/published/4e7c26b6ad/ff7aa08f-4857-44ce-88d5-7dacbef84509.png">

UIApplication : 메인 이벤트 루프와 같은 것들을 담당하는 객체로 앱 상태 변화나 푸시 메시지 도착처럼 특수한 형태의 이벤트를 우리가 정의한 델리게이트 객체에 전달하여 사전에 정의된 메소드를 호출할 수 있도록 한다.

Application Delegate : UIApplication과 서로 연결되어 앱 초기화, 상태변화, 기타 이벤트를 핸들링하는 역할을 한다. 이 객체는 각 앱에서 반드시 하나만 존재하도록 시스템에 의해 보장된다. 

ViewController : 뷰 컨트롤러 객체는 기기 화면 내에 어떻게 콘텐츠를 보여줄 것인지에 대한 표현을 관리한다. 또한 컨트롤러 최상위에 있는 싱글 뷰와 그 하위에 서브 뷰 집합들을 컨트롤한다. 화면에 뷰를 표현하기 위해 뷰 컨트롤러는 자신의 뷰를 앱 윈도우에 설치하여 스크린에 표시한다. 

UIWindow : 화면에서 하나 이상의 뷰에 대한 표현을 조정하는 역할을 한다. 대부분의 앱들은 메인 화면에 콘텐츠를 표현해주는 하나의 윈도우만 가지지만, 외부 화면에 표시되는 콘텐츠를 위한 부가적인 윈도우를 가질 수도 있다. 

Views and UI Objects(Controls) : 앱의 콘텐츠를 시각적으로 표현하는 일을 한다. 뷰는 사각형으로 구성된 영역 내에 콘텐츠를 그려내고, 이 영역 내에서 이벤트에 반응하는 하나의 객체다. 컨트롤은 버튼이나 텍스트 필드, 토글 스위치 등 잘 알려진 인터페이스 객체를 구현하는 역할을 하는 뷰의 특수한 형태이다.
 UIKit 프레임워크는 콘텐츠의 다양한 형태를 나타내기 위해 표준 뷰를 제공하지만, 우리는 필요에 따라 UIView클래스를 상속받아 새로운 커스텀 뷰를 정의할 수도 있다.



**UIApplicationMain** : iOS의 핵심 라이브러리인 UIKit은 main함수를 관리하여 개발자가 직접 main함수에 코드를 작성하지 않습니다. 그러나 앱이 시작되면, 시스템은 main함수를 다루는 과정에서 UIApplicationMain 함수를 호출합니다. 이 함수는 다른 task들 중에서 싱글톤 UIApplication객체를 만듭니다. 이 객체를 통해 개발자는 앱의 실행에 부분적으로 관여할 수 있습니다. 

UIApplicationMain함수는 application 객체와 application delegate를 만들고, 이벤트 사이클을 설정하는 역할을 가집니다. 

(즉, 앱의 생명주기를 담당하게 되는 AppDelegate를 메모리에 올려준다. 이러한 앱의 생명주기를 담당하는 부분은 UIKit에 있다.)

<img src="https://user-images.githubusercontent.com/31604976/60859772-cb17e380-a24e-11e9-8eb0-d17e52e6ada8.png">

1. 아이폰에서 사용자가 어플리케이션을 Tap 해서 실행
 2. 해당 어플리케이션의 main 실행
 3. main 에서 UIApplicationMain() 실행 
 4. AppDelegate 의 applicationDidFinishLaunching: 을 호출
 5. applicationDidFinishLaunching이 완료되면  EventLoop로 들어감
 6. 이제부터는 개발자가 코드로 구현한 작업들 수행
 7. 어플리케이션 종료
 8. AppDelegate의 applicationWillTerminate: 호출
 9. 어플리케이션 종료



## iOS 메인 런루프 동작

Main Run Loop란 유저가 일으키는 이벤트들을 처리하는 프로세스이다. UIApplication 객체는 앱이 실행될 때 Main Run Loop를 실행하고 이 Main Run Loop와 관련된 이벤트나 뷰의 업데이트에 활용합니다. 또한, Main Run Loop는 뷰와 관련되어 있기 때문에 메인쓰레드에서 실행됩니다.

**동작 과정**

1. 유저가 이벤트를 일으킨다.
2. 시스템을 통해 이벤트가 생성된다.
3. UIkit 프레임워크를 통해 생성된 port로 해당 이벤트가 앱으로 전달된다.
4. 이벤트는 앱 내부적으로 Queue의 형태로 정리되고, Main Run Loop에 하나씩 매핑된다.
5. UIApplication 객체는 이때 가장 먼저 이벤트를 받는 객체로 어떤 것이 실행되야하는지 결정한다.



참고 및 출처 :

https://sibalja.tistory.com/3

https://developer.apple.com/documentation/uikit/about_app_development_with_uikit

https://hcn1519.github.io/articles/2017-09/ios_app_lifeCycle

https://wnstkdyu.github.io/2018/06/07/appprogrammingguidetheapplifecycle/

https://zeddios.tistory.com/539

* https://j2enty.tistory.com/entry/iOS-iOS-Application-Life-Cycle