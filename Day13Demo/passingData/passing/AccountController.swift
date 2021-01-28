//
//  AccountController.swift
//  passing
//
//  Created by Luat on 1/27/21.
//

import UIKit

class AccountController: UIViewController, HasUser {
    var user: User?
    var delegate: UpdateUserDelegate?
    var myCustomView = ProgressBar(frame: CGRect(x: 50, y: UIScreen.main.bounds.height - 200, width: UIScreen.main.bounds.width - 100, height: 50))
    
    @IBOutlet weak var bonusLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var spentLabel: UILabel!
    @IBAction func updatePressed(_ sender: UIButton) {
        updateProgressBar()
        user?.buyOneDrink()
        updateUI()
//        if let delegate = delegate as? HomeViewController {
//            delegate.updateUser(user: user)
//        }
        delegate?.updateUser(user: user)
    }
    @IBAction func redeemAction(_ sender: Any) {
        user?.redeemBonusDrink()
        updateUI()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = user?.name
        updateUI()
        myCustomView.backgroundColor = .clear
        view.addSubview(myCustomView)
    }
    
    func updateProgressBar() {
        let remainder = (user?.drinksBought ?? 0) % 5
        myCustomView.fillNum = remainder + 1
    }
    
    func updateUI() {
        spentLabel.text = String(user?.drinksBought ?? 0)
        bonusLabel.text = String(user?.bonusEarned ?? 0)
    }
    
    
}
