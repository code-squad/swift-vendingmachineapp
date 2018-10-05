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
