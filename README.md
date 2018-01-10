# Vending Machine App

## iPad 프로젝트 설정
- General - Deployment Info: 
	- Devices: iPad
	- Device Orientation: Landscape Left, Landscape Right 만 체크
- 시뮬레이터: 아이패드 프로 10.5

### 레벨2 VendingMachine 코드 복사
- **기존 코드**들은 대부분 **Model 역할**을 담당
- iOS 앱 구조는 MVC 중에서도 우선 **ViewController-Model 관계부터 집중**하고, ViewController-View 관계는 다음 단계에서 개선한다.

### 기본 자판기 모델 적용
- 레벨 2에서 구현한 ActivateMode 프로토콜, 프로토콜을 채택한 AdminMode, UserMode 구조체 제거
	- 모드 및 모드별 메뉴를 입력받아 선택된 메뉴의 기능 수행하고 출력(InputView, OutputView)하는 역할이었으나, UI로 대체할 수 있는 부분이므로 제거함
- ViewController 클래스에서 VendingMachine 객체를 사용하여 음료 객체를 추가하고 재고목록을 출력
	- ActivateMode 타입이 제거되어 VendingMachine의 함수를 그대로 사용함

### 학습 내용

>- **[앱 인터페이스와 구성요소]()**
>- **[시스템 프레임워크 - 1. 앱 초기화 과정]()**
>- **[시스템 프레임워크 - 2. 메인 런 루프]()**
>- **[시스템 프레임워크 - 3. 메인 런 루프]()**
>- **[시스템 프레임워크 - 4. 앱 생명주기]()**
>- **[시스템 프레임워크 - 5. iOS와 코코아 터치 프레임워크]()**

2017-01-09 (작업시간: 1일)

<br/>

## 주요 작업 내용 1

![캡쳐이미지]()

### 핵심 기능 1

<br/>