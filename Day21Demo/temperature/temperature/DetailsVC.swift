//
//  DetailsVC.swift
//  temperature
//
//  Created by Luat on 2/8/21.
//

import UIKit

class DetailsVC: UIViewController {
    
    var viewModel: TempDetailsVM?
    
    @IBOutlet weak var temp: UILabel!
    @IBAction func leftButton(_ sender: UIButton) {
        viewModel?.convertToCelcius()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        temp.text = viewModel?.formatText()
    }
    
    
}

enum TempScale: String {
    case celcius = "C"
    case farenheit = "F"
    case kelvin = "K"
}
