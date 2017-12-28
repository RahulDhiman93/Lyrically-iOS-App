//
//  LyricsNetworking.swift
//  capstone
//
//  Created by Rahul Dhiman on 26/12/17.
//  Copyright © 2017 Rahul Dhiman. All rights reserved.
//

import Foundation
import UIKit

struct LyricsNetworking {
    
   
   
    func getLyrics(artist:String,title:String, completion:@escaping (_ error:String?,_ data:String?)->())
     {
        
        var lyr:String = ""
        
        let singer = artist.replacingOccurrences(of: " ", with: "%20")
        let song = title.replacingOccurrences(of: " ", with: "%20")
        
        
        let url =  URL(string:"https://api.lyrics.ovh/v1/\(singer)/\(song)")!
        
        let session = URLSession.shared
       
        let task = session.dataTask(with: url) { data,response,error in
            
            if error != nil {
                completion(error?.localizedDescription,nil)
                return
            }
            
            let parsedata = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as AnyObject
            
            if let data11 = parsedata["lyrics"] as? String {
                lyr = data11
                print("im in datatat")
                //print(lyr)
                completion(nil,lyr)
            }
            else{
              completion(nil,"Lyrics not found!!")
            }
           }
        
        task.resume()
       
        
    }
    
    

}


