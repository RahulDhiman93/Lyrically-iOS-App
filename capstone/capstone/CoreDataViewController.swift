//
//  CoreDataViewController.swift
//  VRTourist
//
//  Created by Rahul Dhiman on 22/12/17.
//  Copyright © 2017 Rahul Dhiman. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class CoreDataViewController: UIViewController,UITableViewDelegate {


    @IBOutlet var TableView: UITableView!
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    var deleted = [IndexPath]()
    
    var updated = [IndexPath]()
    
    var insert = [IndexPath]()
    
    var fetchedResultsController : NSFetchedResultsController<Artist>?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func search(){
        if let fc = fetchedResultsController{
            do{
                try fc.performFetch()
            }catch {
                print("error")
            }
        }
    }
    
    func numberOfSectionInTableView(_ TableView: UITableView) -> Int{
        if let cnt = self.fetchedResultsController{
            return (cnt.sections?.count)!
        }
        else{
            return 0
        }
    }
    
    @objc func TableView(_ TableView: UITableView, numberOfItemsInSection section: Int)->Int{
        if let SC = self.fetchedResultsController!.sections{
            return SC[section].numberOfObjects
        }
        return 0
    }
    
    @objc(TableView:didSelectItemAtIndexPath:) func TableView(_ TableView:UITableView,didSelectItemAt indexPath:IndexPath){
        
        if let fc = self.fetchedResultsController{
            fc.managedObjectContext.delete((fetchedResultsController?.object(at: indexPath))! as NSManagedObject)
            try! self.delegate.stack.saveContext()
            DispatchQueue.main.async {
                
                
                self.TableView.reloadData()
                
            }
            
        
        }
    }
    
}

extension CoreDataViewController:NSFetchedResultsControllerDelegate{
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>)
    {
       
        self.insert  = [IndexPath]()
        self.deleted = [IndexPath]()
        self.updated = [IndexPath]()
        
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .delete:
            self.deleted.append(indexPath!)
            break
        case .insert:
            self.insert.append(newIndexPath!)
            break
        case .update:
            self.updated.append(indexPath!)
            break
        default:
            return
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.TableView.performBatchUpdates({ () -> Void in
            for i in self.updated {
               
                self.TableView.reloadRows(at: [i], with: .fade)
            }
            for i in self.insert {
                self.TableView.insertRows(at: [i], with: .fade)
                
            }
            for i in self.deleted {
                self.TableView.deleteRows(at: [i], with: .fade)
            }
            
        }, completion: nil)
        
        
    }
}
