# Step 1

- SuperClass 생성
- subClass를 상속으로 확장.
- VendingMachine Class 생성


# Step 2
음료의 계층화
- Beverage (1단계)
    - Milk, Soda, Coffee (2단계)
        - BananaMilk, ChocoMilk (3단계)
        - Coke, Cider
        - Americano, Latte

- Beverage 서브클래스와 고유 속성 구현
- Beverage를 관리하는 Dictionary 타입의 Beverages 구현
- VendingMachine 구조체 구현
- Beverage를 생산하는 Factory 구현
- XCTest로 기능 검사 및 수정

# Step 3
- Beverages의 [Beverage:Int] 딕셔너리를 [ObjectIdentifier:[Beverage]]로 수정
- type.init()을 사용하기 위한 팩토리 메소드 수정 (type.make()로 구현)
- 음료수 이미지 스토리보드로 추가 및 속성 설정
- 음료수 재고 추가 버튼, 레이블 인스턴스를 ViewController와 매핑
- 금액 추가 버튼, 레이블 인스턴스를 ViewController와 매핑

<p align="center">
<img width="800" alt="step3" src="https://user-images.githubusercontent.com/45817559/110775848-bd77f400-82a2-11eb-947e-fedc995546cf.gif">
</p>
