## step-1 

- 설명

  - 음료를 추상화하기 위해 여러 클래스들을 설계하고 제작하였다.
  - 우선 VendingMachine타입 이 안에는 자판기가 갖고있는 drinks를 속성으로 갖고 있다. 그리고 음료수를 추가하는 add()메소드, 갖고있는 음료수들을 출력하는 printDrinks()메소드가 구현되어있다.
  - Drinks타입은 음료수들을 지칭하는 타입이다. drinks를 Beverage타입을 배열형태로 갖는 속성이다. 그리고 add(), printDrinks()메소드를 갖고있다.
  - Beverage는 음료수를 지칭하는 타입이다. 브랜드(String), 용량(Int), 가격(Int), 이름(String), 제조일자(Date)의 속성을 갖는다.
  - 그 외 Coffee, Soda, Milk타입은 Beverage를 상속받았고 그리고 그 하위타입 TOP, Cola, StrawberryMilk는 앞에 언급한 3개의 타입들을 각각 상속하였다.

  

- 실행화면

<img width="389" alt="스크린샷 2021-02-24 오후 10 47 59" src="https://user-images.githubusercontent.com/42647277/109010462-241ddf00-76f3-11eb-94e6-36ac68172926.png">

- 완성 날짜

  2021-02-24 22:53
