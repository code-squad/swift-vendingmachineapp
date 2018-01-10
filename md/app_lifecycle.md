## 건드릴 수 없는 영역: System Framework
### 4. 앱 생명주기
#### iOS에서 앱이 가질 수 있는 상태값:
- **Not Running** - 앱이 시작되지 않았거나 시스템에 의해 종료된 상태
- **Inactive** - 앱이 전면에서 실행 중이지만 **아무런 이벤트를 받지 않고 있는** 상태
- **Active** - 앱이 전면에서 실행 중이며, 이벤트를 받고 있는 상태
- **Background** - 앱이 **백그라운드**에 있지만 **여전히 코드가 실행**되고 있는 상태. 대부분의 앱은 **Suspended 상태로 이행하는 도중 일시적으로 Background 상태에 진입**한다. 파일 다운로드, 업로드, 연산 처리 등 **여분의 실행시간이 필요한 앱인 경우, 특정 시간동안 이 상태로 남아 있는** 경우도 있다.
- **Suspended** - 앱이 **메모리에 유지**되지만 **실행되는 코드가 없는** 상태. **메모리가 부족한 상황**이 오면 **시스템은 특별한 알림 없이 Suspended 상태의 앱들을 정리**한다.

<center><img src="img/1_appstate.png" width="60%"></img></center>

- 앱 실행상태가 변할 때마다 AppDelegate에 정의된 특정 메소드가 호출됨
	- **application(_:willFinishLaunchingWithOptions:)**: 앱이 구동되어 필요한 **초기 실행 과정이 완료되기 직전**에 호출된다.
	- **application(_:didFinishLaunchingWithOptions:)**: 앱이 사용자에게 **화면으로 표시되기 직전**에 호출된다. 앱이 실행된 후 진행할 커스터마이징이나 초기화를 위한 코드를 작성한다.
	- **applicationDidBecomeActive()**: **실행된 앱이 전면(foreground)에 표시될 때** 호출된다. 앱이 **Inactive 상태에서 재시작하는 코드**를 넣어주면 일시중지된 작업을 갱신할 수 있다.
	- **applicationDidEnterBackground()**: **앱이 백그라운드 상태에 진입했을 때** 호출된다. 어느 순간 종료될 가능성이 있으므로, **잃어선 안되는 사용자 데이터를 종료 전에 미리 저장**하거나, **공유자원이 있다면 해제**하는 코드를 작성한다. **종료된 앱이 다시 실행될 때 현재 상태를 복구하기 위한 상태 정보를 저장**하는 코드도 작성하면 좋다.
	- **applicationWillTerminate()**: **앱이 종료되기 직전**에 호출된다. 사용자 데이터 등을 종료 전에 **한 번 더 저장**한다.
- 이 외에도 더 다양한 상태 변화에 대응하기 위한 메소드를 구현할 수 있다. [UIAppDelegateProtocol 공식문서](https://developer.apple.com/documentation/uikit/uiapplicationdelegate)를 참고한다.
