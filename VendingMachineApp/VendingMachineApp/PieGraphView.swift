//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by 심 승민 on 2018. 1. 24..
//  Copyright © 2018년 심 승민. All rights reserved.
//

import UIKit

class PieGraphView: UIView {
    // 원점
    private var origin: CGPoint {
        return CGPoint(x: bounds.width/2, y: bounds.height/2)
    }
    // 경계 부분이 잘릴 수 있으니 -6 정도로 여유를 준다.
    private var radius: CGFloat {
        return CGFloat(min(initialFrameSize.width, initialFrameSize.height)/2-6)
    }
    // AdminViewController에서 의존성 주입.
    var segments: [Segment]? {
        didSet {
            // 세그먼트에 변화가 생기면 뷰 업데이트.
            self.setNeedsDisplay()
        }
    }
    // 초기 프레임 사이즈 - 뷰 크기 갱신 위해 고정
    private var initialFrameSize: CGSize
    required init?(coder aDecoder: NSCoder) {
        self.initialFrameSize = CGSize()
        super.init(coder: aDecoder)
        self.initialFrameSize = frame.size
    }
    // 모든 세그먼트들의 합 (총 구매 개수)
    private var sum: Int? {
        return segments?.reduce(0, {
            return $0 + $1.value
        })
    }
    private var textAttributes: [NSAttributedStringKey: Any] {
        return [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20, weight: .init(rawValue: 5)),
                NSAttributedStringKey.foregroundColor: UIColor.black]
    }

    override func draw(_ rect: CGRect) {
        switch status {
        case .none: drawPieGraph(radius: self.radius)
        case .began: drawBlackCircle(radius: self.radius)
        case .moved: drawBlackCircle(radius: self.movedRadius)
        case .ended: drawPieGraph(radius: self.movedRadius)
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
        context?.move(to: origin)
        context?.addArc(center: origin, radius: radius, startAngle: 0, endAngle: 360.radians, clockwise: false)
        context?.setFillColor(UIColor.black.cgColor)
        context?.drawPath(using: .fill)
    }

    enum TouchStatus {
        case none
        case began
        case moved
        case ended
    }
    var status: TouchStatus = .none
    private var beganRadiusFromOrigin: CGFloat = 0
    private var movedRadius: CGFloat? {
        didSet {
            // 터치를 통해 원 사이즈가 조정되면 뷰 자체의 사이즈도 같이 조정하도록 노티보냄
            NotificationCenter.default.post(
                name: .didUpdatePieSize,
                object: nil,
                userInfo: [UserInfoKeys.newPieRadius: movedRadius ?? self.radius])
        }
    }

    // bounds가 세팅될 때 코너를 둥글게 처리.
    override var bounds: CGRect {
        didSet {
            self.layer.cornerRadius = self.bounds.size.width/2
            self.clipsToBounds = true   // 이걸 해줘야 적용된다.
        }
    }

    // 터치 시작 - 원점으로부터 터치 위치까지의 거리 저장. 그래프를 검은색 원으로 변경하여 표시.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        status = .began
        guard let thisTouch = touches.first else { return }
        beganRadiusFromOrigin = thisTouch.location(in: self).distance(from: origin)
        setNeedsDisplay()
    }

    // 터치 움직임 - 원점으로부터 현재 터치 위치까지 거리를 radius로 하는 검은색 원 표시.
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        status = .moved
        guard let thisTouch = touches.first else { return }
        let currPosition = thisTouch.location(in: self)
        movedRadius = currPosition.distance(from: origin)
        setNeedsDisplay()
    }

    // 터치 끝 - 원점으로부터 현재 터치가 끝난 지점까지 거리를 radius로 하는 파이그래프 표시.
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        status = .ended
        guard let thisTouch = touches.first else { return }
        let currPosition = thisTouch.location(in: self)
        movedRadius = currPosition.distance(from: origin)
        segments?.forEach({ $0.setRandomColor() })
        setNeedsDisplay()
    }

    // 쉐이크 제스처 시 first responder로 지정 가능하도록 설정
    override var canBecomeFirstResponder: Bool {
        return true
    }

    // 쉐이크 모션 끝날 시, 설정값들을 리셋하여 기본 그래프 표시.
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            status = .none
            movedRadius = nil
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
