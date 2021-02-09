//
//  ViewController.swift
//  coordinator
//
//  Created by Luat on 2/9/21.
//

import UIKit

/**
 S: single responsibility principle
 O: open-close : open to extensions, closed to modification
 L: liskow substitution, if Cat: Animal, you can replace all Animal with type Cat, and no difference
 I: interface segregation: rather have protocol composition than have one big protocol/interface
 D: dependency inversion: dont depend on specific class (concrete implementation), depend on an interface/protocol (abstraction), more generic/flexible/decoupled
 */

class ViewController: UIViewController {

    var coordinator: Coordinator?
    
    @IBAction func accountTapped(_ sender: UIButton) {
        coordinator?.pushAccountVC()
    }
    @IBAction func productTapped(_ sender: UIButton) {
        coordinator?.pushProductVC()
    }
    @IBAction func listTapped(_ sender: UIButton) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

