## step1 결과물
![resultStep1](images/result_step1.png)

## step1 질문 자료
* 실제 코드
``` Swift
let coffee : Beverage = Beverage.init(brand: "스타벅스", volume: 255, price: 4100, name: "아메리카노", manufactured: Date().returnStringDate("20210101")
let milk : Beverage = Beverage.init(brand: "매일우유", volume: 180, price: 1300, name: "흰 우유", manufactured: Date().returnStringDate("20210102"))
let soda : Beverage = Beverage.init(brand: "롯데칠성음료", volume: 330, price: 2500, name: "트레비", manufactured: Date().returnStringDate("20210103"))
```

* 출력 결과
![resultStep1](images/result_step1.png)


### Step2 작업 목록

* 음료수 관련
- [x] 음료를 상속하는 서브 클래스 설계
- [x] 하위 클래스의 속성 추가
- [x] 속성에 대한 인터페이스 작성

* 자판기 관련
- [x] 자판기 금액 증가 메소드
- [x] 특정 상품 증가 메소드
- [x] 현재 금액으로 구매 가능 음료 목록 반환하는 메소드
- [x] 음료수 구매 관련 메소드
- [x] 잔액 확인 메소드
- [x] 전체 상품 재고 반환하는 메소드
- [x] 유통기한이 지난 재고만 리턴하는 메소드
- [x] 따뜻한 음료만 리턴하는 메소드
- [x] 시작이후 구매 상품 이력을 배열로 리턴하는 메소드

* 테스트 함수 관련
- [x] 구매 가능한 음료수 목록 반환하는 메소드
- [x] 따뜻한 음료만 반환하는 메소드
- [x] 유통기한이 지나지 않은 음료수만 리턴하는 메소드

### 학습 키워드

* 클래스별 역할 책임 분배
* FactoryMethod 관련
* 다운 캐스팅 관련

### 고민과 해결

* vendingMachine에 추가할 때, 매개변수로 최상위 클래스만 넣으려고 노력했습니다. 처음엔 다운 캐스팅, 옵셔널 바인딩을 활용하여 함수안에 모든 하위 클래스에 대한 if (옵셔널 바인딩) {addMethod as ? 하위클래스}