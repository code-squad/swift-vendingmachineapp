//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by Yoda Codd on 2018. 12. 11..
//  Copyright © 2018년 Drake. All rights reserved.
//

import UIKit

//@IBDesignable
class PieGraphView: UIView {
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if isPanGesturing {
            // 검은원을 그리고 나서 검은원의 지름을 리턴
            radius = drawBlackCircleFrom(centerPoint: getCenter(bounds: rect), point: panGtesturingPoint)
            return()
        }
        
        // 입력받은 지름으로 원그래프 그림
        drawPieGraph(rect, radius: radius)
        
        
        // end of draw(:)
    }

    private let colors: [UIColor] = [.red, .orange, .blue, .green, .yellow, .brown, .purple, .magenta, .gray]
    
    private var pieInfo : DrinkPieInfo?
    
    /// panGesture 이벤트 중인지 체크
    private var isPanGesturing = false
    
    /// panGesture 상태를 받아서 저장
    func checkGesture(event: UIPanGestureRecognizer){
        if event.state == .began {
            self.isPanGesturing = true
        }
        else if event.state == .ended {
            self.isPanGesturing = false
        }
    }
    
    /// panGesture 이벤트 포인트 위치
    private var panGtesturingPoint : CGPoint = CGPoint()
    
    /// 그리고 있는 원의 지름
    var radius : CGFloat? = nil
    
    func setOrderedDrinkList(pieInfo: PieInfo){
        self.pieInfo = pieInfo.getPieInfo()
        setNeedsDisplay()
    }
    
    /// 파이 그리기
    private func drawPie(center: CGPoint,radius: CGFloat,startAngle: CGFloat, endAngle: CGFloat, lineColor: UIColor){
        // 원을 그리는데 기준점이 반지름의 절반
        let path = UIBezierPath(arcCenter: center, radius: radius / 2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        // 그리는 라인 두깨는 반지름
        path.lineWidth = radius
        lineColor.setStroke()
        path.stroke()
    }
    
    
    /// 중심점 구하는 함수
    func getCenter(bounds: CGRect) -> CGPoint {
        return CGPoint(x: bounds.width / 2, y: bounds.height / 2)
    }
    /// 반지름 계산
    private func getRadius(bounds: CGRect) -> CGFloat {
        return min(bounds.size.width, bounds.size.height) / 2
    }
    
    /// 파이그래프 전체를 그리는 함수
    private func drawPieGraph(_ rect: CGRect, radius: CGFloat?){
        
        // 센터 위치
        let center = getCenter(bounds: rect)
        
        // 반지름
        var calculatedRadius: CGFloat
        // 입력인자 값이 있으면 그대로 사용
        if let selfRadius = radius {
            calculatedRadius = selfRadius
        }
            // 옵셔널이면 받은 rect 에서 계산
        else {
            calculatedRadius = getRadius(bounds: rect)
        }
        
        // 시작점
        var startAngle: CGFloat = 0
        
        guard let pieInfo = self.pieInfo else { return }
        
        // 파이를 나누는 기준
        let totalCount : CGFloat = CGFloat(pieInfo.allDrinkCount())
        for drinkNameInfo in pieInfo.drinkNameInfos{
            // 해당 음료 개수 CGFloat 변환
            let drinkCount = CGFloat(drinkNameInfo.drinkCount)
            let lineColor = colors[drinkNameInfo.drinkType.rawValue]
            
            // 파이 각도 = 360도(2pi) / 모든 음료 개수 * 해당 음료 개수
            let endAngle : CGFloat = CGFloat.pi * 2.0 / totalCount * drinkCount + startAngle
            // 파이를 그린다
            drawPie(center: center, radius: calculatedRadius, startAngle: startAngle, endAngle: endAngle, lineColor: lineColor)
            // 음료이름을 그린다
            drawDrinkName(center: center, length: calculatedRadius / 2, angleA: startAngle, angleB: endAngle, text: drinkNameInfo.drinkName)
            
            startAngle = endAngle
        }
    }
}

/// 텍스트 출력용 확장
extension PieGraphView {
    /// 길이와 각도를 받아서 끝점의 포인터를 리턴
    private func getPoint(center: CGPoint,length: CGFloat, angle: CGFloat) -> CGPoint {
        return CGPoint(x: center.x + length * cos(angle), y: center.y + length * sin(angle)
        )
    }
    
    /// 두 각도의 중간값을 리턴
    private func getMid(angleA: CGFloat, angleB: CGFloat) -> CGFloat {
        return (angleA + angleB) / 2
    }
    
    /// 글자를 받아서 CGrect에 맞는 길이를 리턴
    private func getPointX(text: String) -> CGFloat {
        return CGFloat(text.count * 10)
    }
    private func getPointY(text: String) -> CGFloat {
        return CGFloat(text.count + 15)
    }
    
    /// 포인트와 글자를 받아서 위치변경된 origin 을 리턴
    private func adjustOrigin(point: CGPoint, text: String) -> CGPoint {
        // 가로위치는 - 글자수 * 10, 세로위치는 글자수 관계없이 - 10
        return CGPoint(x: point.x - getPointX(text: text), y: point.y - getPointY(text: text))
    }
    
    /// 포인트와 글자를 받아서 GCRect 를 리턴
    private func getFrame(point: CGPoint, text: String) -> CGRect {
        let result =  CGRect(origin: point, size: CGSize(width: getPointX(text: text) * 2, height: getPointY(text: text) * 2))
        return result
    }
    
    /// 센터,반지름,시작각,끝각,음료이름 을 받아서 중간각의 중간에 음료이름을 출력
    func drawDrinkName(center: CGPoint, length: CGFloat, angleA: CGFloat, angleB: CGFloat, text: String){
        // 시작점과 끝점의 중간각을 구한다
        let midAngle = getMid(angleA: angleA, angleB: angleB)
        // 반지름 길이와 각도로 파이의 끝 포인트를 구한다
        var point = getPoint(center: center, length: length, angle: midAngle)
        // 문자에 알맞는 오리진으로 위치변경
        point = adjustOrigin(point: point, text: text)
        // 문자에 알맞는 rect 생성
        let frame = getFrame(point: point, text: text)
        
        // 음료이름을 NSString 으로 변환
        let drinkName = text as NSString
        
        // 문자 속성 설정
        let textAttributes: [NSAttributedStringKey: Any] = [
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: length / 5,
                                                           weight: UIFont.Weight.bold),
            NSAttributedStringKey.foregroundColor: UIColor.white
        ]
        
        drinkName.draw(in: frame, withAttributes: textAttributes)
    }
}

/// 제스처 출력용 확장
extension PieGraphView {
    
    /// 클릭한 위치의 반지름을 가진 검은 원그래프 생성
    func drawBlackCircleFrom(centerPoint: CGPoint ,point: CGPoint) -> CGFloat {
        // 포인트와 중심점 의 거리 계산
        var radius = CGPointDistance(from: centerPoint, to: point)
        // 뷰 반지름 계산
        let myRadius = getRadius(bounds: bounds)
        // 포인트 거리가 뷰 반지름보다 크면
        if radius > myRadius {
            // 뷰 반지름으로 변경
            radius = myRadius
        }
        drawBlackCircle(center: centerPoint, radius: radius)
        return radius
    }
    
    /// 두 점 사이의 거리를 계산. 제곱되어 나옴
    private func CGPointDistanceSquared(from: CGPoint, to: CGPoint) -> CGFloat {
        return (from.x - to.x) * (from.x - to.x) + (from.y - to.y) * (from.y - to.y)
    }
    /// 제곱된 거리값을 루트해줌
    private func CGPointDistance(from: CGPoint, to: CGPoint) -> CGFloat {
        return sqrt(CGPointDistanceSquared(from: from, to: to))
    }
    
    /// 센터와 길이를 받아서 검은색 원 그리기
    private func drawBlackCircle(center: CGPoint,radius: CGFloat){
        drawPie(center: center, radius: radius, startAngle: 0, endAngle: 2.0 * .pi,lineColor: UIColor.black)
    }
    
    /// 이벤트 포인트 설정
    func setPanGesturingPoint(point: CGPoint){
        self.panGtesturingPoint = point
        setNeedsDisplay()
    }
    
    /// 원 지름 초기화
    func resetRaduis(){
        self.radius = nil
        setNeedsDisplay()
    }
}

