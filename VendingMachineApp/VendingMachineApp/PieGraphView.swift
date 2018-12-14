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

    private let colors: [UIColor] = [.red, .orange, .blue, .green, .yellow, .brown, .purple, .magenta, .gray]
    
    private var drinkPieInfo = DrinkPieInfo()
    
    func setOrderedDrinkList(drinkPieInfo: DrinkPieInfo){
        self.drinkPieInfo = drinkPieInfo
        setNeedsDisplay()
    }
    /// 파이 그리기
    func drawPie(center: CGPoint,radius: CGFloat,startAngle: CGFloat, endAngle: CGFloat, lineColor: UIColor){
        // 원을 그리는데 기준점이 반지름의 절반
        let path = UIBezierPath(arcCenter: center, radius: radius / 2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        // 그리는 라인 두깨는 반지름
        path.lineWidth = radius
        lineColor.setStroke()
        path.stroke()
    }
    
    
    /// 배경원 색칠
    func drawBackCircle(center: CGPoint,radius: CGFloat){
        drawPie(center: center, radius: radius, startAngle: 0, endAngle: 2.0 * .pi,lineColor: UIColor.black)
    }
    
    override func draw(_ rect: CGRect) {
        // 센터 위치
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        
        // 반지름
        let radius: CGFloat = min(bounds.size.width, bounds.size.height) / 2
        
        // 시작점
        var startAngle: CGFloat = 0
        
        // 파이를 나누는 기준
        let totalCount : CGFloat = CGFloat(drinkPieInfo.allDrinkCount())
        
        // 뒷배경을 그린다
        drawBackCircle(center: center, radius: radius)
        
        for drinkNameInfo in drinkPieInfo.drinkNameInfos{
            // 해당 음료 개수 CGFloat 변환
            let drinkCount = CGFloat(drinkNameInfo.drinkCount)
            let lineColor = colors[drinkNameInfo.drinkType.rawValue]
            
            // 파이 각도 = 360도(2pi) / 모든 음료 개수 * 해당 음료 개수
            let endAngle : CGFloat = CGFloat.pi * 2.0 / totalCount * drinkCount + startAngle
            // 파이를 그린다
            drawPie(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, lineColor: lineColor)
            // 음료이름을 그린다
            drawDrinkName(center: center, length: radius / 2, angleA: startAngle, angleB: endAngle, text: drinkNameInfo.drinkName)
            
            startAngle = endAngle
        }
    }
    
    
    // end of line
}

/// 텍스트 출력용 확장
extension PieGraphView {
    /// 길이와 각도를 받아서 끝점의 포인터를 리턴
    func getPoint(center: CGPoint,length: CGFloat, angle: CGFloat) -> CGPoint {
        return CGPoint(x: center.x + length * cos(angle), y: center.y + length * sin(angle)
        )
    }
    
    /// 두 각도의 중간값을 리턴
    func getMid(angleA: CGFloat, angleB: CGFloat) -> CGFloat {
        return (angleA + angleB) / 2
    }
    
    /// 글자를 받아서 CGrect에 맞는 길이를 리턴
    func getPointX(text: String) -> CGFloat {
        return CGFloat(text.count * 10) // 10
    }
    func getPointY(text: String) -> CGFloat {
        return CGFloat(text.count + 15) // 30
    }
    
    /// 포인트와 글자를 받아서 위치변경된 origin 을 리턴
    func adjustOrigin(point: CGPoint, text: String) -> CGPoint {
        // 가로위치는 + 글자수*10, 세로위치는 글자수 관계없이 +10
        return CGPoint(x: point.x - getPointX(text: text), y: point.y - getPointY(text: text))
    }
    
    /// 포인트와 글자를 받아서 GCRect 를 리턴
    func getFrame(point: CGPoint, text: String) -> CGRect {
        let result =  CGRect(origin: point, size: CGSize(width: getPointX(text: text) * 2, height: getPointY(text: text) * 2))
        return result
    }
    
    
    func drawDrinkName(center: CGPoint, length: CGFloat, angleA: CGFloat, angleB: CGFloat, text: String){
        // 시작점과 끝점의 중간각을 구한다
        let midAngle = getMid(angleA: angleA, angleB: angleB)
        // 반지름 길이와 각도로 파이의 끝 포인트를 구한다
        var point = getPoint(center: center, length: length, angle: midAngle)
        // 문자에 알맞는 오리진으로 위치변경
        point = adjustOrigin(point: point, text: text)
        // 문자에 알맞는 rect 생성
        let frame = getFrame(point: point, text: text)
        
        
        let label = UILabel()
        label.frame = frame
        label.textAlignment = .center
        label.text = text
        label.textColor = UIColor.white
        label.isHidden = false
        label.drawText(in: frame)
        
    }
}
