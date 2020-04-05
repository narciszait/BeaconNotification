//
//  NotificationBase.swift
//  Beacon Notify
//
//  Created by Narcis Zait on 04/04/2020.
//  Copyright © 2020 Narcis Zait. All rights reserved.
//

import UIKit
import UserNotifications

extension ViewController {
    func createNotification() {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            guard settings.authorizationStatus == .authorized else { return }
            
            let content = UNMutableNotificationContent()
            content.categoryIdentifier = "headphoneNotification"
            content.title = "My headphones"
            content.subtitle = "Battery level %"
            content.sound = UNNotificationSound.default
            
            let imageName = "bo"
            guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "png") else { return }
            
            let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
            content.attachments = [attachment]
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let request = UNNotificationRequest(identifier: "headphoneNotification", content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)

        }
    }
}
