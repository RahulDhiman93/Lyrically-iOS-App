//
//  InternetErrorViewController.swift
//  capstone
//
//  Created by Rahul Dhiman on 17/01/18.
//  Copyright © 2018 Rahul Dhiman. All rights reserved.
//

import UIKit

class InternetErrorViewController: UIViewController {
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tryagain(_ sender: Any) {
        
    DispatchQueue.main.async {
        self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    
    

}
