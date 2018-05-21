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
