//
//  BeaconManager.swift
//  Beacon Notify
//
//  Created by Narcis Zait on 05/04/2020.
//  Copyright © 2020 Narcis Zait. All rights reserved.
//

import Foundation
import CoreLocation
import CoreBluetooth

class BeaconManager: NSObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager!
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager.delegate = self
//        locationManager.requestAlwaysAuthorization()
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
        let uuid = UUID(uuidString: "A3B874BA-1743-4F41-8880-524275DB018D")! //A3B874BA-1743-4F41-8880-524275DB018D
        let beaconRegion = CLBeaconRegion(uuid: uuid, major: 1, minor: 1, identifier: "com.narcis.headphones")

        locationManager.startMonitoring(for: beaconRegion)
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("did enter")
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("did exit")
    }
}
