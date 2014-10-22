//
//  SFaculty.swift
//  Shedule
//
//  Created by George on 18.10.14.
//  Copyright (c) 2014 SMediaLink. All rights reserved.
//

import Foundation
import CoreData

class SFaculty: NSManagedObject {

    @NSManaged var identifier: NSNumber
    @NSManaged var name: String
    @NSManaged var classes: NSSet
    @NSManaged var groups: NSSet
    @NSManaged var departments: NSSet

}
