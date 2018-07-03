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


## Step2

### 프로그래밍 요구사항
* 스토리보드에 다음과 같이 아이패드 앱 화면을 구현한다.
	* 각 상품에 대한 재고 추가 버튼을 추가한다.
	* 각 상품에 대한 이미지를 추가한다.
	* 각 상품에 대한 재고 레이블을 추가한다.
	* 1000원, 5000원 금액을 입력하는 버튼을 추가한다.
	* 현재 잔액을 표시할 레이블을 추가한다.
* 각 상품의 재고 추가 버튼을 누르면 각 상품 재고를 추가하도록 코드를 구현한다.
* 재고 추가 버튼을 누르고 나면 전체 레이블을 다시 표시한다.
* 금액 입력 버튼을 누르면 해당 금액을 추가하도록 코드를 구현한다.
* 금액을 추가하고 나면 잔액 레이블을 다시 표시한다.

![step2](images/step2.gif)

### 학습꺼리
* IBOutlet Collection 기능에 대해 학습하고 중복되는 아웃렛을 제거한다.
* UIImageView 에서 이미지를 표시할 때 사각형 코너를 둥글게하도록 변경해본다.