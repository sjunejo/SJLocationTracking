//
//  SJLocation.swift
//  
//
//  Created by Sadruddin Junejo on 29/06/2015.
//
//

import Foundation
import CoreData

class SJLocation: NSManagedObject {

    @NSManaged var horizontalaccuracy: String
    @NSManaged var latitude: String
    @NSManaged var longitude: String
    @NSManaged var timestamp: String

}
