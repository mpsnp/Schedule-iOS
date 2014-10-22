//
//  Model.swift
//  Shedule
//
//  Created by George on 19.10.14.
//  Copyright (c) 2014 SMediaLink. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class SModel {
    
    class var sharedInstance : SModel {
        struct SStatic {
            static let instance = SModel()
        }
        return SStatic.instance
    }
    
    init() {
        syncData()
    }
    
    func syncFaculties() {
        let urlString = "http://fpm.babichev.net/faculties?api=json"
        let url = NSURL(string: urlString)
        let request = NSURLRequest(URL: url)
        var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?> = nil
        if let data = NSURLConnection.sendSynchronousRequest(request, returningResponse: response, error: nil) {
            let faculties = NSJSONSerialization.JSONObjectWithData(data, options: .allZeros, error: nil) as [[String: AnyObject]]
            
            for facultyDict in faculties {
                println(facultyDict)
//                var faculty =
            }
        }
    }
    
    func getFaculty(#id: Int) -> SFaculty? {
        var result: SFaculty? = nil
        if let moc = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
            var fetchRequest = NSFetchRequest(entityName: "SFaculty")
            fetchRequest.predicate = NSPredicate(format: "identifier == \(id)")
            if let results = moc.executeFetchRequest(fetchRequest, error: nil) {
                if let res = results.first as SFaculty? {
                    result = res
                }
            }
        }
        return result
    }
    
    func syncData() {
        syncFaculties()
    }
}