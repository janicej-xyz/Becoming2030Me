//
//  AppDelegate.swift
//  Becoming2030Me
//
//  Created by Janice Jiang on 7/22/25.
//

import Cocoa
import UserNotifications

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        // App finished launching normally
    }

    func application(_ application: NSApplication, didReceiveRemoteNotification userInfo: [String : Any]) {
        if let linkString = userInfo["link"] as? String,
           let url = URL(string: linkString) {
            NSWorkspace.shared.open(url)
        }
    }
}
