# 단계별 구현 내용 및 실행 화면

**2단계 MVC 패턴**

- 현 단계에서 불필요한 코드 삭제
- `UICollectionView`와 커스텀 `UICollectionViewCell`을 사용하여 `BeverageCell`을 구현 및 표시
- `BeverageCell`의 `추가` 버튼을 누르면 노티피케이션이 포스트되고 `ViewController`에서 이를 옵저빙 하여 음료를 추가하고 컬렉션 뷰를 리로드 

*실행화면*

![vendingmachineapp-step2](/Users/dongkun/Desktop/CodeSquad/swift-vendingmachineapp/images/vendingmachineapp-step2.png)



# 진행 방법

- 음료수 자판기 iOS 앱에 요구사항을 파악한다.
- 요구사항에 대한 구현을 완료한 후 자신의 github 아이디에 해당하는 브랜치에 Pull Request(이하 PR)를 통해 코드 리뷰 요청을 한다.
- 코드 리뷰 피드백에 대한 개선 작업을 하고 다시 PUSH한다.
- 모든 피드백을 완료하면 다음 단계를 도전하고 앞의 과정을 반복한다.

# 코드 리뷰 과정
> 저장소 브랜치에 자신의 github 아이디에 해당하는 브랜치가 존재해야 한다.
>
> 자신의 github 아이디에 해당하는 브랜치가 있는지 확인한다.

1. 자신의 github 아이디에 해당하는 브랜치가 없는 경우 브랜치 생성 요청 채널을 통해 브랜치 생성을 요청한다.
프로젝트를 자신의 계정으로 fork한다. 저장소 우측 상단의 fork 버튼을 활용한다.

2. fork한 프로젝트를 자신의 컴퓨터로 clone한다.
```
git clone https://github.com/{본인_아이디}/{저장소 아이디}
ex) https://github.com/godrm/swift-vendingmachineapp
```

3. clone한 프로젝트 이동
```
cd {저장소 아이디}
ex) cd swift-vendingmachineapp
```

4. 본인 아이디로 브랜치를 만들기 위한 checkout
```
git checkout -t origin/본인_아이디
ex) git checkout -t origin/godrm
```

5. commit
```
git status //확인
git rm 파일명 //삭제된 파일
git add 파일명(or * 모두) // 추가/변경 파일
git commit -m "메세지" // 커밋
```

6. 본인 원격 저장소에 올리기
```
git push origin 본인_아이디
ex) git push origin godrm
```

7. pull request
8. pull request는 github 서비스에서 진행할 수 있다.
9. pull request는 반드시 original 저장소의 브랜치와 fork한 자신의 저장소 브랜치 이름이 같아야 하며, 브랜치 이름은 자신의 github 아이디여야 한다.
10. code review 및 push
11. pull request를 통해 피드백을 받는다.
12. 코드 리뷰 피드백에 대한 개선 작업을 하고 다시 PUSH한다.

## 앞의 코드 리뷰 과정은 [영상 보기](https://www.youtube.com/watch?v=ZSZoaG0PqLg) 를 통해 참고 가능

## 실습 중 모든 질문은 슬랙 채널에서...