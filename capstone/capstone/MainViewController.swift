//
//  MainViewController.swift
//  capstone
//
//  Created by Rahul Dhiman on 27/12/17.
//  Copyright © 2017 Rahul Dhiman. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btn(_ sender: Any) {
        
        func get_Lyr(_ completion: @escaping (_ done: Bool, _ error: String?) -> Void){
        
        
        let flk = LyricsNetworking()
      
        flk.getLyrics(artist: "coldplay", title: "paradise", completion: {
            error,song in
            
            if error != nil{
                print("errorororororoorororororororoororororor")
                completion(false,error)
                return
            }
            
            else{
                print(song!)
            }
            
            
        })
       
    }
        get_Lyr(){ (success, error) in
            DispatchQueue.main.async{
                //self.NC.isEnabled = true
            }
            if success == false {
                DispatchQueue.main.async{
                    //self.alert(error: error!)
                }
            }
           // try! self.delegate.stack.saveContext()
        }
        
    }


}
