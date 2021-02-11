//
//  CartViewController.swift
//  userD
//
//  Created by Luat on 2/11/21.
//

import UIKit

class CartHomeViewController: UIViewController {

    @IBOutlet weak var sizeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNotificationObserver()
    }
    func setupNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification), name: Notification.Name("Add to Cart"), object: nil)
        
    }
    @objc func handleNotification() {
        updateLabel()
        print("From Home: there was a notification")
    }
    
    func updateLabel() {
        ///UserDefault: save data, small amount, insecure, mostly for user preferences/settings, persists after app terminates
        sizeLabel.text = UserDefaults.standard.string(forKey: "itemSize")
/// Examples of Singletons
//        URLSession.shared
//        UserDefaults.standard
//        NotificationCenter.default
//        ImageCache.shared
        
/// returns type Any? when using .value(forKey:)
//        let type = UserDefaults.standard.value(forKey: "itemSize")

    }
}
