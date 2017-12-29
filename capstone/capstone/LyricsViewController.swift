//
//  LyricsViewController.swift
//  capstone
//
//  Created by Rahul Dhiman on 27/12/17.
//  Copyright © 2017 Rahul Dhiman. All rights reserved.
//

import UIKit

class LyricsViewController: UIViewController {
    

    
   
    
    var song:String = ""
    
    
    
    @IBOutlet var lyricstext: UITextView!
    
    
    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.song == "" {
            print("IM EMPTY")
        }
        
      lyricstext.text = song
        lyricstext.isUserInteractionEnabled = true
        
    }

    

}
