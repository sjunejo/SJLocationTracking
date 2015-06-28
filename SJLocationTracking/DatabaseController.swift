//
//  DatabaseController.swift
//  SJLocationTracking
//
//  Created by Sadruddin Junejo on 28/06/2015.
//  Copyright (c) 2015 SJunejo. All rights reserved.
//

import Foundation
import CoreData

class DatabaseController {
  
  var managedObjectContext: NSManagedObjectContext?
  
  init(managedObjectContext: NSManagedObjectContext){
    self.managedObjectContext = managedObjectContext
  }
  
  func saveData(locationDataArray: [(typeOfData: String, value: String)]){
    dispatch_async(dispatch_get_main_queue()){
      //println("Saving location data...")
      
      let locationDataEntity = NSManagedObject(entity: NSEntityDescription.entityForName(Constants.coreData.locationEntity, inManagedObjectContext: self.managedObjectContext!)!, insertIntoManagedObjectContext: self.managedObjectContext)
     
      for (typeOfData: String, value: String) in locationDataArray {
        locationDataEntity.setValue(value, forKey: typeOfData.lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil))
        
      }
    
      var error: NSError?
      if !self.managedObjectContext!.save(&error){
        println("Could not save \(error), \(error?.userInfo)")
      }
    }
  }
  
  func getData()->[(NSManagedObjectContext)] {
    var locationDataObjects: [(NSManagedObjectContext)]? = nil
    return locationDataObjects!
  }
  
  
  
}