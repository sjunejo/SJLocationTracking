//
//  SJHttpController.swift
//  SJLocationTracking
//
//  Created by Sadruddin Junejo on 28/06/2015.
//  Copyright (c) 2015 SJunejo. All rights reserved.
//

import Foundation

class SJHttpController: NSObject {
  
  var locationTrackerDelegate: SJLocationTrackerDelegate?
  
  override init() {
    super.init()
    startSendLocationDataTask()
  }
  
  func setDelegate(locationTracker: SJLocationTrackerDelegate){
   self.locationTrackerDelegate = locationTracker
  }
  
  func startSendLocationDataTask(){
    NSTimer.scheduledTimerWithTimeInterval(Constants.sendLocationDataInterval.locationDataIntervalSmall as Double, target: self, selector: Selector("sendStoredLocationData"), userInfo: nil, repeats: true)
  }
  
  func sendStoredLocationData(){
    print("SENDING LOCATION DATA")
  }
  
  
  
}