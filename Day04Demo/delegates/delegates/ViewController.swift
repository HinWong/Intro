//
//  ViewController.swift
//  delegates
//
//  Created by RaveBizz on 1/14/21.
//

import UIKit

class ViewController: UIViewController, ColorChangerProtocol {
    func changeColor(color: UIColor?) {
        view.backgroundColor = color
    }

    @IBAction func nextScreen(_ sender: Any) {
        let vcTwo = storyboard?.instantiateViewController(identifier: "two") as! ViewControllerTwo
        vcTwo.helper = self
        present(vcTwo, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}

