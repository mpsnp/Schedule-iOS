//
//  SClass.swift
//  Shedule
//
//  Created by George on 18.10.14.
//  Copyright (c) 2014 SMediaLink. All rights reserved.
//

import Foundation
import CoreData

class SClass: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var number: NSNumber
    @NSManaged var type: String
    @NSManaged var cabinet: String
    @NSManaged var week: NSNumber
    @NSManaged var day: NSNumber
    @NSManaged var group: SGroup
    @NSManaged var department: SDepartment
    @NSManaged var faculty: SFaculty
    @NSManaged var teacher: STeacher

}
