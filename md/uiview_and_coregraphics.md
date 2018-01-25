## UIView와 Core Graphics 개요
### UIView: 눈에 보이는 모든 클래스의 슈퍼 클래스
- frame, bounds: CGRect
- superview: UIView
- subviews: NSArray
- layer: CALayer
- drawRect()
- addSubview()
- removeFromSuperview()
- setNeedsDisplay()
- setNeedsLayout()
- beginAnimation()

### drawRect() 메소드
- 뷰나 하위 뷰가 업데이트될 때 UIView이 drawRect() 메소드가 호출된다. 따라서 무언가를 그려야 한다면 drawRect()에 구현하면 된다.

### 컨텍스트 가져오기
- 모든 뷰는 자신의 컨텍스트를 가진다. 이 컨텍스트 위에 그래픽을 그릴 수 있다. 즉 도화지 같은 것이다. 따라서 현재 뷰의 컨텍스트를 가져와야 하는데, UIGraphincGetCurrentContext()를 이용한다.
- context.flush(): 컨텍스트가 가지고 있던(미뤄진) 작업들을 즉시 렌더링하도록 강제하는 함수. 주로 컨텍스트를 가져온 후 실행하여 컨텍스트를 깨끗이 하는 데 쓰임

### Core Graphics
2D 드로잉 처리를 지원하는 프레임워크. 그래픽 메모리의 버퍼를 직접 다루기 때문에 아주 빠르다.

### 컨텍스트 상태 저장하기
- 한 가지 펜이나 붓으로 모든 그림을 그리지 않듯이, 여러 속성의 선 등을 그릴 때도 그래픽 속성을 자주 바꿔줘야 한다. 이렇게 붓이나 펜을 바꿀 시 상태가 뒤죽박죽 될 수 있기 때문에 컨텍스트의 상태를 저장하고 원하는 상태를 세팅한 후 다시 복원해줘야 한다.
- 따라서 CGContextSaveGState(ctx)로 상태를 저장한 후, 펜을 바꿔 그림을 그린 후 다시 원상태로 복귀 시 CGContextRestoreGState(ctx)를 사용한다.

### 이미지나 패스를 그릴 때
- UIKit의 UIImage나 UIBezierPath 객체는 코어그래픽에 대응하는 메소드를 가지고 있다. 따라서 좀 더 적은 코드를 사용하여 그릴 수 있는데, 내부적으로는 코어그래픽을 사용하여 그림을 그린다.
- CGPath는 한 번 쓰고나면 새로 만들어야 하므로 재사용이 매우 어렵다. 반면, UIBezierPath는 속성을 바꿔서 쉽게 재사용할 수 있다. 
- UIBezierPath는 선, 곡선, 사각형, 원, 둥근 사각형, 원호의 형태로 생성할 수 있으며, subpath를 추가하여 복잡한 모양을 그릴 수도 있다.
