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


class LocationTracker: NSObject, CLLocationManagerDelegate {
    
    var manager: CLLocationManager?
    
    var viewControllerDelegate: ViewControllerDelegate?
    
    func requestPermissions()-> Bool{
        manager = CLLocationManager()
        switch CLLocationManager.authorizationStatus(){
            
            case .NotDetermined:
                manager!.requestAlwaysAuthorization()
            
            case .AuthorizedWhenInUse, .Restricted, .Denied:
                viewControllerDelegate?.showLocationServicesAlert()
       
            default:
                break
        
        }
        
        if CLLocationManager.authorizationStatus() == .NotDetermined {
            manager?.requestAlwaysAuthorization();
        }
        
        return false
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        if status == .AuthorizedAlways || status == .AuthorizedWhenInUse {
            manager.startUpdatingLocation()
        
        }
        
        
    }
    
    

    
}