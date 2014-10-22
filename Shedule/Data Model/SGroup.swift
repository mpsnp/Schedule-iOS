//
//  SGroup.swift
//  Shedule
//
//  Created by George on 18.10.14.
//  Copyright (c) 2014 SMediaLink. All rights reserved.
//

import Foundation
import CoreData

class SGroup: NSManagedObject {

    @NSManaged var identifier: NSNumber
    @NSManaged var name: String
    @NSManaged var faculty: SFaculty
    @NSManaged var classes: NSSet

}
