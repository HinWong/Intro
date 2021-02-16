//
//  ViewController.swift
//  storyboards
//
//  Created by Luat on 2/5/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func thirdButton(_ sender: Any) {
        let sb = UIStoryboard(name: "ThirdSB", bundle: nil)
        if let vc = sb.instantiateViewController(identifier: "ThirdVC") as? ThirdViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func button(_ sender: Any) {
        let sb = UIStoryboard(name: "SecondVC", bundle: nil)
        if let vc = sb.instantiateViewController(identifier: "SecondVC") as? SecondViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}

