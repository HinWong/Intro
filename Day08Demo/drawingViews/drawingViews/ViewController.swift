//
//  ViewController.swift
//  drawingViews
//
//  Created by Luat on 1/20/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let myCustomView = CustomView(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
        myCustomView.backgroundColor = .gray
        view.addSubview(myCustomView)
        let tapGest = UITapGestureRecognizer(target: self, action: #selector(handleTap(gestReg:)))
        myCustomView.addGestureRecognizer(tapGest)
        
        
        
        //        myCustomView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
        //        UIGestureRecognizer
        //        UIPinchGestureRecognizer
        //        UIPanGestureRecognizer
        //        UISwipeGestureRecognizer
        //        UIRotationGestureRecognizer
        //        UIHoverGestureRecognizer
    }

    @objc func handleTap(gestReg: UITapGestureRecognizer) {
        print("this")
//        switch gestReg.state {
//        case .began:
//        case .changed:
//        case .ended:
//        }
        
        if let myCustomView = gestReg.view as? CustomView {
            myCustomView.drawMore = !myCustomView.drawMore
        }
    }

}

