//
//  ViewController.swift
//  jokesPart2
//
//  Created by Luat on 1/29/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var jokeLabel: UILabel!
    @IBAction func updateBotton(_ sender: Any) {
        updateData()
    }
    var viewModel = ViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVMClosure()
    }
    func updateData() {
        viewModel.getData()
        /// update uUI
//        jokeLabel.text = joke.punchline
//        jokeLabel.text = viewModel.model.punchLine()
    }
    func setupVMClosure() {
        viewModel.updateViewClosure = {
            self.jokeLabel.text = self.viewModel.punchLine()
        }
    }
}

