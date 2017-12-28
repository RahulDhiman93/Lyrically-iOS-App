//
//  LyricsViewController.swift
//  capstone
//
//  Created by Rahul Dhiman on 27/12/17.
//  Copyright © 2017 Rahul Dhiman. All rights reserved.
//

import UIKit

class LyricsViewController: UIViewController {
    
    @IBAction func back(_ sender: Any) {
        
       dismiss(animated: true, completion: nil)
        print("IM IN BACK BTN")
        
    }
    
    
   
    
    var song:String = ""
    
    
    
    @IBOutlet var lyricstext: UITextView!
    
    
    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        
      lyricstext.text = song
        
    }

    

}
