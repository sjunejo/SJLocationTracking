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
import CoreData

protocol SJLocationTrackerDelegate {

  func getStoredLocationData()->[(NSManagedObject)]?
  func attemptedToSendLocationData(sentSuccessfully: Bool)
}

class LocationTracker: NSObject, CLLocationManagerDelegate, SJLocationTrackerDelegate {
    
    var manager: CLLocationManager?
    var viewControllerDelegate: ViewControllerDelegate?
  
    var httpController: SJHttpController?
  
    var databaseController: DatabaseController?
  
    var locationTrackerAccuracy: CLLocationAccuracy? {
      set {
        // TODO: Do we have to stop and start location services?
        manager?.desiredAccuracy = self.locationTrackerAccuracy!
      }
      get {
        return manager?.desiredAccuracy
      }
    }
  
    override init() {
      httpController = SJHttpController()
      
      let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
      let managedContext = appDelegate.managedObjectContext!
      
      let locationDataEntity = NSEntityDescription.entityForName(Constants.coreData.locationEntity, inManagedObjectContext: managedContext)

      databaseController = DatabaseController(managedObjectContext: managedContext)
    }
  
  
    func requestPermissions()-> Bool{
        manager = CLLocationManager()
        switch CLLocationManager.authorizationStatus(){
            case .NotDetermined:
                manager!.requestAlwaysAuthorization()
            case .AuthorizedWhenInUse, .Restricted, .Denied:
              println("Need to show alert")
              if UIApplication.sharedApplication().applicationState == .Active {
                viewControllerDelegate?.showLocationServicesAlert()
              }
            case .AuthorizedAlways, .AuthorizedWhenInUse:
              startLocationTracking()
             default:
                break
        }
        return true 
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedAlways || status == .AuthorizedWhenInUse {
          startLocationTracking()
      }
    }
  
  func startLocationTracking(){
    manager!.delegate = self
    manager!.pausesLocationUpdatesAutomatically = false
    manager!.startUpdatingLocation()
  }
  
  // Called when a new location is received
  func locationManager(manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!) {
    
      // Take salient pieces of location data and display them in text view
    var locationDataArray:[(typeOfData: String, value: String)] = []
    locationDataArray.append(typeOfData: Constants.locationDataKeys.locationHorizontalAccuracy, value: newLocation.horizontalAccuracy.description)
    locationDataArray.append(typeOfData: Constants.locationDataKeys.locationLatitute, value: newLocation.coordinate.latitude.description)
    locationDataArray.append(typeOfData: Constants.locationDataKeys.locationLongitude, value: newLocation.coordinate.longitude.description)
    locationDataArray.append(typeOfData: Constants.locationDataKeys.locationTimestamp, value: newLocation.timestamp.description)
  
    
      println("New location: \(newLocation.description)")
      databaseController?.saveData(locationDataArray)
      viewControllerDelegate?.updateUI(locationDataArray)
  }
  
  func attemptedToSendLocationData(sentSuccessfully: Bool){
    
  }
  
  func getStoredLocationData() -> [(NSManagedObject)]?{
    return nil
  }
  
}