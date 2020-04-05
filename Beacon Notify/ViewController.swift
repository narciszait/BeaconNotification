//
//  ViewController.swift
//  Beacon Notify
//
//  Created by Narcis Zait on 04/04/2020.
//  Copyright © 2020 Narcis Zait. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var showNotificationButton: UIButton!
    var locationManager: CLLocationManager!
    var beaconRegion: CLBeaconRegion!
    let uuid = UUID(uuidString: "A3B874BA-1743-4F41-8880-524275DB018D")!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        beaconRegion = CLBeaconRegion(uuid: uuid, major: 785, minor: 785, identifier: "com.narcis.headphones")
        beaconRegion.notifyOnEntry = true
        beaconRegion.notifyOnExit = true
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    startScanning()
                }
            }
        }
    }
    
    func startScanning() {
        
        locationManager.startMonitoring(for: beaconRegion)
//        locationManager.startRangingBeacons(satisfying: CLBeaconIdentityConstraint(uuid: uuid, major: 1, minor: 1))
    }
    
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion){
        locationManager.requestState(for: region)
    }
    
    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
        print(state)
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("did enter")
        createNotification()
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("did exit")
        locationManager.stopMonitoring(for: region)
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["headphoneNotification"])
    }
    
    @IBAction func showNotification(_ sender: Any) {
        createNotification()
//        startScanning()
    }
}

