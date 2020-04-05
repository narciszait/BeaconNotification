//
//  ViewController.swift
//  Beacon Notify
//
//  Created by Narcis Zait on 04/04/2020.
//  Copyright © 2020 Narcis Zait. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var showNotificationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showNotification(_ sender: Any) {
        createNotification()
    }
}

