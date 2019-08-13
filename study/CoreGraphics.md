# iOS 좌표 시스템 

# Core Graphics Example

2D 파이그래프를 그리는 방법은 여러 가지 방법이 있는데, 공통적으로 UIView의 `override func draw(_ rect:CGRect)` 메서드 내에서 구현해야 합니다.



### 0. 선행 요구지식

- 삼각함수와 좌표계에 대한 이해



### 1.  Basic 

```swift
override func draw(_ rect: CGRect) {
        let initialAngle: CGFloat = -CGFloat.pi * 0.5
        let frameSize = min(frame.size.height, frame.size.width)
        let boundSize = min(bounds.size.height, bounds.size.width)
        let radius = frameSize * 0.5
        let center = CGPoint(x: boundSize * 0.5, y: boundSize * 0.5)
        let totalCount = calculateTotalCount()
        var startAngle = initialAngle
        makePieGraph(start: startAngle, radius: radius,
                     center: center, totalCount: totalCount)
        startAngle = initialAngle
        makeLabelsForPieGraph(start: startAngle, radius: radius, 
                              center: center, totalCount: totalCount)
}
```

- draw 함수를 재정의 하는 과정에서 원을 그리는데 필수적인 radius, center, 그리고 시작Angle을 설정합니다. 
- totalCount는 각 pi의 proportion을 지정하여 angle을 계산하기 위해서 입니다.
- addElipse 메서드는 타원을 그려넣는 것인데, Arc로 비율만큼 계산해야 하므로 제외합니다.



### 2. BezierPath 를 활용하여 파이 그리기 샘플코드

``` swift
var index = 0
for drink in historySet.enumerated() {
  	let value = drink.element.value
  	let proportion = CGFloat(CGFloat(value)/CGFloat(totalCount))

  	endAngle += CGFloat.pi*2*proportion
 	 /// 색 설정
 	 if index >= colorList.count {
 	   index = 0
	  }
 	 let path = UIBezierPath(arcCenter: center,
          	               radius: radius-radius/1.5,
          	               startAngle: startAngle,
         	                 endAngle: endAngle,
         	                 clockwise: true )
   path.lineWidth = 76
 	 colorList[index].setStroke()
 	 path.stroke() ///실제 그리는 메서드 
 	 index += 1
 	 startAngle = endAngle
}
```

- BezierPath를 활용해서도 위와 같이 그림을 그릴 수 있습니다.
- 기본적으로 UIBezierPath 이니셜라이저중에 원점과 반지름을 중심으로 각도에 따라 원을 그릴 수 있는 방법이 존재합니다. 
  - clockwise는 true로 설정합니다.
- lineWidth를 통해 선 굵기를 지정합니다.
- .stroke() 메서드는 실제 path를 그리는 메서드입니다.



### 3. UIGraphicsGetCurrentContext 를 활용하여 파이 그리기

```swift
private func makePieGraph(start: CGFloat, radius: CGFloat, 
                          center: CGPoint, totalCount: Int){
        var startAngle = start
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        for drink in historySet.enumerated(){
            let endAngle = startAngle + 2 * .pi * 		
          								(CGFloat(drink.element.value)/CGFloat(totalCount))
            drawArcsInPieGraph(drinkName: drink.element.key, context: context,
                              center: center, radius: radius,
                              startAngle: startAngle, endAngle: endAngle)
            startAngle = endAngle
        }
        addGlowGradient(context: context, center: center, radius: radius)
}
    
private func drawArcsInPieGraph(drinkName: String, context: CGContext, 
                                center: CGPoint, radius: CGFloat,
                                startAngle: CGFloat, endAngle: CGFloat) {
        guard let currentCGColor = colorSet[drinkName] else{
            return
        }
        context.setFillColor(currentCGColor)
        context.move(to: center)
        context.addArc(center: center, radius: radius,
                       startAngle: startAngle, endAngle: endAngle, clockwise: false)
        context.fillPath()
}
```

- UIGraphicsGetCurrentContext 로 `CGContext` 클래스를 생성합니다. 
- 시작각도로부터 `2 * pi * 비율` 만큼 더한 값을 끝각도로 설정한다. 원에서 파이를 그리는 수학 공식을 참고
- context.setFillColor() 로 색상을 지정합니다.
- Arc를 그릴 중앙 지점으로 context를 이동합니다.
- `addArc(center:radius:startAngle:endAngle:clockwise:)` 를 통해 반지름과 원점, 시작각도와 끝 각도를 설정합니다. 
- BezierPath로 호를 그릴때와는 달리 clockwise는 false로 두는데, true로 두는 경우 그림이 원하는 모습대로 나타나지 않습니다. 
- 처음에 무엇을 잘못 설정했는지 구현 과정에서 그래프 모양이 부채꼴이 아니라 현의 모양으로 그림이 그려졌었습니다.. angle이 `radian` 값임에, center의 위치가 바뀌지는 않는지 등에 유의해야합니다.



### 4. Label 설정하기

#### 요구사항 

- 우선 model에 저장하고 있는 정보가 String 데이터 타입인 경우, draw 메서드를 지니고 있지 않기 때문에 NSString 클래스로 타입캐스팅을 해야 합니다.
- `func draw(in rect: CGRect, withAttributes attrs: [NSAttributedString.Key : Any]? = nil)` 메서드는 텍스트가 위치할 도형 정보와 속성값을 필요로 합니다. 
  - 또한 CGRect는 좌상단의 origin과 CGSize(width, height) 정보가 필요합니다.

#### How to?

- 코드레벨에서 텍스트 상자를 화면에 설정하는 것은 상당히 까다로운 작업이 됩니다. 우선 다음과 같이 `NSParagraphStyle` 프로퍼티와 `[NSAttributedString.Key: Any]` 프로퍼티를 설정해줍니다.

  ```swift
  private let paragraphStyle: NSParagraphStyle = makeParagrapheStyle()
      
  private lazy var textAttributes: [NSAttributedString.Key: Any] = [
          .paragraphStyle: self.paragraphStyle,
          .font: UIFont.systemFont(ofSize: 20),
          .foregroundColor: UIColor.black
  ]
      
  private static func makeParagrapheStyle() -> NSParagraphStyle {
          let style = NSMutableParagraphStyle()
          style.alignment = .center
          return style.mutableCopy() as! NSParagraphStyle
  }
  ```

- 내부 프로퍼티로는 무엇을 설정하든지 상관없긴한데,  `[NSAttributedString.Key: Any]` 는 NSString의 `.draw` 메서드를 쓰는데 있어서 필요한 속성 딕셔너리이므로 반드시 생성해야 합니다.
- `paragraphStyle` 프로퍼티는 단락의 정렬 방식등을 설정하는 프로퍼티로 `NSMutableParagraphStyle` 클래스를 생성하여 값을 변형한 후, **immutable객체** 인  `NSParagraphStyle` 형태로 타입캐스팅을 합니다.

- 다음으로는 각각의 start~endAngle의 중간값을 설정하고, Arc의 가운데 부근에 label이 위치하도록 CGRect를 수정하는 작업을 수행합니다.

  ```swift
  let halfAngle = startAngle + (endAngle - startAngle)/2
  let labelText = drink.element.key as NSString
  let textRenderSize = labelText.size(withAttributes: textAttributes)
  ```

- 텍스트의 크기 역시 속성으로 위에서 만든 딕셔너리를 참고하여 (폰트 사이즈 등의 정보가 담겨있으므로) 텍스트의 크기를 지정합니다. 데이터 타입은 `CGSize` 로 **width** 값과 **height** 값을 지닙니다.

- 다음으로 textLabel의 center값을 설정합니다. 실제 도형의 센터값으로부터 반지름의 일정 부분만큼 이동한 거리를 계산합니다. 이동할 거리를 계산하는데 중요한 정보는 위에서 계산한 `halfAngle` 값입니다.

  ```swift
  //...func 내에서 텍스트의 origin 좌표계산	
  let textLabelCenter = center //도형의 원점좌표와 같은 값으로 초기화
  let rectOriginPoint = textLabelCenter.project(by: radius, center: center, angle: halfAngle)
  //...
  
  extension CGPoint {
      /// 중점 좌표로부터 보정된 반지름 만큼의 각도를 따라
      /// x방향으로 radius * cos(angle)
      /// y방향으로 radius * sin(angle)
      /// 만큼 떨어진 좌표를 text label의 origin 좌표로 둔다.
      func project(by radius: CGFloat, center: CGPoint, angle: CGFloat) -> CGPoint {
          let tunedRadius = 0.6 * radius
          let labelX = center.x + tunedRadius * cos(angle)
          let labelY = center.y + tunedRadius * sin(angle)
          let labelOriginPoint = CGPoint(x: labelX, y: labelY)
          return labelOriginPoint
      }
  }
  ```
  - 대각선 이동 거리 (radius)와 각도가 주어졌을 때, 이를 바탕으로 x의 이동방향과 y의 이동방향을 구하기 위해서는 cos, sin을 사용합니다. (자세한 내용은 삼각형 사인법칙과 코사인 법칙을 참고합니다.)

  

- CGPoint에 대한 extention 으로 보정된 점 좌표를 계산하는 메서드를 구현하였습니다. 전체 radius에 대해 일정 비율로 조정하여 Arc 호 면적 내에 텍스트가 오도록 지정합니다. 

- label의 origin 포인트에 대한 계산이 끝났습니다. 이를 바로 CGRect의 origin에 적용하게 되는 경우, 다른 그래프 영역을 텍스트가 침범하는 모양이 되어 보기 좋지 않습니다. 이를 조정합니다. 저 같은 경우 위에서 구한 텍스트박스의 width, height를 기준으로 origin의 x,y 값을 좌상단으로 보정하였습니다. 

  ```swift
  let rectCenterPoint = CGPoint.init(x: rectOriginPoint.x - textRenderSize.width * 0.5,
                                     y: rectOriginPoint.y - textRenderSize.height * 0.5)
  ```

- 이제 텍스트가 위치할 CGRect를 생성합니다.

  ```swift
  let textLabelRect = CGRect(origin: rectCenterPoint, size: textRenderSize)
  ```

- 마지막으로 아래와 같이 NSString 값을 그려줍니다.

  ```swift
  labelText.draw(in: textLabelRect, withAttributes: textAttributes)
  ```



### 5. Gradient 적용하기



```swift
private func addGlowGradient(context: CGContext, center: CGPoint, radius: CGFloat) {
		let colorSpace = CGColorSpaceCreateDeviceRGB()
		let colorComponents : [CGFloat] = [
		 ///  R    G    B    A
		 			1.0, 1.0, 1.0, 0.8,
					 0.9, 0.9, 0.9, 0.0,
		]
		let locations : [CGFloat] = [0.1, 0.9]
		guard let glowGradient = CGGradient.init( colorSpace: colorSpace,
                 		                          colorComponents: colorComponents,
											                        locations: locations,
						                                  count: locations.count ) else { return }
     context.drawRadialGradient(glowGradient, startCenter: center,
																startRadius: 1, endCenter: center,
                                endRadius: radius, options: [])
}
```

- 호를 그리는데 있어서 gradient 적용함수를 반복해서 호출할 필요는 없습니다.
- context에서 Gradient를 적용하는 방법은 여러가지가 있는데, 호를 그리기 때문에 drawRadialGradient를 통해서 그라데이션 효과를 주도록 합니다. 
- CGGradient 클래스를 생성해서 인자로 전달해줘야하는데, 이를 위해서는 CGFlot 배열과 CGColorSpace 값이 필요합니다.
  - CGColorSpace를 전달인자로 넘기는 이유는 모르겠으나, context에서 옵셔널값으로 존재하는 colorSpace를 호출하거나 위와 같이 `CGColorSpaceCreateDeviceRGB` 로 생성합니다.
  - colorComponents 값은 어떠한 색상의 광원효과를 주려고 하는지 Begin/End 각각의 RGBA 값을 CGFloat으로 전달하면 됩니다.
  - locations 값은 광원이 작동할 범위를 나타냅니다. start~end로 [0.0 ~ 1.0] 사이의 값을 전달합니다. 
    - 여러 값을 전달하는 경우 보다 다양한 광원효과를 낼 수 있습니다.
  - count는 locations 배열의 원소 개수를 전달합니다. 
- 이렇게 만든 CGGradient 클래스 인스턴스를 메서드의 첫번째 인자로 전달하고, 나머지는 원을 그리는 방식과 유사합니다.



### 학습 Reference

- https://www.raywenderlich.com/349664-core-graphics-tutorial-arcs-and-paths
- https://www.raywenderlich.com/411-core-graphics-tutorial-part-1-getting-started#toc-anchor-015
- http://www.mathopenref.com/chordsintersecting.html
- https://blog.slaunchaman.com/tag/cgcolorspace/
- https://devmjun.github.io/archive/CoreGraphics-2#section-id-170
- https://developer.apple.com/documentation/coregraphics/cgcolorspace?language=objc
- https://developer.apple.com/documentation/uikit/uibezierpath/1624367-addarc
- https://stackoverflow.com/questions/39937142/where-is-the-cgcolorspace-for-rgba
- https://www.hackingwithswift.com/example-code/core-graphics/how-to-draw-a-circle-using-core-graphics-addellipsein