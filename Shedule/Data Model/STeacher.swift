//
//  STeacher.swift
//  Shedule
//
//  Created by George on 18.10.14.
//  Copyright (c) 2014 SMediaLink. All rights reserved.
//

import Foundation
import CoreData

class STeacher: NSManagedObject {

    @NSManaged var department: NSManagedObject
    @NSManaged var classes: NSManagedObject

}
