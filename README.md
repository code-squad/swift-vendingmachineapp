## Step1

### 프로그래밍 요구사항
* 레벨2 VendingMachine 미션의 Main, InputView, OutputView를 제외하고 전체 클래스를 프로젝트로 복사한다.
* 기존 코드들은 MVC 중에서 대부분 Model의 역할을 담당한다.
* iOS 앱 구조는 MVC 중에서도 우선 ViewController-Model 사이 관계에 집중하고, ViewController-View 관계는 다음 단계에서 개선한다.

![consol](images/consolstep1.png)

### 학습꺼리
* iOS 앱을 구성하는 핵심 객체들과 iOS 메인 런루프 동작 이해하기 위해서 애플 [앱 프로그래밍 가이드 문서](https://developer.apple.com/library/archive/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40007072)를 학습한다.
* macOS 프로젝트 템플릿과 iOS 프로젝트 템플릿 구조의 차이점을 학습한다.
* iOS 프로젝트에는 main.swift 가 생략되어 있다.
UIApplicationMain() 함수의 역할에 대해 찾아보고 학습한다.

