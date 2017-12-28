//
//  TableViewController.swift
//  capstone
//
//  Created by Rahul Dhiman on 28/12/17.
//  Copyright © 2017 Rahul Dhiman. All rights reserved.
//

import Foundation
import CoreData
import UIKit

let delegate1 = UIApplication.shared.delegate as! AppDelegate

class TableViewController:CoreDataViewController,UITableViewDataSource{
    
    
    
    let stack = delegate1.stack
    
    let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "Artist")
    
    var ffetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>?
    
    var pp :Artist!
   
  
    var artName = [String]()
    var sgName = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(pp.name.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let obj = fetchedResultsController!.object(at: indexPath) as? Artist
        if obj?.name == nil || obj?.song == nil {
            DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async  {
                let nameData = obj!.name
                let songData = obj!.song
                self.fetchedResultsController?.managedObjectContext.perform{

                    try! self.delegate.stack.saveContext()
                    cell.artistName.text = nameData
                    cell.TitleName.text = songData
                }
            }
        }
        
        
        if obj?.name != nil || obj?.song == nil {
            cell.artistName.text = obj!.name
            cell.TitleName.text = obj!.song
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}
extension TableViewController {
    
    func loadData(){
        fr.sortDescriptors = [NSSortDescriptor(key: "name", ascending:false),NSSortDescriptor(key: "song",ascending: false)]
        
        ffetchedResultsController = NSFetchedResultsController(fetchRequest: fr, managedObjectContext: stack.context, sectionNameKeyPath:nil, cacheName: nil)
        
        fetchDue(fetchedResultsController: ffetchedResultsController, completion: {
            
            
            let p = [Artist]()
            
            DispatchQueue.global(qos: .userInitiated).async {
                
                var arTable = [String]()
                var sgTable = [String]()
                
                for a in p
                {
                    var arT:String = ""
                    var sgT:String = ""
                    arT = a.name
                    sgT = a.song
                    
                    arTable.append(arT)
                    sgTable.append(sgT)
                    
                }
                

                DispatchQueue.main.async {
                    self.artName = arTable
                    self.sgName = sgTable
                }
            }
        })
        
    }
   
    
    func fetchDue(fetchedResultsController :  NSFetchedResultsController<NSFetchRequestResult>?, completion:()->())
    {
        fetchedResultsController?.delegate = self as? NSFetchedResultsControllerDelegate
        
        completion()
        
    }
}
