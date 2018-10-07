# VendingMachineApp

# Step1
> 이전 자판기 과제에서 main , InputView , OutputView 를 제외한 코드 재사용

### 재사용 하는 과정에서 변경 내용
1. InputView , OutputView 없이 사용
    이전 : Model 역할을 하는 함수 안에서 입력 받고 출력까지 함
    변경 : 매개 변수로 입력 받는 것 대체 , 리턴 사용하여 출력 하는 것 대체
2. For 문 안에 if 조건 하나만 있는 경우에는 for_where 사용하여 대체

### 객체
- AdminMode : 관리자모드
- Beverage : 음료 객체 중 최상위
- Cash : 잔돈 - VendingMachine 객체에서 참조
- Coffee : 커피 카테고리 객체와 하위 객체 존재
- Error : 에러 관련 객체
- History : 구매내역 - VendingMachine 객체에서 참조
- Menu : 메뉴 , 모드 종류 나타내는 객체
- Milk : 우유 카테고리 객체와 하위 객체 존재
- Soda : 탄산 카테고리 객체와 하위 객체 존재
- Stock : 처음 재고를 만들 때 사용되는 객체 (음료를 랜덤으로 만듬)
- UserMode : 사용자모드
- Utility : 각 객체들에서 필요한 유틸리티 모음
- VendingMachine : Controller 역할을 하는 객체

### 첨부파일
![Step1](CaptureImage/Step1.png)

# Step2
> 화면 구성 및 버튼과 라벨 기능 활성화

### 작업내용
1. 재고 초기화 할 때 랜덤 생성이 아닌 전체 생성으로 변경 (수량은 랜덤)
2. 재고 추가 및 전체 레이블 다시 표기
3. 잔액 추가 및 레이블 표기
4. 프린트 대신 에러 메세지 출력하는 레이블 생성
5. 이미지 모서리 둥글게 만들기 : CALayer 활용 - [CALayer - Core Animation | Apple Developer Documentation](https://developer.apple.com/documentation/quartzcore/calayer)

### 참고 - CALayer
: 이미지 기반 컨텐츠를 관리하는 객체로서 애니메이션 효과, 계층구조, 모양, 내용 등과 관련한 작업을 할 수 있습니다.

### 첨부파일
![Step2 Demo](CaptureImage/Step2Demo.mov)
