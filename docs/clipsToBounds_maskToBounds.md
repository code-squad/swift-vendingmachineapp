### maskToBounds, clipsToBounds

- masksToBounds, clipsToBounds 두 개의 프로퍼티 기능이 똑같다고 볼 수 있다.
- 둘의 불러오는 곳이 다르다.
	- View.layer.masksToBounds
	- View.clipsToBounds
	- 뷰를 기준으로 뷰 밖에 있는 내용이 짤리게 된다.
	- 뷰의 테두리가 기준