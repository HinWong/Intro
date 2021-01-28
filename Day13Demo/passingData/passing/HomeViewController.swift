//
//  HomeViewController.swift
//  passing
//
//  Created by Luat on 1/27/21.
//

import UIKit

/**
M V C
View: display, UI, recieves user interactions, tell controller about user intercations
Controller:  - interprets changes in the view for model,
        - interperts the data for the view to display
        - Owns the model and the view
        -  .model and .view
 */
class HomeViewController: UIViewController, UpdateUserDelegate {
/// The update button
    @IBAction func updateButton(_ sender: Any) {
        user?.buyOneDrink()
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var spentLabel: UILabel!

    var user: User? {
        didSet {
            updateLabels()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getUserInfo()
    }

    func getUserInfo() {
        user = User(name: "luke", drinksBought: 0)
    }
    func updateLabels() {
        nameLabel.text = user?.name
        spentLabel.text = String(user?.drinksBought ?? 0)
    }
    
    func updateUser(user: User?) {
        self.user = user
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? HasUser {
            vc.user = user
            vc.delegate = self
        }
    }
}

/// Going backwards
protocol UpdateUserDelegate {
    func updateUser(user: User?)
}

/// Going forward
protocol HasUser where Self: UIViewController {
    var user: User? { get set }
    var delegate: UpdateUserDelegate? { get set }
}
