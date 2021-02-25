# 1단계 (2021.02.25 20:20)

![스크린샷 2021-02-25 오후 8 11 39](https://user-images.githubusercontent.com/61342175/109146262-f1cdb980-77a6-11eb-994f-23b46f77b678.png)

## About App Development with UIKit

Documentation Link    
<https://developer.apple.com/documentation/uikit/about_app_development_with_uikit>

>"The UIKit framework provides the core objects that you need to build apps for iOS and tvOS. You use these objects to display your content onscreen, to interact with that content, and to manage interactions with the system. Apps relyon UIKit for their basic behavior, and UIKit provides many ways for oyu to customize that behavior to match your specific needs."

- 프로젝트 생성 시 템플릿을 선택하면 최소한으로 필요한 것이 생성
- 예를 들어 싱글 뷰 앱 템플릿 생성 시 아래 이미지처럼 파일이 담겨 있음

![UIKit](https://docs-assets.developer.apple.com/published/c922d75ec8/8783d1ba-8cc8-4966-afa9-4780a24cc430.png)
- 빌드 시 소스파일 컴파일, 앱 번들 생성
- 앱 아이콘과 Launch screen storyboard가 요구됨
- 이전에 살펴봤었던 Info.plist에 대한 설명도 나옴
- UIKit App의 구조는 MVC 디자인 패턴에 기반을 둠

![UIKit](https://docs-assets.developer.apple.com/published/4e7c26b6ad/ff7aa08f-4857-44ce-88d5-7dacbef84509.png)



## App and Environment

Documentation Link    
<https://developer.apple.com/documentation/uikit/app_and_environment>

>"Manage life-cycle events and your app's UIscenes, and get information about traits and the environment in which your app runs."

- Multiple instances에 대한 내용: 예를 들어 아이패드의 달력앱에서 한 쪽은 날짜, 한 쪽은 월
- UIKit은 디바이스 세팅, 인터페이스 세팅, 유저 프리퍼런스를 반영하는 trait collections을 통해 현재 environment에 대한 세부내용을 소통할 수 있게 함

## Managing Your App's Life Cycle

Documentation Link   
<https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle>

>"Respond to system notifications when your app is in the foreground or background, and handle other significant system-related events."

- 앱의 현재 상태는 무엇을 할 수 있고 무엇을 할 수 없는지 보여줌
- foreground 앱은 사용자의 집중을 끌고 있는 것으로, 시스템 리소스 상 우선순위를 가짐(CPU 포함)
- 반대로 background app은 가능한 가장 적은 작동만 해야 함
- 앱의 상태가 변화면 UIKit은 적절한 delegate object 메소드를 호출하는 것을 통해 알려줌

### Respond to Scene-Based Life-Cycle Events
- 사용자 혹은 시스템이 앱의 새로운 scene 요청 -> UIKit이 생성해서 unattached state로 두고 -> system-requested scene은 보통 이벤트를 프로세스할 수 있도록 background로 이동?
![UIKit](https://docs-assets.developer.apple.com/published/95ed05c755/30f48607-bf65-42cf-983f-38a55bdd0d6a.png)
- 예를 들어 시스템은 location event를 process하기 위해 background에서 scene을 launch할 것
- 사용자가 app을 dismiss하면, UIKit은 관련이 있었던 scene을 background 상태로 이동시키고 결국 suspended state로
- UIKit은 background 혹은 suspended scene과 연결을 끊을 수 있으며, 리소스를 회수하기 위함임

1. UIKit이 앱에 연결할 때 scene의 초기 UI를 설정에 맞추고 데이터를 로드
2. foreground -> active transition이 발생하면 UI configure, 사용자와 상호작용할 준비를 함
3. foreground-active 상태에서 빠져나오면 데이터 저장과 앱의 행동을 멈추게 하고
4. background 상태로 진입하면 중요 작업수행을 멈추고 스냅샷을 준비
5. scene이 연결해제되면 scene과 관련이 있는 리소스를 지움

### Respond to App-Based Life-Cycle Events
- in iOS12 and earlier, scene을 서포트 하지 않는 앱
![UIKit](https://docs-assets.developer.apple.com/published/f55402f424/9dfc33e2-1072-4d21-88d9-34ad894b615f.png)
- UIKit은 모든 라이프 사이클 이벤트를 UIApplicationDelegate object에 deliver
- 앱 delegate는 앱의 윈도 모두를 관리
- 앱 상태의 transition이 모든 UI에 영향을 미쳤음(아직 어떤 의미인지 잘 이해가..)
- launch 이후 시스템은 UI가 온스크린에 나타날지 말지에 의존하는 상태로 inactive 혹은 background 상태로 둠?
- foreground로 launch될 때 시스템은 자동적으로 active 상태로 앱을 transition
- app이 terminate될 때까지 active와 background 사이를 왔다 갔다

1. launch 시 앱의 데이터 구조와 UI를 초기화
2. activation에서 UI 설정을 마치고 사용자와 상호작용할 준비를 함
3. deactivation에서 데이터를 저장하고 앱의 행동을 멈춤
4. background 상태로 진입 시 중요 작업수행을 멈추고 가능한 많은 메모리를 free up, 스냅샷 준비
5. termination 시 모든 작업을 즉시 마치고 리소스를 방출

### Respond to Other Significant Events
- 이후에는 Memory warnings, Protected data becomes available/unavailable, Handoff tasks, Time changes, Open URLs에 대한 내용으로, 앱은 앞서 열거한 다섯 가지에 대비해야 함

Memory warnings: Received when your app's memory usage is too high. Reduce the amount of memory your app uses; see 'Responding to Memory Warnings'.
Protected data becomes available/unavailable: Received when the user locks or unlicks their device. See 'applicationProtectedDataDidBecomeAvailable(_:)' and 'applicationProtectedDataWillBecomeUnavailable(_:)'.
Handoff tasks: Received when an NSUserActivity object needs to be processed. See 'application(_:didUpdate:).'
Time changes: Received when an NSUserActivity object needs to be processed. See 'application(_:didUpdate:)'.
Open URLs: Received when your app needs to open a resource. See 'application(_:open:options:)'.

### 아직 scene-based와 app-based의 차이, 특히 리소스에서 차이가 있는 것인지 어떤 것인지 와닿지 않음 -> 더 찾아보고 고민해볼 것

## Responding to the Lauch of Your App

Documentation Link   
<https://developer.apple.com/documentation/uikit/app_and_environment/responding_to_the_launch_of_your_app>

>"Initialize your app's data structures, prepare your app to run, and respond to any launch-time requests from the system."

- 사용자가 홈 스크린에서 앱 아이콘을 탭하면 시스템으 앱을 launch
- 앱에서 특정 이벤트 요청 시 시스템은 background에서 그 이벤트를 다루기 위해 launch
- scene-based app에서 시스템은 앱을 scene이 나타날 필요가 있거나 어떤 작업을 수행하기 위해 launch
- 앱은 UIApplicationDelegate 프로토콜에 순응하는 delegate object를 갖고 있음(이벤트 발생에 프로세스 내에서 반응하는)
- 사용자가 처음 앱을 launch -> 시스템은 UI가 준비될 때까지 launch storyboard를 보여줌
- launch storyboard는 커스터마이징이 가능
- 디자인 가이드라인을 따르기 위해 살펴볼 것을 권하는 것 == HIG(Human Interface Guidelines)
<https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/launch-screen>

- launch cycle?
- 1. Initialize your app's data structures.
- 2. Verify that your app has the resources it needs to run.
- 3. Perform any one-time setup when your app launches for the first time. For example, install templates or user-modifiable files in a writable directory. See Performing One-Time Setup for Your App.
- 4. Connect to any critical services that your app uses. For example, connect to the Apple Push Notification service if your app supports remote notifications.
- 5. Check the launch options dictionary for information about why your app launched. See Determine Why Your App Launched.

- scene 베이스가 아닌 경우 UIKit은 default user interface를 자동적으로 launch
- UIKit은 application(_:didFinishLaunchingWithOptions:) 메소드가 리턴된 이후까지 앱의 인터페이스를 제공하지 않는다? launch가 끝난 이후에 앱의 인터페이스가 제공된다는 의미?
- method, launch가 오래걸리면 사용자는 지루함을 느낌

## MacOS 프로젝트 템플릿과 iOS 프로젝트 템플릿

- MacOS 프로젝트 템플릿은 Scene Delegate파일이 없고 iOS 프로젝트 템플릿에는 존재
- 앞서 살펴봤던 내용 중에서 scene-based app이라는 표현이 있었는데, iOS 앱은 scene-based이고 MacOS 앱은 scene-based가 아니라는 의미?

## UIApplicationMain(_:_:_:_:)

>"Creates the application object and the application delegate and sets up the event cycle."

앱 객체, 앱 delegate 생성과 이벤트 사이클 set up

- 사용자가 홈버튼을 눌러 iOS앱으로부터 빠져나오면 애플리케이션은 background로 이동 (앞서 살펴봤던 background state?)
- main event loop를 set up(여기에는 app의 run loop도 포함)하고 이벤트 프로세싱을 시작

## Protocol

정의 한 후 어떤 객체가 이 프로토콜을 따르도록 한다는 것은 요구사항을 지켜 프로토콜을 준수하도록 하겠다는 의미

여러 객체가 같은 프로토콜을 따른다면, 준수하면서 동시에 세부 구현은 다를 것 -> 명령에 수행하는 것은 맞지만 각자 다른 방식으로 수행(다형성)
