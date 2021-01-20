//
//  CustomView.swift
//  drawingViews
//
//  Created by Luat on 1/20/21.
//

import UIKit

@IBDesignable class CustomView: UIView {

    @IBInspectable var drawMore: Bool = false
    @IBInspectable var widthOfLine: CGFloat = 1
    // CGRect is where you draw
    // CoreGraphics
    // CGFloat
    // CGPoint will have x: CGFloat, y: CGFloat
    // CGRect will have x: CGFloat, y: CGFloat, witdh: CGFloat, height: CGFloat
    /**
        1. set color on UIColor
        2. Create Path
            - customize path
        3. path.stroke or path.fill
     */
    override func draw(_ rect: CGRect) {
        print("bounds \(bounds)")
        print("frame \(frame)")
        UIColor.red.set()
        makeLine().stroke() // or path.fill()
        UIColor.purple.set()
        makeCurve().stroke()
        UIColor.cyan.set()
        makeSwiggly().stroke()
    }
    
    func makeLine() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 200, y: 200))
        path.lineWidth = widthOfLine
        return path
    }
    
    func makeCurve() -> UIBezierPath {
        let centerPoint = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
        let radius = CGFloat(90)
        
        let path = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: 0, endAngle: CircleMeasurments.quarterCircle, clockwise: true)
        return path
        
    }
    func makeSwiggly() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint.zero)
        let endPoint = CGPoint(x: bounds.size.width, y: bounds.size.height)
        let gravityPoint = CGPoint(x: bounds.maxX, y: bounds.minY)
        let gravityPointEnd = CGPoint(x: 0, y: 200)
        if drawMore {
            path.addCurve(to: endPoint, controlPoint1: gravityPoint, controlPoint2: gravityPointEnd)
        }
        return path
    }

}

/// Constants.swift
struct CircleMeasurments {
    static let fullCircle = 2 * CGFloat.pi
    static let halfCircle = fullCircle / 2
    static let quarterCircle = fullCircle / 4
}
