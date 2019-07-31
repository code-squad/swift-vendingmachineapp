# Singleton

- 여러 개의 인스턴스가 아니라 오직 하나의 인스턴스만을 생성하여 재사용하고자 할 때 사용된다.



## Swift singleton

###  방법1 - Class Constant

- static let 변수로 sharedInstance를 생성한다.

```swift
class LocationManager {
    static let sharedInstance = LocationManager()
    private init() {
        println("AAA");
    }
    func request(){
        //Code Process
        print("Location granted")
    }
}
//Singleton Pattern으로 생성한 단일 클래스에 접근하기 🚀
LocationManager.shared.requestForLocation()  //"Location granted"
// 주의사항 
// initializer를 private으로 명시하지 않으면
// 아래와 같이 새로운 클래스인스턴스를 생성할 수 있게 되어버린다.
let location = LocationManager()
location.requestForLocation()
```

#### 방법1 장점 및 특징

- `let` 선언으로 **thread safe** 하다
- swift에서 class 상수/변수들을 lazy 초기화하는 것을 지원하므로 이와 같은 접근방법이 가능하다.

### 주의!!

-  initializer를 `private` 으로 생성하여 **동일 클래스의 추가적인 인스턴스 생성이 가능한 부분을 사전에 방지**하자.



### 방법2 - Nested 구조체를 이용

```swift
class SingletonB {
    class var sharedInstance: SingletonB {
        struct Static {
            static let instance: SingletonB = SingletonB()
        }
        return Static.instance
    }
}
```

- lazy initialize 지원이 부족한 swift 1.1 이하에서 사용했던 트릭 같다.
- Static 구조체 속에서 인스턴스로 클래스를 생성하여 이를 리턴하는 방식으로 구성되어있다.
  - java에서도 비슷한걸 본 기억이 있는데..



### 방법3 - Objective-C 에서 쓰던 방식으로 `dispatch_once` 

```swift
class SingletonC {
    class var sharedInstance: SingletonC {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: SingletonC? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = SingletonC()
        }
        return Static.instance!
    }
}
```

- 근본적으로 방법2와 같다

  



## 구조체 싱글턴 vs 클래스 싱글턴

- **`value type vs reference type`** 에서 파생되는 차이가 싱글턴 패턴에도 드러난다.

- **구조체 싱글턴**의 값은 value type이라 새로운 변수에 싱글턴 인스턴스를 대입하여 값을 변경하면 `구조체 인스턴스 값의 복사` 가 발생하여 엄격한 의미의 싱글턴 객체가 되지 않는다. 

  - 즉, 대입연산이 이뤄진 변수는 새로운 구조체 인스턴스로 자리매김하게 된다.
  - **구조체 싱글턴 인스턴스**가 **일종의 구조체 팩토리? 같은 역할**을 하게 된다.
  - 이 값을 변경하여도 기존의 싱글턴 인스턴스에는 영향을 받지 않는다.

- **클래스 싱글턴**의 경우, 레퍼런스 참조로 인해 새 변수에 싱글턴 인스턴스를 대입하여 값을 변경시 `해당 싱글턴 인스턴스의 프로퍼티의 값이 변경` 된다.

  - 즉, **동일한 참조주소**를 가지므로 싱글턴 패턴이 완성된다.

  ```swift
  class MyClassSingleton {
      static let sharedInstance = MyClassSingleton()
      private init(){}
      var state = 5
      func helloClass() { print("hello from class Singleton: \(state)") }
  }
  
  struct MyStructSingleton {
      static let sharedInstance = MyStructSingleton()
      private init() {}
      var state = 5
      func helloStruct() { print("hello from struct Singleton: \(state)") }
  }
  
  let csi = MyClassSingleton.sharedInstance
  csi.state = 42
  MyClassSingleton.sharedInstance.helloClass()    //42
  
  var ssi = MyStructSingleton.sharedInstance			//싱글턴 인스턴스와 같은 구조체를 "복사"
  ssi.state = 42
  MyStructSingleton.sharedInstance.helloStruct()  //5
  ```

  [예제코드 출처](https://stackoverflow.com/questions/36788169/whats-the-difference-between-struct-based-and-class-based-singletons)

## Summary

###장점

- 인스턴스의 무분별한 생성을 방지할 수 있다.
- iOS 뷰 컨트롤러 간에 상태를 손쉽게 공유할 수 있게 해준다.
  - 모델 컨트롤러에서 데이터를 저장/로드할 때 발생가능한 **데이터의 정합성 문제** 를 해결할 수 있다.
  - [참고 읽을거리](https://matteomanferdini.com/swift-singleton/#convenience)
- iOS에서도 아래와 같은 클래스들이 싱글턴 패턴으로 생성되어있다.
  - UIApplication.shared
  - UserDefaults.standard
  - FileManager.default
  - URLSession.shared
  - OperationQueue.main



### 싱글턴 패턴의 단점

- 남용하는 경우, 클래스 인스턴스의 라이프사이클을 관리하기 어려워진다.

- 또한, 전역 && mutable && shared 변수로 남게 되는 상황이 발생할 수 있다.

  > *You use singletons to provide a globally accessible, shared instance of a class.*

  - 기본적으로 애플의 가이드라인에서는 전역으로 접근가능한 인스턴스에 대해 싱글턴 패턴을 사용할 것을 권장하나, 그 범위와 제한에 대해서는 명시해두지 않았다. 자칫하면 안티패턴을 남용할 수 있다. 

- 소프트웨어 개발 원칙중 하나인 **"*관심의 분리 `seperation of concerns`*"** 원칙을 위배한다.

- 여러 코드에 걸쳐서 하나의 객체가 사용되므로 제대로 관리하지 않으면 데이터의 손실/오염을 유발할 수 있다.

- 앱의 라이프사이클과 동일한 라이프사이클을 지닌 인스턴스를 양산할 수 있다.

- 싱글턴 객체에 대한 테스트는 어렵고 때로는 불가능하기도 하다.

  



### 단점 보완

- 단점의 원인 : **싱글턴 & 공유 자원**
- 단점들을 보완을 위해서 **DI(Dependency Injection)**으로 싱글턴 인스턴스를 관리해줘야 한다.
- `segue로 데이터를 전달` 하면서 다른 뷰 컨트롤러로 이동하거나, 앱딜리게이트의 `application()` 의 실행 후 보여질 뷰 컨트롤러로 이동할 때, 앱의 `viewWillAppear()`  로직 등에서 데이터를 저장하는 컨트롤러로부터 데이터를 주입받는 절차가 필요하다.

[예제코드 출처](https://matteomanferdini.com/swift-singleton/#dependency-injection)

#### 1)  DI in viewWilAppear()

```swift
class ProfileViewController: UIViewController {
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var bioLabel: UILabel!
	@IBOutlet weak var emailButton: UIButton!
	
	var storageController: StorageController?
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
    ///스토리지 컨트롤러로부터 user 데이터 값을 항상 최신화하여 받는다.
		guard let user = storageController?.fetchUser() else {	
			return
		}
		nameLabel.text = user.name
		bioLabel.text = user.bio
		emailButton.setTitle(user.email, for: .normal)
	}
}
```



#### 2) 앱의 실행과 segue 과정에서의 DI

```swift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		guard let navigationController = window?.rootViewController as? UINavigationController,
			let profileViewController = navigationController.viewControllers.first as? ProfileViewController else {
				return true
		}
    /// Dependency Injection
		let storageController = StorageController()
		profileViewController.storageController = storageController
		return true
	}
}
```



#### 3) Segue 과정에서 DI

```swift
class ProfileViewController: UIViewController {
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var bioLabel: UILabel!
	@IBOutlet weak var emailButton: UIButton!
	
	var storageController: StorageController?
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		guard let user = storageController?.fetchUser() else {
			return
		}
		nameLabel.text = user.name
		bioLabel.text = user.bio
		emailButton.setTitle(user.email, for: .normal)
	}
  /// Dependency Injection
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let navigationController = segue.destination as? UINavigationController,
			let editProfileViewController = navigationController.viewControllers.first as? EditProfileViewController {
			editProfileViewController.storageController = storageController
		}
	}
}
```



### Question...

- Spring Framework에서는 생성자/Setter 주입방식으로 싱글턴 인스턴스에 대한 DI를 해주었는데, 뷰 컨트롤러를 직접 생성하는 과정에서 파라미터를 전달한다든가 할 수 있는지…?



###더 알아볼 주제

- iOS에서 인스턴스의 동기화 전략



### 참고

[예제코드 원문1 - Singleton Class in Swift](https://medium.com/@nimjea/singleton-class-in-swift-17eef2d01d88)

[예제 코드 원문2](https://github.com/hpique/SwiftSingleton)

[Singleton 패턴 사용 방법 3가지](http://minsone.github.io/mac/ios/singleton-in-swift)



[추가로 읽어볼 아티클을 모아둔 레퍼런스](https://matteomanferdini.com/swift-singleton/)