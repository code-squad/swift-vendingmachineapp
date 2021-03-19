import UIKit

struct Segment {
    
    var color: UIColor
    
    var value: CGFloat
    
}

class PieGraphView: UIView {
    
    var segments = [Segment]() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isOpaque = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        
        let currentContext = UIGraphicsGetCurrentContext()
        
        let radius = min(frame.size.width, frame.size.height) * 0.5
        
        let viewCenter = CGPoint(x: bounds.size.width * 0.5, y: bounds.size.height * 0.5)
        
        let valueCount = segments.reduce(0, {$0 + $1.value})
        
        var startAngle = -CGFloat.pi * 0.5
        
        let drinkInfo = ["초코에몽", "딸기꿀단지", "코카콜라", "스프라이트", "TOP", "칸타타"]
        
        
        var index = 0
        
        for segment in segments {
            
            currentContext?.setFillColor(segment.color.cgColor)
            
            let endAngle = startAngle + 2 * .pi * (segment.value / valueCount)
            
            currentContext?.move(to: viewCenter)
            
            currentContext?.addArc(center: viewCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            
            currentContext?.fillPath()
            
            drawDrinkName(center: viewCenter, length: radius/2, angleA: startAngle, angleB: endAngle, text: drinkInfo[index])
            
            index+=1
            
            startAngle = endAngle
        }
    }
}


//MARK:- Add Text on Pie Chart
extension PieGraphView {
    
    private func returnEndpoint(center: CGPoint, length: CGFloat, angle: CGFloat) -> CGPoint {
        return CGPoint(x: center.x + length * cos(angle), y: center.y + length * sin(angle))
    }
    
    private func returnCenterPoint(angleA: CGFloat, angleB: CGFloat) -> CGFloat {
        return (angleA + angleB) / 2
    }
    
    private func returnPointX(text: String) -> CGFloat {
        return CGFloat(text.count * 2)
    }
    
    private func returnPointY(text: String) -> CGFloat {
        return CGFloat(text.count + 20)
    }
    
    private func updateOrigin(point: CGPoint, text: String) -> CGPoint {
        return CGPoint(x: point.x - returnPointX(text: text), y: point.y - returnPointY(text: text))
    }
    
    private func configrueTextFrame(point: CGPoint, text: String) -> CGRect {
        let result = CGRect(origin: point, size: CGSize(width: returnPointX(text: text)*4, height: returnPointY(text: text) * 2.5))
        return result
    }
    
    private func drawDrinkName(center: CGPoint, length: CGFloat, angleA: CGFloat, angleB: CGFloat, text: String) {
        
        let midAngle = returnCenterPoint(angleA: angleA, angleB: angleB)
        
        var point = returnEndpoint(center: center, length: length, angle: midAngle)
        
        point = updateOrigin(point: point, text: text)
        
        let frame = configrueTextFrame(point: point, text: text)
        
        let drinkName = text as NSString
        
        let textAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: length / 5, weight: UIFont.Weight.bold), NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        
        drinkName.draw(in: frame, withAttributes: textAttributes)
    }
}
