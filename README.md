## Step1 - 아이패드 앱 시작
> iOS 앱 프로젝트 기본 구조인 MVC 형태에 맞춰서 기존 레벨2에서 작성한 자판기 소스 파일을 적용한다.

## iOS infrastructure
앱은 내가 작성한 커스텀 코드와 시스템 프레임워크 사이에서 상호작용한다. 시스템 프레임워크는 앱이 실행되는데 기본적인 인프라를 제공하고, 내 코드는 그 인프라를 커스텀하도록 설계하여 내가 원하는대로 앱이 보여지도록 만들 수 있다.
iOS프레임워크는 MVC패턴과 델리게이션 같은 디자인패턴을 기반으로 동작한다.  

## iOS앱을 구성하는 핵심객체(UIKit Framework의 핵심 객체)

앱이 시작되는동안, UIApplicationMain 함수는 주요 객체를 세팅하고 앱을 실행을 시작한다. 앱의 가장 핵심적인 역할을 하는 [UIApplication](https://developer.apple.com/documentation/uikit/uiapplication) 객체는 시스템과 앱 내부의 다른 객체들이 상호작용할 수 있도록 한다.
iOS앱은 MVC패턴을 사용하는데, 데이터와 로직을 데이터의 시각화로부터 분리해서 동작시키는 패턴이다.

<img src="./Screenshot/step1-1.png" width="80%">

- **UIApplication** : 앱의 가장 핵심적인 역할을 하는, 앱 그 자체를 의미하는 객체. 시스템으로부터 이벤트를 받아 Custom Objects로 이벤트를 전달하고 상위 레이어의 앱 동작을 조정
  - 앱 상태 변화나 푸시 메세지 도착처럼 특수한 형태의 이벤트를 우리가 정의한 델리게이트 객체에 전달하여 사전에 정의된 메소드를 호출할 수 있도록 한다.
  - UIApplication 객체는 대리인인 AppDelegate 객체를 내세워 커스텀 코드를 처리할 수 있도록 약간의 권한을 부여한다.
  - UIApplication은 앱의 생명주기나 이벤트 처리와 같이 중요한 일들을 담당하고, AppDelegate는 커스텀 코드를 처리하게 된다.
- **AppDelegate** : 위임받은 권한을 이용하여 App의 초기화(app initialization), 상태변화(state transitions), 다른 앱의 기타 이벤트를 핸들링
  - custom 객체로서 앱 런칭시점에 UIApplicationMain 함수에 의해 생성된다. (커스터마이징하거나 서브클래싱 할 수 있도록 오픈되어 있다.)
  - AppDelegate객체 내의 custom logic들은 UIApplication객체와 상호작용한다.
  - 앱이 시작되면 앱 델리게이트는 `application(_:didFinishLaunchingWithOptions:)` 메시지를 받게 되는데, 이 시점에 크리티컬한 데이터를 초기화하면 된다. 단, 앱이 화면에 나타나기 전이므로 시간이 많이 걸리는 작업은 하지 않는 것이 좋다.
  - 앱 내에서 오직 하나의 인스턴스만 생성되도록 보장받는다.
  - 앱 전체의 생명주기와 함께 한다. 앱이 처음 만들어질 때 객체가 생성되고, 앱이 실행되는동안 유지되다가, 앱이 종료되면 소멸한다.
  - AppDelegate 객체는 종종 앱의 초기 데이터 구조를 설정하기 위해 사용되기도 한다. (AppDelegate 객체에 데이터를 저장하면 앱 종료 전까지 데이터를 유지할 수 있으므로)
- **UIWindow** : 화면 그리기 지원 도구를 제공하는 객체.
  - 디바이스 스크린을 빈틈없이 채우기 위한 객체
  - 대부분의 앱은 하나의 윈도우를 가진다.
  - 항상 유저 인터페이스 표현 계층의 최상위에 위치한다.
  - 뷰의 일종이지만 직접 콘텐츠를 가지지 않는다. UIView들이 콘텐츠를 표현하면 디바이스 스크린에 이를 표현한다.
  - 화면이 전환되더라도 윈도우 객체는 전환되지 않는다.(내부에 배치된 뷰의 콘텐츠만 변경된다.) 뷰 컨트롤러를 조정해서 뷰를 변경해야한다.
  - 윈도우는 UIApplication과 상호작용하며, 특정 이벤트가 발생하면 그 이벤트를 뷰컨트롤러에 전달하는 역할을 한다.

- **View controller** : 앱의 컨텐츠가 화면에 보이게 하는 역할
  - 하나의 View Controller 객체는 하나의 뷰와 뷰의 서브뷰를 관리. View Controller 객체는 자신이 관리하는 뷰를 앱의 윈도우에 위치시킴으로써 뷰가 화면에 보여지도록 한다.
  - UIVIewController클래스는 모든 뷰 컨트롤러 객체의 부모클래스이다. 기본적인 시스템 상에서 일어날 수 있는 동작에 따라 뷰의 기본 동작들을 제공한다.

- **View and Control** : 앱의 콘텐츠를 시각적으로 표현
  - 뷰는 명시된 직사각형 내에서 컨텐츠를 draw하고 그 영역 내의 이벤트에 반응한다.
  - 컨트롤은 특수한 뷰인데 예를들어 버튼, 텍스트필드, 토글 스위치처럼 친숙한 인터페이스이다.

## App Loading Process(앱 초기화 과정)
> UIApplicationMain()함수의 역할

1. App 실행: main() 함수 실행
2. main(): main()는 UIApplicationMain() 호출
3. UIApplicationMain(): 앱의 본체에 해당하는 객체인 UIApplication 객체 생성
4. UIApplication 객체: Info.plist 파일을 바탕으로 앱에 필요한 데이터와 객체 로드
5. AppDelegate 객체 생성 및 UIApplication 객체와 연결
6. 이벤트 루프 생성 등 실행에 필요한 준비 진행
7. 실행 완료를 앞두고 UIApplication객체가 AppDelegate에 `application(_:didFinishLaunchingWithOptions:)` 메시지 전송

<img src="./Screenshot/step1-2.png" width="80%">



## The Main function
C를 기반으로 하는 앱과 동일하게 iOS앱도 main함수로부터 실행이 시작된다. 하지만 iOS프로젝트에는 main.swift가 생략되어있다. (Xcode가 기본으로 작성해준다. 99%의 iOS앱 프로젝트가 앱의 론칭 방식까지 변경할 이유는 없기 때문에 우리는 보통 앱이 실행되고 나서 커스텀 코드를 만나게 되는 첫 지점인 앱 델리게이트 파일부터 편집하게 된다.)
```swift
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
```
main함수를 보면 알 수 있지만, (함수의 리턴 부분을 보면)UIApplicationMain함수가 앱의 핵심 객체를 생성하고, 스토리보드로부터 앱의 UI를 로드하고, 커스텀 코드를 호출하며, 앱이 run loop 내에서 동작 할 수 있도록 만든다. *(GUI를 사용하기 위한 런루프를 돌려주는 작업)* 이 중에서 개발자가 해야 할 것은 스토리보드 파일과 custom initialization code이다.


## The Main Run Loop
> - UIApplication객체는 앱 런치 시 main run loop을 셋업하고, 이벤트를 다루고 뷰 인터페이스를 업데이트하기위해 사용한다.
> - 또한 main run loop은 앱의 메인 스레드이다.

- 메인 런 루프는 앱에 들어오는 이벤트들을 애플리케이션 객체가 처리할 수 있도록 계속해서 라우팅하고, 처리결과로서 UI와 상태를 업데이트한다.
- 발생한 이벤트의 좌표는 런루프에 추가된다.
  - 입력소스(input source): 다른 thread나 어플리케이션에서 전달되는 메시지 이벤트(비동기식)
  - 타이머소스(timer source): 예정시간이나 반복수행간격에 따라 발생하는 이벤트(동기식)

  - **사용자 이벤트 발생, 처리과정**
  <img src="./Screenshot/step1-3.png" width="80%">
  1. 이벤트 발생(ex. 터치)
  2. 시스템에서 port를 통해 앱으로 전달(메인 런루프는 다른 런루프와 달리 사용자 액션으로 인한 이벤트를 Operating System으로부터 받는다.)
  3. 이벤트 queue에 등록
  4. 이벤트에 맞는 메소드 실행

- 애플리케이션 객체(Application Object)는 로우레벨 이벤트를 받아 UIEvent로 변환하여 해당하는 객체로 내보낸다.
  - 애플리케이션은 각 이벤트를 도착한 순서대로 처리해야 하기 때문에 로우레벨 이벤트는 FIFO 이벤트 큐에 들어간다.
  - 애플리케이션 객체는 이벤트 최상위에 있는 객체를 취해서 이벤트 객체(UIEvent)로 변환하고 유저 이벤트가 일어난 Window에 디스패치(dispatch)한다.
  - 전달한 이벤트가 돌아왔을 때 애플리케이션은 큐에서 다음 객체를 가져와서 디스패치한다. 앱이 종료될 때까지 이 과정을 반복한다.
  - 또한, 앱이 실행되었을 때 이벤트를 처리하는 책임을 가진 객체들을 코어 그룹으로 설정한다.
- 코어 객체(Core Objects)는 이벤트에 응답하고 UI를 업데이트한다.
  - 애플리케이션 객체에서 보낸 이벤트는 Window가 먼저 받고, Window는 이벤트를 처리하기에 가장 적절한 핸들러인 View에 보낸다.
  - 최초로 받은 뷰가 이벤트를 처리하지 않으면, 응답자 체인(Responder Chain)\*을 통해 다른 뷰로 전달된다.
  - 뷰는 종종 애플리케이션의 외관을 수정하고 상태나 데이터를 업데이트하는 일련의 액션을 수행한다. 이런 액션이 완료되면 애플리케이션 객체로 제어가 돌려지며, 애플리케이션 객체가 이벤트 큐의 다음 이벤트를 취한다.



- 전달받은 이벤트를 앱의 run loop에서 처리하는 과정
<img src="./Screenshot/step1-4.png" width="80%">

1. run loop 대기 중 이벤트 발생(주로 입력소스와 타이머소스 처리)
2. 정해진 메소드 호출(타이머에서 설정한 시간데 따라)
3. 메소드 완료 후 변경될 필요가 있는 사항 적용(뷰의 경우 setNeedsLayout, setNeedsDisplay)
4. runUntil- 메소드에서 정한 시간까지 유지, 할일 없으면 suspend 상태.



\* Responder chain : 뷰 요소들은 responder를 상속받아서 구현되어있다. Responder chain은 이벤트를 구성한다. linked list처럼 다음에 응답할 애 다음에 응답할 애 다음 다음 그다음...

***


### 앱 프로그래밍 가이드
- Apps Are Expected to Support Key Features
- Apps Follow Well-Defined Execution Paths
- Apps Must Run Efficiently in a Multitasking Environment
- Communication Between Apps Follows Specific Pathways
- Performance Tuning is Important for Apps

### 앱 번들
> 번들은 파일 시스템 내의 한 경로인데, 앱을 구성하는 리소스들을 묶어놓은 단위이다.  
> iOS 앱 번들은 앱 실행파일이나 앱 아이콘, 이미지, 로컬라이즈 콘텐츠를 포함한다.

#### 일반적으로 앱 번들에 포함되는 것들
- *App executable, Info.plist(information property list file), App icons, Launch images, Storyboard files (or nib files), \*Ad hoc distribution icon, \*Settings bundle, Nonlocalized resource files, \*Subdirectories for localized resources*

\* *Ad hoc distribution icon*: This icon is normally provided by the App Store from the materials you submit to iTunes Connect. However, because apps distributed ad hoc do not go through the App Store, your icon must be present in your app bundle instead. iTunes uses this icon to represent your app.
\* *Settings bundle*: If you want to expose custom app preferences through the Settings app, you must include a settings bundle.
\* *Subdirectories for localized resources*: An iOS app should be internationalized and have a language.lproj directory for each language it supports.<br/>
Localized resources must be placed in language-specific project directories, the names for which consist of an ISO 639-1 language abbreviation plus the .lproj suffix. (For example, the en.lproj, fr.lproj, and es.lproj directories contain resources localized for English, French, and Spanish.)
