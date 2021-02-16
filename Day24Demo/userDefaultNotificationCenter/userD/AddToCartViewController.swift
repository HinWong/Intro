//
//  ViewController.swift
//  userD
//
//  Created by Luat on 2/11/21.
//

import UIKit

class AddToCartViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    @IBAction func largePressed(_ sender: UIButton) {
        if let title = sender.currentTitle {
            updateSizeLabel(title: title)
        }
    }
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var centerView: UIView!
    @IBAction func addToCartPressed(_ sender: UIButton) {
        if let title = sender.currentTitle {
            setupNotification(title: title)
            addToUserDefault()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    
    func updateSizeLabel(title: String) {
        sizeLabel.text = title
    }
    
    
    func setupNotification(title: String) {
        let notification = Notification(name: Notification.Name(title))
        print("posting: ", notification.name)
        /// Observer pattern:
        ///     notification pattern: one to many relationship to notify
        ///     delegation pattern: didSelectItem atRow, one-to-one
        
        /// NotificationCenter totally separate from
        ///     -   App notifications between objects (VC, views)
        /// (local) Notification and Push notification (comes from Apple server)
        ///     - send badges to notify USER
        NotificationCenter.default.post(notification)
    }
    
    func addToUserDefault() {
        let size = sizeLabel.text ?? ""
        defaults.setValue(size, forKey: "itemSize")
        
        let saved = defaults.string(forKey: "itemSize")
        print("saving item size to user defaults:  \(saved!)")
    }


}

