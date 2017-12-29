//
//  MainViewController.swift
//  capstone
//
//  Created by Rahul Dhiman on 27/12/17.
//  Copyright © 2017 Rahul Dhiman. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController,UITextViewDelegate,UITextFieldDelegate {

    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var flag:Int = 0
    
    
    
    @IBOutlet var searchBtn: UIButton!
    
    @IBOutlet var artistname: UITextField!
    @IBOutlet var songname: UITextField!
    
    let ind = UIActivityIndicatorView()
    
    var songgggg:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.artistname.delegate = self
        self.songname.delegate = self
        
        DispatchQueue.main.async {
      
        self.TextField([self.artistname,self.songname])
            
        }
    }
    
    @IBAction func btn(_ sender: Any) {
        
        
        print("IM IN BTN")
        
        self.view?.alpha = 0.7
        view.endEditing(true)
        self.UISetup(enable: false)
        
        var ar = artistname.text!
        var sg = songname.text!
        
        print(ar)
        print(sg)
        
        //UIApplication.shared.beginIgnoringInteractionEvents()
        
        ind.activityIndicatorViewStyle = .gray
        ind.hidesWhenStopped=true
        ind.center=self.view.center
        ind.startAnimating()
        self.view.addSubview(ind)
        
        
        func get_Lyr(_ completion: @escaping (_ done: Bool, _ error: String?) -> Void){
            
            
        let flk = LyricsNetworking()
            
            if artistname.text == "" || songname.text == "" {
                alert(message: "Please fill in all the details")
                self.ind.stopAnimating()
            }
            else{
                
                
                
            
            flk.getLyrics(artist: ar, title: sg, completion: {
            error,song in
            
            if error != nil{
                print("errorororororoorororororororoororororor")
                completion(false,error)
                return
            }
            
            else{
                DispatchQueue.main.async {
                self.songgggg = song!
                    //print(self.songgggg)
                    if self.songgggg == "Lyrics not found!!"{
                        self.alert(message: "Lyrics not found!!")
                       self.UISetup(enable: false)
                        self.ind.stopAnimating()
                        self.flag = 0
                    }
                    else{
                        self.flag = 1
                    self.ind.stopAnimating()
                    self.UISetup(enable: true)
                    self.performSegue(withIdentifier: "ss", sender: self.songgggg)
                        //self.save(img: self.songgggg)
                        
                    }
                    
                }
                }
            
        })
                    
                    print("IN CORE DATA:")
                
                let newSong = NSEntityDescription.insertNewObject(forEntityName: "Artist", into: context)
                newSong.setValue(self.artistname.text!, forKey: "name")
                newSong.setValue(self.songname.text!, forKey: "song")
                newSong.setValue(self.songgggg, forKey: "lyrics")
                
                
                do{
                    try context.save()
                }
                catch{
                    alert(message: "Problem saving it to app!!")
                }
                
                
                
            self.artistname.text = ""
                self.songname.text = ""
            }
    }
        get_Lyr(){ (success, error) in
            DispatchQueue.main.async{
                self.searchBtn.isEnabled = true
            }
            if success == false {
                DispatchQueue.main.async{
                    self.alert(message: error!)
                }
            }
           // try! self.delegate.stack.saveContext()
            //try! delegate.stack.saveContext()
        }
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return false
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sg = segue.destination as! LyricsViewController
        sg.song = sender as! String
    }
    
    
    
    func UISetup(enable:Bool)
    {
        self.artistname.isEnabled=enable
        self.songname.isEnabled=enable
        self.searchBtn.isEnabled=enable
       // self.indicator.isHidden = enable
        if !enable
        {
            self.view.alpha = 0.8
        }
        else
        {
            self.view.alpha = 1.2
            
        }
        
    }
    func TextField(_ textFields: [UITextField]) {
        
        for textField in textFields {
            
            let textFieldPaddingViewFrame = CGRect(x: 0.0, y: 0.0, width: 13.0, height: 0.0)
            let textFieldPaddingView = UIView(frame: textFieldPaddingViewFrame)
            textField.leftView = textFieldPaddingView
            textField.leftViewMode = .always
            textField.textColor = UIColor.black
            
            
        }
    }
   
    
    
}

extension MainViewController {
    
    
    func alert(message:String )
    {
        DispatchQueue.main.async {
            
            
            let alertview = UIAlertController(title: "", message: message, preferredStyle: .alert)
            alertview.addAction(UIAlertAction(title: "Try Again!", style: .default, handler: {
                action in
                DispatchQueue.main.async {
                    
                   self.UISetup(enable: true)
                    self.dismiss(animated: true, completion: nil)
                    
                }
            }))
            self.present(alertview, animated: true, completion: nil)
        }
    }
    
   
    
}
