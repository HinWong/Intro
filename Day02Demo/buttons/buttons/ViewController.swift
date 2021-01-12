//
//  ViewController.swift
//  buttons
//
//  Created by RaveBizz on 1/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    @IBAction func leftButton(_ sender: UIButton) {
        print("left button pressed")
        display.text = "Left"
    }
    @IBAction func centerButton(_ sender: UIButton) {
        print("center")
        display.text = "Center"
        currentText = display.text!
        
    }
    
    var currentText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

