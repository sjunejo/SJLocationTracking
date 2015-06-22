//
//  LocationTracker.swift
//  SJLocationTracking
//
//  Collects location data
//  Created by Sadruddin Junejo on 18/06/2015.
//  Copyright (c) 2015 SJunejo. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

class LocationTracker: NSObject, CLLocationManagerDelegate {
    
    var manager: CLLocationManager?
    var viewControllerDelegate: ViewControllerDelegate?
  
    var locationTrackerAccuracy: CLLocationAccuracy? {
      set {
        // TODO: Do we have to stop and start location services?
        manager?.desiredAccuracy = self.locationTrackerAccuracy!
      }
      get {
        return manager?.desiredAccuracy
      }
    }
  
    func requestPermissions()-> Bool{
        manager = CLLocationManager()
        switch CLLocationManager.authorizationStatus(){
            case .NotDetermined:
                manager!.requestAlwaysAuthorization()
            case .AuthorizedWhenInUse, .Restricted, .Denied:
              if UIApplication.sharedApplication().applicationState == .Active {
                viewControllerDelegate?.showLocationServicesAlert()
              }
             default:
                break
        }
        return true 
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedAlways || status == .AuthorizedWhenInUse {
            manager.delegate = self
            manager.startMonitoringSignificantLocationChanges()
      }
    }
  
  // Called when a new location is received
  func locationManager(manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!) {
  }
    
}