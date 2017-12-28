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
    @NSManaged public var song:String
    
    
    
    
    
    
    
}

