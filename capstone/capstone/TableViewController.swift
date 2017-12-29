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


class TableViewController:UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var userArray:[Artist] = []
    
    var lyricssss:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        self.fetchData()
        self.tableView.reloadData()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
      return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let arName = userArray[indexPath.row]
        cell.artistName.text = arName.name
        cell.TitleName.text = arName.song
        
        
        
        return cell
    }
        

    
    func fetchData(){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            userArray = try context.fetch(Artist.fetchRequest())
        }
        catch{
              alert(message: "Error loading Data")
        }
        
}
    
    
}

extension TableViewController {
    
    
    func alert(message:String )
    {
        DispatchQueue.main.async {
            
            
            let alertview = UIAlertController(title: "", message: message, preferredStyle: .alert)
            alertview.addAction(UIAlertAction(title: "Try Again!", style: .default, handler: {
                action in
                DispatchQueue.main.async {
                    
                  //  self.UISetup(enable: true)
                }
            }))
            self.present(alertview, animated: true, completion: nil)
        }
    }
    
}

