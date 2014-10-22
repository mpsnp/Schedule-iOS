//
//  ViewController.swift
//  Shedule
//
//  Created by George on 17.10.14.
//  Copyright (c) 2014 SMediaLink. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class SChooseGroupViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    lazy var faculty: SFaculty? = SModel.sharedInstance.getFaculty(id: 2)
    
    lazy var fetchedResultsController: NSFetchedResultsController = {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        var fetchRequest = NSFetchRequest(entityName: "SGroup")
        if let fac = self.faculty {
            fetchRequest.predicate = NSPredicate(format: "faculty == %@", fac)
        }
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        var controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: appDelegate.managedObjectContext!, sectionNameKeyPath: nil, cacheName: nil)
        controller.delegate = self
        return controller
    }()
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type {
        case .Insert:
            let indexes: [AnyObject] = [newIndexPath as AnyObject]
            tableView.insertRowsAtIndexPaths(indexes, withRowAnimation: .Left)
        case .Delete:
            let indexes: [AnyObject] = [newIndexPath as AnyObject]
            tableView.deleteRowsAtIndexPaths(indexes, withRowAnimation: .Left)
        case .Move:
            tableView.moveRowAtIndexPath(indexPath!, toIndexPath: newIndexPath!)
        case .Update:
            let indexes: [AnyObject] = [newIndexPath as AnyObject]
            tableView.reloadRowsAtIndexPaths(indexes, withRowAnimation: .Middle)
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("GroupCell", forIndexPath: indexPath) as SGroupTableViewCell
        
        if let group = fetchedResultsController.objectAtIndexPath(indexPath) as? SGroup {
            cell.labelTitle.text = group.name
        }
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var result = 0
        if let results = fetchedResultsController.fetchedObjects {
            result = results.count
        }
        return result
    }

}

