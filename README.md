# 자판기 앱

### 프로그래밍 요구사항

- 객체지향 프로그래밍 방식으로 아래 예시 음료를 추상화하는 클래스(class)를 설계한다.
  - (자기만의 기준으로) 클래스 이름을 정한다.
  - 필수 속성 : 브랜드(String), 용량(Int), 가격(Int), 이름(String), 제조일자(Date)
  - 우유 - 딸기우유, 초코우유, 바나나우유 택 1
  - 탄산음료 - 콜라, 사이다, 환타 택 1
  - 커피 - TOP, 칸타타, 조지아 택 1
- 음료 상품 클래스 출력을 위해서 CustomStringConvertible 프로토콜을 추가하고 구현한다.
- ViewController 에서 특정한 음료수 객체 인스턴스를 클래스별로 구분해서 print() 함수로 출력한다.
  - 출력 형식 예시 : `제조사, 용량, 가격, 브랜드, 제조일자`

### 상속 관계 

```
beverage    										            	1단계
		Milk , Soda , Coffee							        2단계
			StrawberryMilk, DietCola, TopAmericano. 3단계
```

각 상품에 대해  클래스 객체로 구분하기 위해  상품명을 클래스로 만들어 구성하였습니다

상품들은 각각의 브랜드가 있기 때문에 브랜드는 미리 지정을 하고 이름,가격,용량,제조일자 받도록 하였습니다 

<img width="424" alt="스크린샷 2021-02-23 오후 3 50 31" src="https://user-images.githubusercontent.com/33626693/108810698-0cf5c900-75ef-11eb-80dd-f53ca0a69c4f.png">



## MVC 패턴

### 프로그래밍 요구사항

- 각 상품에 대한 재고 추가 버튼을 추가한다.
  - 각 상품에 대한 이미지를 추가한다.
  - 각 상품에 대한 재고 레이블을 추가한다.
  - 1000원, 5000원 금액을 입력하는 버튼을 추가한다.
  - 현재 잔액을 표시할 레이블을 추가한다.
- 각 상품의 재고 추가 버튼을 누르면 각 상품 재고를 추가하도록 코드를 구현한다.
- 재고 추가 버튼을 누르고 나면 전체 레이블을 다시 표시한다.
- 금액 입력 버튼을 누르면 해당 금액을 추가하도록 코드를 구현한다.
- 금액을 추가하고 나면 잔액 레이블을 다시 표시한다.

![ezgif com-video-to-gif-8](https://user-images.githubusercontent.com/33626693/109758975-ad6f6d00-7c2f-11eb-86f3-d9c42d005488.gif)



## 구매목록 View 코드

- 스크롤 가능하도록 UIScrollView에 대해 학습한다.
- 구매 목록에 대한 제품 이미지뷰를 동적으로 코드로 직접 View에 추가한다.

- 실행이후 구매 목록을 화면 아래 이미지로 추가한다.
- 화면 아래 부분을 좌우로 스크롤 가능하도록 만들고 상품 이미지를 추가한다. 계속 추가해도 스크롤할 수 있어야 한다.
- 특정 제품을 구매할 때마다 해당 제품 이미지를 추가하도록 구현한다.
- 특정 시점에 `self.scrollView.addSubView()` 메서드로 UIImageView를 수동 추가한다

![ezgif com-video-to-gif-9](https://user-images.githubusercontent.com/33626693/111428886-7f178480-873b-11eb-8266-c0b7ffd17118.gif)

---

##  Step7 관리자 페이지

### 프로그래밍 요구사항

- 새로운 ViewController를 옆에 추가하고, Button에서 Segue를 연결한다.
- Segue를 선택하고 Kind를 Present Modally로 지정하고, Transition을 Flip Horizontal로 설정한다.

- 새롭게 추가한 화면을 관리자 모드로 동작하도록 개선한다.
  - 이미지와 재고 추가 버튼을 복사해서 관리자 화면으로 복사하고, 동작하도록 코드를 수정한다.
  - 재고 추가 버튼은 기존 화면에서 삭제한다.
  - 관리자 화면에 [닫기] 버튼을 추가하고, 버튼을 누르면 dissmiss()를 호출한다.

![ezgif com-video-to-gif-10](https://user-images.githubusercontent.com/33626693/111721315-f74c8a00-88a2-11eb-8d1c-5eef4f21cfb7.gif)

