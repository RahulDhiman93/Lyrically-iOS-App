//
//  FetchViewController.swift
//  VRTourist
//
//  Created by Rahul Dhiman on 21/12/17.
//  Copyright © 2017 Rahul Dhiman. All rights reserved.
//

import UIKit
import CoreData

class FetchViewController: UIViewController {

    var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>?
  
    func fetchDue(fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>?, completion:()->())
    {
        fetchedResultsController?.delegate = self as? NSFetchedResultsControllerDelegate
        search()
        completion()
    }
}

extension FetchViewController{
    func search(){
        if let fc = fetchedResultsController {
            do{
                try fc.performFetch()
            }catch let e as NSError{
                print("Error in \(e)")
            }
            
        }
    }
}
