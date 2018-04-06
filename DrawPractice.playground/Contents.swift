//: Playground - Draw arc practice for step8 requirements
import UIKit


class practiceView: UIView {

}

let path = UIBezierPath()

path.move(to: CGPoint(x: 20,y: 30))
path.addLine(to: CGPoint(x:70, y: 100))
path.addLine(to: CGPoint(x:30, y: 100))

path.close()

UIColor.green.setFill()
path.fill()
path.stroke()

let redColor = UIColor.red
redColor.setStroke() // Stroke subsequent views with a red color
let roundedRectagle = CGRect(x: 0,y: 0, width: 90,height: 20)
let rectangleBorderPath = UIBezierPath(roundedRect: roundedRectagle,cornerRadius: 5)
rectangleBorderPath.lineWidth = 3.0
rectangleBorderPath.stroke() // Apply the red color stroke on this view
// Test Getting Radians
(2/3)*3.14

extension BinaryInteger {
    var degreesToRadians: CGFloat { return CGFloat(Int(self)) * .pi / 180 }
}

extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}

120.degreesToRadians
((CGFloat(5)/CGFloat(15))*CGFloat(360)).degreesToRadians



func draw(_ rect: CGRect) {
    let size = rect.size
    let centerX = size.width / 2
    let centerY = size.height / 2
    let centerPoint = CGPoint(x: centerX, y: centerY)
    let radius = max(size.width, size.height) / 2
    let startAngle: CGFloat = 0
    let endAngle: CGFloat = CGFloat(120).degreesToRadians
    let path = UIBezierPath(arcCenter: centerPoint,
                            radius: radius,
                            startAngle: startAngle,
                            endAngle: endAngle,
                            clockwise: true)
path.addLine(to: centerPoint)
    path.close()

}

draw(CGRect(x: 0, y: 0, width: 400, height: 400))
