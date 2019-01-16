## VendingMachineApp 정리

#### Step 1


**Device Orientation(화면 지원)**
 
 일반적으로 설정을 위한 방법이 두 가지 존재한다. 첫 번째는 코드로 구현하는 것이고 두 번째는 프로젝트 설정에서 항목을 설정하는 것이다.
 
   이번 Step1에서는 프로젝트 설정에서 `Device Orientation` 항목을 설정해주었다.
   1. 프로젝트 일반(General)에서 `Device Orientation`항목을 체크해준다.
   2. 4가지 옵션이 존재한다.
   * Portrait : 기본 모드이다. 기기가 손에 들려있을 때, 홈 버튼이 제일 아랫쪽으로 위치하는 화면모드이다.
   * PortraitUpsideDown : 위의 모드와는 반대되는 모드이다. 홈 버튼이 제일 윗쪽에 위치하는 모드이다.
   * LandscapeLeft : 기기가 들려있고 홈 버튼이 제일 오른쪽에 위치한다. 흔히 동영상을 볼 때 사용한다.
   * LandscapeRight: 위의 모드와 반대되는 모드이다. 홈 버튼이 제일 왼쪽에 위치한다.
   
   
**IOS 프로젝트 템플릿 구조**

 * App Lifecycle
  앱 생명주기는 홈 버튼을 눌렀을 때, 전화가 왔을 때와 같이 앱이 화면상에서 보이지 않는 상태, 화면에 실행되고 있는 상태들을 정의한 것이다. 제대로 된 앱을 만들기 이해서는 다양한 상황에서 작동하기 위해 앱 생명주기에 대한 이해가 중요하다.
   앱 생명주기를 이해하기 위해 먼저 Swift 앱을 실행했을 때, 실행되는 상황을 보겠다.
   - UIApplication 객체 생성 (싱글톤 객체 - 앱에 하나만 존재)
   - @UIApplicationMain 어노테이션이 있는 클래스를 찾아 AppDelegate 객체를 생성
   - Main Event Loop을 실행
   
    AppDelegate 객체는 UIApplication 객체로부터 메세지를 받았을 때, 해당 상황에서 실행될 함수들을 정의한다. 프로젝트를 생성할 때, 자동으로 AppDelegate.swift 파일이 생성된다. 이 파일이 AppDelegate 객체가 된다. 이 파일을 열어보면 클래스 선언부에 @UIApplicationMain 어노테이션이 붙어있는 것을 알 수 있다. AppDelegate.swift 파일에는 앱의 상태에 따라 실행되는 함수들이 정의되어 있다. 일반적으로 5개의 상태로 구분된다.
    
```
Not Running : 앱이 실행되지 않은 상태
Inactive : 앱이 실행중인 상태 그러나 아무런 이벤트를 받지 않는 상태
Active : 앱이 실행중이며 이벤트가 발생한 상태
Background : 앱이 백그라운드에 있는 상태 그러나 실행되는 코드가 있는 상태
Suspend : 앱이 백그라운드에 있고 실행되는 코드가 없는 상태
```
    
 AppDelegate.swift에는 아래와 같이 앱의 상태에 따라 실행되는 delegate 함수들이 정의되어 있다. 그렇기 때문에 앱의 특정 상태에서 동작하는 로직을 구현 할 수 있다.
```
application(_:didFinishLaunching:) - 앱이 처음 시작될 때 실행
applicationWillResignActive: - 앱이 active 에서 inactive로 이동될 때 실행
applicationDidEnterBackground: - 앱이 background 상태일 때 실행 
applicationWillEnterForeground: - 앱이 background에서 foreground로 이동 될때 실행
applicationDidBecomeActive: - 앱이 active상태가 되어 실행 중일 때
applicationWillTerminate: - 앱이 종료될 때 실행
```


#### Step 2
    
    
**UIImageView 추가하기**
    
UIImageView에 그림을 추가하기 위해 두 가지 방법이 존재한다. 
1. 첫 번째 방법은 프로젝트 폴더에 `.png`파일이나 `.jpg`파일을 넣어준다.  그 후 UIImageView를 클릭 후 오른쪽 상단의 메뉴 중 4번째를 선택하여 Image 옵션에서 넣고싶은 사진 파일을 선택해준다.
2. 두 번째 방법은 `Assets.xcassets` 폴더에 들어가서 오른쪽 마우스를 클릭하여 `Import`를 선택 후 원하는 이미지들을 넣어준다. 이렇게 하면 프로젝트에서 이미지파일에 접근이 가능하게 된다. 이후는 아까 위의 우측상단의 메뉴로 들어가서 설정해준다. 여기서 코드로 설정하는 방법도 존재한다.
```
@IBOutlet weak var bananaMilkImage: UIImageView?
    
override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    bananaMilkImage?.image = UIImage(named: "바나나우유.png")
    
    // 이 코드로 UIImageView의 속성도 조절할 수 있다.
    bananaMilkImage?.layer.cornerRadius = 30
    bananaMilkImage?.clipsToBounds = true
}
```
   
 
