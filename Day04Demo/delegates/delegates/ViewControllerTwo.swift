//
//  ViewControllerTwo.swift
//  delegates
//
//  Created by RaveBizz on 1/14/21.
//

import UIKit

class ViewControllerTwo: UIViewController {

    @IBAction func buttonPressed(_ sender: UIButton) {
        let buttonColor = sender.backgroundColor
        helper?.changeColor(color: buttonColor)
        
    }
    
    var helper: ColorChangerProtocol?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        print("my helper variable", helper)
    }
    
}

protocol ColorChangerProtocol {
    func changeColor(color: UIColor?)
}
