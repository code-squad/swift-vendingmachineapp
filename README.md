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