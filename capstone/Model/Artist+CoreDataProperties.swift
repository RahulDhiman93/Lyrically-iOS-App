//
//  Artist+CoreDataProperties.swift
//  capstone
//
//  Created by Rahul Dhiman on 28/12/17.
//  Copyright © 2017 Rahul Dhiman. All rights reserved.
//

import Foundation
import CoreData

extension Artist {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Artist>{
        return NSFetchRequest<Artist>(entityName: "Artist")
}
    
    @NSManaged public var name:String
    @NSManaged public var song:String
    
    convenience init(name:String ,song:String,context: NSManagedObjectContext){
        if let entit = NSEntityDescription.entity(forEntityName: "Artist", in: context)
        {
            self.init(entity: entit, insertInto:context)
           self.name = name
            self.song = song
        }
        else{
            fatalError("NO ENTITY FOUND!!")
        }
    }
}

extension Artist{
    @objc(addLyricsObject:)
    @NSManaged public func addToLyrics(_ value: Title)
    
    @objc(removeLyricsObject:)
    @NSManaged public func removeFromLyrics(_ value: Title)
    
    @objc(addLyrics:)
    @NSManaged public func addToLyrics(_ value: String)
    
    @objc(removeLyrics:)
    @NSManaged public func removeFromLyrics(_ value: String)
}
    
    

