import UIKit

struct Segment {
    
    var color: UIColor
    
    var value: CGFloat
    
}

class PieGraphView: UIView {
    
    private var segments = [Segment]() {
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
        
        let viewCenter = CGPoint(x: bounds.size.width, y: bounds.size.height)
        
        let valueCount = segments.reduce(0, {$0 + $1.value})
        
        var startAngle = -CGFloat.pi * 0.5
        
        for segment in segments {
            
            currentContext?.setFillColor(segment.color.cgColor)
            
            let endAngle = startAngle + 2 * .pi * (segment.value / valueCount)
            
            currentContext?.move(to: viewCenter)
            
            currentContext?.addArc(center: viewCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            
            currentContext?.fillPath()
            
            startAngle = endAngle
        }
    }
}
