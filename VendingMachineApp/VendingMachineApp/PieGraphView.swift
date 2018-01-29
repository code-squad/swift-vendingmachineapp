//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by 심 승민 on 2018. 1. 24..
//  Copyright © 2018년 심 승민. All rights reserved.
//

import UIKit

class PieGraphView: UIView {
    // 원점. 프레임 크기와 상관없이 무조건 뷰의 중점.
    private var origin: CGPoint {
        return CGPoint(x: bounds.width/2, y: bounds.height/2)
    }
    // 경계 부분이 잘릴 수 있으니 -6 정도로 여유를 준다.
    private var radius: CGFloat {
        return CGFloat(min(bounds.width, bounds.height)/2-6)
    }
    // AdminViewController에서 의존성 주입.
    var segments: [Segment]? {
        didSet {
            // 세그먼트에 변화가 생기면 뷰 업데이트.
            self.setNeedsDisplay()
        }
    }

    // 모든 세그먼트들의 합 (총 구매 개수)
    private var sum: Int?
    func totalSegmentValues(_ sum: Int?) {
        self.sum = sum
    }

    private var textAttributes: [NSAttributedStringKey: Any] {
        return [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20, weight: .init(rawValue: 5)),
                NSAttributedStringKey.foregroundColor: UIColor.black]
    }

    override func draw(_ rect: CGRect) {
        guard let status = status else { return }
        switch status {
        case .stationary, .ended: drawPieGraph(radius: self.radius)
        case .began, .moved: drawBlackCircle(radius: self.radius)
        default: break
        }
    }

    private func drawPieGraph(radius: CGFloat?) {
        guard let radius = radius else { return }
        let context = UIGraphicsGetCurrentContext()
        var startAngle: CGFloat = 0
        segments?.forEach { segment in
            let endAngle: CGFloat = startAngle + segment.value.degrees(in: sum).radians
            let sector = Sector(origin: origin, radius: radius, startAngle: startAngle, endAngle: endAngle)
            context?.drawSegment(segment, in: sector)
            let name = NSMutableAttributedString(string: segment.name, attributes: textAttributes)
            name.draw(on: sector)
            startAngle = endAngle
        }
    }

    private func drawBlackCircle(radius: CGFloat?) {
        guard let radius = radius else { return }
        let context = UIGraphicsGetCurrentContext()
        context?.addArc(center: origin, radius: radius, startAngle: 0, endAngle: 360.radians, clockwise: false)
        context?.setFillColor(UIColor.black.cgColor)
        context?.drawPath(using: .fill)
    }

    var status: UITouchPhase?
    private var beganPosition: CGPoint?

    // 터치 시작 - 원점으로부터 터치 위치까지의 거리 저장. 그래프를 검은색 원으로 변경하여 표시.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        status = touches.first?.phase
        guard let currPosition = touches.first?.location(in: self) else { return }
        beganPosition = currPosition
        setNeedsDisplay()
    }

    // 터치 움직임 - 원점으로부터 현재 터치 위치까지 거리를 radius로 하는 검은색 원 표시.
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        status = touches.first?.phase
        guard let beganPosition = beganPosition else { return }
        guard let currPosition = touches.first?.location(in: self) else { return }
        let prevWidth = frame.size.width
        let prevHeight = frame.size.height
        let movedDistance = currPosition.distance(from: beganPosition)
        let scaleFactor: CGFloat = movedDistance/radius*20
        // 원점과의 거리가 멀어졌다면 scaleFactor 만큼 뷰 크기 확대. 이 때, 부모 뷰의 경계를 넘으면 안 된다.
        if currPosition.distance(from: origin)-beganPosition.distance(from: origin) > 0 {
            guard frame.maxX < superview!.frame.maxX && frame.maxY < superview!.frame.maxY else { return }
            frame.size.width += scaleFactor
            frame.size.height += scaleFactor
        } else if currPosition.distance(from: origin)-beganPosition.distance(from: origin) < 0 {
            // 원점과의 거리가 가까워졌다면 scaleFactor 만큼 뷰 크기 축소.
            guard radius > 30 else { return }
            frame.size.width -= scaleFactor
            frame.size.height -= scaleFactor
        }
        frame.origin.x -= (frame.size.width - prevWidth)/2
        frame.origin.y -= (frame.size.height - prevHeight)/2
        setNeedsDisplay()
    }

    // 터치 끝 - 원점으로부터 현재 터치가 끝난 지점까지 거리를 radius로 하는 파이그래프 표시.
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        status = touches.first?.phase
        segments?.forEach({ $0.setRandomColor() })
        setNeedsDisplay()
    }

    // 프레임이 새로 세팅될 때 코너를 둥글게 처리.
    override var frame: CGRect {
        didSet {
            self.layer.cornerRadius = self.bounds.size.width/2
            self.clipsToBounds = true   // 이걸 해줘야 적용된다.
        }
    }

    // 쉐이크 제스처 시 first responder로 지정 가능하도록 설정
    override var canBecomeFirstResponder: Bool {
        return true
    }

    // 뷰 크기 변경 전 원본 프레임 저장 (복귀 위함)
    var originalFrame: CGRect
    required init?(coder aDecoder: NSCoder) {
        originalFrame = CGRect()
        super.init(coder: aDecoder)
        originalFrame = frame
    }

    // 쉐이크 모션 끝날 시, 설정값들을 리셋하여 기본 그래프 표시.
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
//            self.clearsContextBeforeDrawing = true
            status = .stationary
            frame = originalFrame
            setNeedsDisplay()
        }
    }

}

// 부채꼴 그릴 정보.
struct Sector {
    private(set) var origin: CGPoint
    private(set) var radius: CGFloat
    private(set) var startAngle: CGFloat
    private(set) var endAngle: CGFloat
}

// 파이 한 조각 정보.
class Segment {
    private(set) var name: String
    private(set) var value: Int
    private(set) var color: UIColor
    init(name: String, value: Int, color: UIColor) {
        self.name = name
        self.value = value
        self.color = color
    }
}

extension Segment {
    // 색상 변경 함수.
    func setRandomColor() {
        self.color = UIColor.random
    }
}
