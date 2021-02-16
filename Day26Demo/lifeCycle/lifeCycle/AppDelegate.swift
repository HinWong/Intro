//
//  AppDelegate.swift
//  lifeCycle
//
//  Created by Luat on 2/15/21.
//

import UIKit
import BackgroundTasks

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    /**
     1) Not Running / Not Attached (before the app is opened)
     - no code is ran
     2) Foreground Inactive (On screen)
     - running code
     - launching app
     - coming out from background state
     - not receiving UI events
     3) Foreground Active  (On screen)
     - running code
     - receiving UI events
     4) Background (Off screen)
     - running code
     - not receiving UI events
     - automatically suspended after 30 secs
     - can request more time by begining a new task
     - beginBackgroundTask(withName:expirationHandler:)
     - var backgroundTimeRemaining
     5) Suspended
     1) Not Running
     
     AppDelegate vs SceneDelegate
     1) app delegate
     - App lifecycle and setup
     - App launching, with options
     - Configure the new scene
     - clean up, release resources when scene is dicarded
     2) Scene delegate
     - manage the scene-base life cycle
     - has UIWindow, manages the life cycle of what is shown to user
     
     
     Background fetch:
     1) Add capabilities: Background Modes: Background Fetch
     In appDelegate
     - 2) set UIApplication.shared.setMinimumBackgroundFetchInerval() in app launch
     - 3) implement: performFetchWithCompletionHandler
     4) In iOS 13 and 14: Import BackgoundTasks, use BGAppRefreshTask
     */


    /** launchOptions: the reason why app was lauched and was passed some data
      - some other app can start our app and pass some data to launchOptions
      - pushNotification, location event, passing a URL
     */
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("didFinishLaunchingWithOptions")
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        print("configurationForConnecting")
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        print("didDiscardSceneSessions")
    }

    func application(_ application: UIApplication,
                     performFetchWithCompletionHandler completionHandler:
                     @escaping (UIBackgroundFetchResult) -> Void) {
       if let newData = fetchUpdates() {
          addDataToFeed(newData: newData)
          completionHandler(.newData)
       }
       completionHandler(.noData)
    }

    func fetchUpdates() -> Data? { return nil }
    func addDataToFeed(newData: Data) {}
}

