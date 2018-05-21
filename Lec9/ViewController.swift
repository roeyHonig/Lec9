//
//  ViewController.swift
//  Lec9
//
//  Created by hackeru on 7 Sivan 5778.
//  Copyright © 5778 student.roey.honig. All rights reserved.
//

import UIKit
// what we need to play a sound file
// 1) import
// 2) var player: field optional (init)
// viewDidLoad try to get a url from the resources!
// 3) viewDidLoad player = new...
// 4) use the player.play()

import AVFoundation // framework for playing sound
class ViewController: UIViewController {
    var player: AVAudioPlayer?
    
    @IBAction func playSound(_ sender: Any) {
        self.player?.play()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        guard let url = Bundle.main.url(forResource: "sound", withExtension: "wav") else {
            // throw an exception \ error
            // this massage will show up on the developer console
            fatalError("Could not locate the requested file")
        }
        
        // 3 ways to handle exceptions
        // 1).
        // init, the ! is requiers by the constractor which throws
        // docatch syntex
        
        /*
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch let err {
            // print the error description
            print(err.localizedDescription)
        }
        */
        
        
        
        // 2).
        // shorter verstion, which doesn't really handle the error
        // i'm commanding ios that it will work and let's get on with our lives
         player = try! AVAudioPlayer(contentsOf: url)
         
        
        
        // 3).
        // this is kind like saying: lets try to run this player, if it fails, it fails, and p, our local veriable
        // will be marked as optional, so we know to be carfull with it
        // let p = try? AVAudioPlayer(contentsOf: url)
        
        //
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

