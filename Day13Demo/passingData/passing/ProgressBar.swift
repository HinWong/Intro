//
//  ProgressBar.swift
//  passing
//
//  Created by Luat on 1/27/21.
//

import UIKit

class ProgressBar: UIView {

    var fillNum = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
   
    override func draw(_ rect: CGRect) {
        UIColor.red.set()
        makeRect().stroke()
        fillRect().fill()
    }
    
    func makeRect() -> UIBezierPath {
        let rect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 100, height: 50)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 4)
        return path
    }

    func fillRect() -> UIBezierPath {
        let barWidth = UIScreen.main.bounds.width - 100
        let progressWidth = barWidth * CGFloat(fillNum) / CGFloat(5)
        let rect = CGRect(x: 0, y: 0, width: progressWidth, height: 50)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 4)
        return path
    }
    
}
