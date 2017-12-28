//
//  Title+CoreDataProperties.swift
//  capstone
//
//  Created by Rahul Dhiman on 28/12/17.
//  Copyright © 2017 Rahul Dhiman. All rights reserved.
//

import Foundation
import CoreData

extension Title {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Title>{
        return NSFetchRequest<Title>(entityName: "Title")
}
    
    @NSManaged public var lyrics:String
   
    
    convenience init(lyrics:String, context: NSManagedObjectContext){
        if let entit = NSEntityDescription.entity(forEntityName: "Title", in: context)
        {
            self.init(entity: entit, insertInto:context)
            self.lyrics = lyrics
        }
        else{
            fatalError("NO ENTITY FOUND!!")
        }
    }
    
}


