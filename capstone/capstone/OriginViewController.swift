//
//  OriginViewController.swift
//  VRTourist
//
//  Created by Rahul Dhiman on 22/12/17.
//  Copyright © 2017 Rahul Dhiman. All rights reserved.
//

import UIKit
import CoreData

class OriginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var fetchedResultsController : NSFetchedResultsController<NSFetchRequestResult>?
    
    
    
    
    
    func fetchDue(fetchedResultsController : NSFetchedResultsController<NSFetchRequestResult>? , completion:()->())
    {
        fetchedResultsController?.delegate = self as? NSFetchedResultsControllerDelegate
        search()
        completion()
        
        
    }
}
extension  OriginViewController {
    
    func search() {
        if let fc = fetchedResultsController {
            do {
                try fc.performFetch()
            } catch let e as NSError {
                print("error in \(e)")
            }
        }
    }
}



    

