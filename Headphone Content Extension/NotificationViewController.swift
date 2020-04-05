//
//  NotificationViewController.swift
//  Headphone Content Extension
//
//  Created by Narcis Zait on 04/04/2020.
//  Copyright © 2020 Narcis Zait. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI
import SwiftyGif

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        do {
            let gif = try UIImage(gifName: "Airpods.gif")
            imageView.setGifImage(gif)
        } catch {
            print(error)
        }
        
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["headphoneNotification"])
    }
    
}
