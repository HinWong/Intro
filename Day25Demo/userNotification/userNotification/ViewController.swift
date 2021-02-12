//
//  ViewController.swift
//  userNotification
//
//  Created by Luat on 2/12/21.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    let requestButton: UIButton = {
        let button = UIButton()
        button.setTitle("Request Permission", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(handleRequestTap), for: .touchUpInside)
        return button
    }()
    
    let triggerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Trigger Notification", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(handleTriggerTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(requestButton)
        view.addSubview(triggerButton)
        setupConstraints()
        UNUserNotificationCenter.current().delegate = self
        printTime()
    }
    
    func printTime() {
        let now = Date()
        print(now)
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            self.printTime()
        }
    }

    func setupConstraints() {
        requestButton.translatesAutoresizingMaskIntoConstraints = false
        requestButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        requestButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        triggerButton.translatesAutoresizingMaskIntoConstraints = false
        triggerButton.leadingAnchor.constraint(equalTo: requestButton.trailingAnchor, constant: 10).isActive = true
        triggerButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
    }
    
    @objc func handleRequestTap() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (userDecision, error) in
        }
    }
    
    @objc func handleTriggerTap() {
        let content = UNMutableNotificationContent()
        content.title = "Study"
        content.subtitle = "it is hard work"
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = "Important"
        
        let triggerEvent = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//        var myDate = DateComponents()
//        myDate.hour = 9
//        myDate.minute = 50
//        myDate.second = 55
//        let triggerEvent = UNCalendarNotificationTrigger(dateMatching: myDate, repeats: true)
        
        let request = UNNotificationRequest(identifier: "uniqueID123", content: content, trigger: triggerEvent)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("error sending local noti \(error)")
            } else {
                print("sent noti request succesful")
            }
        }
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if notification.request.content.categoryIdentifier == "Important" {
            completionHandler([.banner, .sound])
        }
    }
    
}

