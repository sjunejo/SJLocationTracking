//
//  SJHttpController.swift
//  SJLocationTracking
//
//  Interacts with web service to store location data.
//  Created by Sadruddin Junejo on 28/06/2015.
//  Copyright (c) 2015 SJunejo. All rights reserved.
//

import Foundation
import Alamofire

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
  
  /* Get JSON string from LocationTracker
  / because there's no real point in
  / Having the HttpController worry about Database stuff
  */
  func sendStoredLocationData(){
    let jsonLocationData = locationTrackerDelegate?.getStoredLocationDataAsArrayOfDictionaries()
    
    Alamofire.request(.POST, "http://www.google.com", parameters: jsonLocationData)
    
    print(jsonLocationData?.description)
  }
  
  
  
}