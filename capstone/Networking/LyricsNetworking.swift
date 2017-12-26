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
    
    var lyricsURL:[String]
    var songLyrics:String
   
    func getLyrics(artist:String,title:String,completion: @escaping (_ error:String?,_ data:[String]?)->())
    {
        
        let url = "https://api.lyrics.ovh/v1/\(artist)/\(title)"
        
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: URL(string: url)!){data,response,error in
            
            if error != nil{
                completion(error?.localizedDescription,nil)
            }
            
            let Data = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
            
            if let Lyrics = Data["lyrics"] as? [String:Any] {
                print(Lyrics)
            }
            
        }
        task.resume()
    }
}
