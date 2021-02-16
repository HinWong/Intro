//
//  ViewController.swift
//  animations
//
//  Created by Luat on 2/1/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var greenSquare: UIView!
    
    /// dont' create until it is used for the first time
    lazy var redSquare: UIView = createView()
    var cyanSquare: UIView = {
        let square = UIView(frame: CGRect(x: 0, y: 400, width: 100, height: 100))
        square.backgroundColor = .cyan
        return square
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redSquare.backgroundColor = .red
        view.addSubview(cyanSquare)
//        ani1()
//        ani2()
        topConstraintAni()
        rotate()
        basicAni()
        
    }
    
    func basicAni() {
        let ani = CABasicAnimation(keyPath: "position.y")
        ani.fromValue = 0
        ani.toValue = 100
        ani.duration = 1
        redSquare.layer.add(ani, forKey: "aniID")
    }
    
    func rotate() {
        redSquare.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        
    }
    
    func keyFrameAni() {
        let kfAni = CAKeyframeAnimation()
        kfAni.values = [
            UIColor.red.cgColor,
            UIColor.green.cgColor,
            UIColor.yellow.cgColor,
            UIColor.purple.cgColor,
            UIColor.red.cgColor,
        ]
        kfAni.keyTimes = [
            0, 0.25, 05, 0.75, 1
        ]
    }
    
    
    
    func ani1() {
        UIView.animate(withDuration: 1, animations: {
            self.greenSquare.backgroundColor = .red
        })
    }
    func ani2() {
        UIView.animate(withDuration: 2) {
            self.greenSquare.center = self.view.center
        } completion: { (finished) in
            print("finished animation")
            UIView.animate(withDuration: 1) {
                self.transition1()
            }
        }
    }
    
    func transition1() {
        UIView.transition(with: greenSquare, duration: 1, options: .transitionCurlUp) {
            self.view.layoutIfNeeded()
        }
    }

    func createView() -> UIView {
        let square = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        square.backgroundColor = .cyan
        view.addSubview(square)
        return square
    }
    
    func topConstraintAni() {
        topConstraint.constant = 400
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        } completion: { (finished) in
            if finished {
                UIView.animate(withDuration: 1) {
                    self.greenSquare.alpha = 0
                    self.heightConstraint.constant = 20
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
}

