//
//  Scratchpad.swift
//  Beacon Notify
//
//  Created by Narcis Zait on 04/04/2020.
//  Copyright © 2020 Narcis Zait. All rights reserved.
//

import Foundation

//        let content = UNMutableNotificationContent()
//        content.title = "Name of my headphones"
//        content.body = " Battery level %"
//
//        let imageName = "Airpods"
//        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "gif") else { return }
//
//        let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
//
//        content.attachments = [attachment]
//
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
//        let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
//
//        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)

//-----------
//com.apple.usernotifications.service
//------

//  NotificationService.swift
//  Headphone Notifications
//
//  Created by Narcis Zait on 04/04/2020.
//  Copyright © 2020 Narcis Zait. All rights reserved.
//
//import UIKit
//import UserNotifications
//import UserNotificationsUI
//
//class NotificationService: UIViewController, UNNotificationContentExtension {
//    func didReceive(_ notification: UNNotification) {
//        print("hello")
//    }
//
//
//    var contentHandler: ((UNNotificationContent) -> Void)?
//    var bestAttemptContent: UNMutableNotificationContent?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
//        self.contentHandler = contentHandler
//        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
//
//        if let bestAttemptContent = bestAttemptContent {
//            // Modify the notification content here...
//            bestAttemptContent.title = "\(bestAttemptContent.title) [modified]"
//
//            contentHandler(bestAttemptContent)
//        }
//    }
//
//    func serviceExtensionTimeWillExpire() {
//        // Called just before the extension will be terminated by the system.
//        // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
//        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
//            contentHandler(bestAttemptContent)
//        }
//    }
//
//}

//<UNNotificationAttachment: 0x28100d3b0; identifier: Airpods, family: Image, URL: file:///var/mobile/Library/UserNotifications/4C75C2D4-AC62-428A-A1ED-E37D70FF70CF/Attachments/d9a5e6e9ee50c12d610e0173b9c16f9c5e9dcfc8.gif, type: com.compuserve.gif, options: <UNImageNotificationAttachmentOptions: 0x280b37d80>>

//-----
//        guard let imageURL = notification.request.content.attachments.first?.url else { return }
//        imageURL.startAccessingSecurityScopedResource()
//        imageView.image = try! UIImage(data: Data(contentsOf: imageURL))
//        imageView.setGifFromURL(imageURL)
//
//        imageURL.stopAccessingSecurityScopedResource()
