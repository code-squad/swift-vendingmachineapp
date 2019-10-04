# VendingMachineApp

[1. 아이패드 앱](#1---아이패드-앱)

[2. MVC 패턴](#2---MVC-패턴)

## 1 - 아이패드 앱

###  요구 사항 / 추가 내용

- iOS SingleViewApp 템플릿으로 프로젝트를 생성
- [VendingMachine](https://github.com/cmindy/vendingmachine) 에서 `main`, `Views` 를 제외한 클래스들을 프로젝트로 복사
  - Model의 역할을 담당
- `ViewController`에 `VendingMachine` 객체와 음료수 객체를 추가하고 재고 목록을 출력



### 실행 결과

<img src="https://tva1.sinaimg.cn/large/006y8mN6gy1g7d1k50yobj30n003uweu.jpg" alt="image-20190926182103077" style="zoom:50%;" />

### 학습 내용

#### The Main Function

- C 기반의 모든 앱의 시작점은 `main`. iOS도 마찬가지로 시작점은 `main` 이다.

- But, iOS에서는 `main` 을 작성하지 않아도 XCode가 기본 프로젝트의 일부로 이 함수를 생성한다.

- ```swift
  #import <UIKit/UIKit.h>
  #import "AppDelegate.h"
  int main(int argc, char * argv[])
  {
      @autoreleasepool {
          return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate
  class]));
  } }
  ```
  
- `main` 함수는 UIKit 프레임워크에 컨트롤을 넘긴다.

- `UIApplicationMain` 

  - 앱의 핵심 객체 생성
  - 스토리보드에서 앱의 UI를 로드
  - 사용자 지정 코드를 호출해 초기 설정
  - 앱의 런 루프를 실행해 이 프로세스를 처리

#### The Structure of an App

- 앱 시작시  `UIApplicationMain` 함수는 핵심 객체들을 생성하고 앱을 실행한다.

- 모든 iOS 앱의 핵심은 `UIApplication` 객체이다.
  - 시스템과 앱 내의 다른 객체들 간의 상호작용을 원활하게 해 준다.
  - 이벤트 루프와 다른 높은 수준의 앱의 동작을 관리한다.

<img src="https://tva1.sinaimg.cn/large/006y8mN6gy1g7d1w6xinuj31330u0agf.jpg" alt="image-20190926183245333" style="zoom:67%;" />



#### The Main Run Loop

- 앱의 main run loop는 유저와 관련된 모든 이벤트를 처리한다.
- `UIApplication` 객체는 앱 시작 시, 메인 런 루프를 설정한다. 이를 이벤트 처리와 뷰 기반 인터페이스 갱신에 사용한다.
- 앱의 메인 스레드에서 동작한다.
- 관련 이벤트가 들어온 순서대로 순차적으로 처리된다.

<img src="https://tva1.sinaimg.cn/large/006y8mN6gy1g7d201ev4pj31an0u00zm.jpg" alt="image-20190926183618302" style="zoom:67%;" />

- 유저 상호 작용과 관련된 이벤트가 OS에 의해 생성된다.
- UIKit에 의해 설정된 특별한 포트를 통해 앱에 전달된다.
- 앱 안의 이벤트 큐에 이벤트들이 넣어진다.
- 실행을 위해 메인 런 루프에 넣어진다.
- `UIApplication` 객체는 이벤트를 받아서 무엇이 행해져야 하는지 결정을 내리는 첫번째 객체이다.



## 2 - MVC 패턴

###  요구 사항 / 추가 내용

- 재고 추가 버튼을 누르면 각 상품의 재고를 추가
  - 재고 추가 버튼 누르고 나면 전체 레이블 다시 표시
- 금액 입력 버튼을 누르면 해당 금액 추가
  - 금액 추가 후 잔액 레이블 다시 표시



### 실행 결과

<img src="assets/step2.gif" alt="step2" style="zoom:70%;" />

