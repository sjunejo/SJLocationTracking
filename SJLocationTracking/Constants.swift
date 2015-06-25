//
//  Constants.swift
//  SJLocationTracking
//
//  Created by Sadruddin Junejo on 21/06/2015.
//  Copyright (c) 2015 SJunejo. All rights reserved.
//

import Foundation


struct Constants {
  
  struct UIAlertViewControllerStrings {
    static let locationServicesUnavailableTitle: String = "Location services unavailable"
    static let locationServicesUnavailableMessage: String  = "Sorry, location services are unavailable for your application"
    static let ok: String = "OK"
    static let cancel: String = "Cancel"
  }
  
  struct locationDataKeys {
    static let locationLongitude = "Longitude"
    static let locationLatitute = "Latitude"
    static let locationHorizontalAccuracy = "Horizontal Accuracy"
    static let locationTimestamp = "Timestamp"
  }
  
  struct tableViewLocationDataKeys {
    static let tableViewCellIdentifier = "cell_a"
  }
  
}