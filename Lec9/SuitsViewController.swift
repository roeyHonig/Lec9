//
//  SuitsViewController.swift
//  Lec9
//
//  Created by hackeru on 7 Sivan 5778.
//  Copyright © 5778 student.roey.honig. All rights reserved.
//

import UIKit
import AVFoundation

class SuitsViewController: UIViewController {
    
    // very important!!!!!!!!!!!!
    // this is how we get a ref to the shered instance which is the AppDelegate
    // this could be very useful when i have data that all my viewControllers preaty much need
    // so it's good practice to save thngs in the AppDelegate and access them
    lazy var delegate: AppDelegate = {
        // app is what is common to all the vieControllers - the application itself if you will
        let app = UIApplication.shared
        // get the delegate from the app -> cast it to AppDelagate
        let del = app.delegate as! AppDelegate
        return del
    }()
    
    @IBAction func printDataBase(_ sender: UIBarButtonItem) {
        delegate.loadCastMember()
    }
    @IBAction func addMember(_ sender: UIBarButtonItem) {
        //TODO: present alert dialog
        
        
        let alertCtrl = UIAlertController (title: "Add a Member to the Cast", message: "Are You Sure?", preferredStyle: .alert)
        
        
        alertCtrl.addTextField { (tf) in
            tf.placeholder = "First Name..."
        }
        
        alertCtrl.addTextField { (tf) in
            tf.placeholder = "Last Name..."
        }
        
        alertCtrl.addTextField { (tf) in
            tf.placeholder = "Age ?"
        }
        //*** init an ACTION Button (we need Positive and Negetive Buttons)
        let yes = UIAlertAction(title: "Yes!", style: UIAlertActionStyle.default) { (btn) in
            print("Ok was Clicked")
            let fName = alertCtrl.textFields![0].text ?? ""
            let lName = alertCtrl.textFields![1].text ?? ""
            let age = Int (alertCtrl.textFields![2].text ?? "") ?? 0
            
            //!!!!!!!!!!  Home Work - create an object of CastMember and pass it to the mathod
            self.delegate.saveCastMember(fName: fName, lName: lName, age: age)
        }
        
        let no = UIAlertAction(title: "No!, Abort", style: UIAlertActionStyle.cancel) { (btn) in
            print("No Member was added")
        }
        
        //*** assign the POSITIVE \ Negetive BUttons we've just created to the DialogController
        alertCtrl.addAction(yes)
        alertCtrl.addAction(no)
        
        //*** present it- when a ViewController wants to present another ViewController
        
        
        
        self.present(alertCtrl, animated: true) {
            // TODO: do something
        }
        
        
    }
    @IBAction func playSound(_ sender: UIButton) {
        // the player will only be initalized when we play for the first time
        // the viewcontroller will load faster: no sound init in viewDidLoad
        // that's why, viewDidLoad will complete faster
        player.play()
        p.play()
    }
    
    lazy var player: AVAudioPlayer = initPlayer()
    
    // Lazy variable!? - variables that are initiazliazed only when needed
    // a sound that takes some time to load but is rearlly nedded is a goodexampple
    // the syntax is as follows (look at the AppDelegate, the part about the DataBase - CoreData):
    // syntax: lazy var
    // syntax: annotate the type
    // syntax: closure or method that will be invoked, if indeed it's time to init the lazy
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        //
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // we've written this seperate init method
    func initPlayer() -> AVAudioPlayer {
        // let's write it as a regular variable
        let url = Bundle.main.url(forResource: "sound", withExtension: "wav")!
        let player = try! AVAudioPlayer(contentsOf: url)
        return player
    
    }
    
    
    // so the qeqvilatn and swift nicer way of defining how to init the lazy
    // with out writing a seperate method
    // Nicer Syntex:
    lazy var p: AVAudioPlayer = {
        let url = Bundle.main.url(forResource: "sound", withExtension: "wav")!
        let player = try! AVAudioPlayer(contentsOf: url)
        return player
    }() // self inviking closer
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
