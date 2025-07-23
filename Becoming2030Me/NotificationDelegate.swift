//
//  NotificationDelegate.swift
//  Becoming2030Me
//
//  Created by Janice Jiang on 7/22/25.
//

import UserNotifications
import AppKit

class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    // Called when user taps the notification
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {

        let userInfo = response.notification.request.content.userInfo
        if let linkString = userInfo["link"] as? String,
           let url = URL(string: linkString) {
            NSWorkspace.shared.open(url) // Open in default browser
        }

        completionHandler()
    }

    // Called when a notification is delivered while app is in foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Still show the notification even if app is in foreground
        completionHandler([.banner, .sound])
    }
}
