# VendingMachineApp

### 1. 아이패드 앱 - 시작하기
* 프로젝트에 대한 일반 설정 (General)에서 Devices 항목을 iPad로 변경하고, Device Orientation 항목을 가로(Landscape Left, Landscape Right)만 선택함

##### 실행결과 

<img src=".images/vendingmachineapp-result-1.png"></img>

##### App Programming Guide for iOS
* iOS 앱을 구성하는 핵심 객체들과 iOS 메인 런루프 동작 이해하기 위해서 [애플 앱 프로그래밍 가이드](https://developer.apple.com/library/content/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40007072) 문서를 학습함
* macOS 프로젝트 템플릿과 iOS 프로젝트 템플릿 구조의 차이점을 학습함
    * iOS 프로젝트에는 main.swift 가 생략되어 있음
    * `UIApplicationMain() 함수의 역할` 에 대해 찾아보고 학습함

##### [UIDeviceOrientation](https://developer.apple.com/documentation/uikit/uideviceorientation)
* The physical orientation of the device.

### 2. MVC 패턴

##### 요구사항
* iOS 앱 프로젝트 기본 구조인 MVC 형태에 맞춰서 기존 레벨2에서 작성한 자판기 소스 파일을 적용함
* iOS 프로젝트와 앱을 구성 핵심 요소들을 MVC로 구분하면 다음과 같음
    * 레벨2 자판기에서 View에 해당하는 InputView와 OutputView는 스토리보드나 코드로 작성하는 화면요소로 대체함
    * 이제 특별한 요구사항이 없을 경우 `print() 함수로 출력하는 경우는 지양함`

<img src=".images/vendingapp-app-MVC.png" src="45%"></img>
<img src=".images/vendingapp-MVC.png" src="45%"></img>

##### 프로그래밍 요구사항
* 아이패드 앱을 구현함
    * 각 상품에 대한 재고 추가 버튼을 추가함
    * 각 상품에 대한 이미지를 추가함
    * 각 상품에 대한 재고 레이블을 추가함
    * 1000원, 5000원 금액을 입력하는 버튼을 추가함
    * 현재 잔액을 표시할 레이블을 추가함
    * 각 상품의 재고 추가 버튼을 누르면 각 상품 재고를 추가하도록 코드를 구현함
* 재고 추가 버튼을 누르고 나면 전체 레이블을 다시 표시함
* 금액 입력 버튼을 누르면 해당 금액을 추가하도록 코드를 구현함
* 금액을 추가하고 나면 잔액 레이블을 다시 표시함

##### 실행결과

<img src=".images/vendingmachineapp-result-2.png"></img>

##### [CALayer](https://developer.apple.com/documentation/quartzcore/calayer)
* 이미지 라운드 처리

```swift
private func setRoundedImages() {
    beverageImages.forEach({
        $0.layer.cornerRadius = 50.0
        $0.layer.masksToBounds = true
        $0.backgroundColor = UIColor.white
    })
}
```
