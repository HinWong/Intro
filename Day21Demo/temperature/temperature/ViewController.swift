//
//  ViewController.swift
//  temperature
//
//  Created by Luat on 2/8/21.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func pressed(_ sender: Any) {
        guard let detailsVC = storyboard?.instantiateViewController(identifier: "DetailsVC") as? DetailsVC else { return }
//        detailsVC.currentTemp = 98.6
//        detailsVC.currentScale = TempScale.farenheit
        detailsVC.viewModel = TempDetailsVM(temp: 98.6, scale: TempScale.farenheit)
        navigationController?.pushViewController(detailsVC, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

