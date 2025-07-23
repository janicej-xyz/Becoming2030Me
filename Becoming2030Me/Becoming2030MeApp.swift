//
//  Becoming2030MeApp.swift
//  Becoming2030Me
//
//  Created by Janice Jiang on 7/22/25.
//
import SwiftUI
import UserNotifications

@main
struct Becoming2030MeApp: App {
    let notificationDelegate = NotificationDelegate()

    init() {
        scheduleMorningReminder()
        scheduleEveningCheckin()
        registerNotificationActions()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }

    func scheduleMorningReminder() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { granted, _ in
            if granted {
                let content = UNMutableNotificationContent()
                content.title = "🧠 Becoming: 2030Me"
                content.body = "Hi Janice — ready to become 2030Me today?\n🗞️ AI News | 💻 Deep Work | 💪 100 Reps | ✍️ 3 Words + 1 Thank You"
                content.sound = .default
                content.userInfo = ["link": "https://forms.gle/jct7bE7m86iVCgzY6"]
                content.interruptionLevel = .timeSensitive

                var dateComponents = DateComponents()
                dateComponents.hour = 10
                dateComponents.minute = 0

                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                let request = UNNotificationRequest(identifier: "morningReminder", content: content, trigger: trigger)
                center.add(request)
            } else {
                print("❌ Morning notification permission not granted.")
            }
        }
    }

    func scheduleEveningCheckin() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { granted, _ in
            if granted {
                let content = UNMutableNotificationContent()
                content.title = "🌙 2030Me Check-in"
                content.body = "🦮 How did today go, Janice?\nSubmit your nightly check-in 📝"
                content.sound = .default
                content.userInfo = ["link": "https://forms.gle/jct7bE7m86iVCgzY6"]
                content.interruptionLevel = .timeSensitive

                var dateComponents = DateComponents()
                dateComponents.hour = 21
                dateComponents.minute = 0

                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                let request = UNNotificationRequest(identifier: "eveningCheckin", content: content, trigger: trigger)
                center.add(request)
            } else {
                print("❌ Evening notification permission not granted.")
            }
        }
    }

    func registerNotificationActions() {
        let center = UNUserNotificationCenter.current()

        let openFormAction = UNNotificationAction(
            identifier: "openForm",
            title: "Open Check-in Form",
            options: [.foreground]
        )

        let checkinCategory = UNNotificationCategory(
            identifier: "checkinCategory",
            actions: [openFormAction],
            intentIdentifiers: [],
            options: []
        )

        center.setNotificationCategories([checkinCategory])
        center.delegate = notificationDelegate
    }
}
