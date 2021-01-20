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
//        myCustomView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
        view.addSubview(myCustomView)
    }


}

