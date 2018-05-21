//
//  ViewController.swift
//  Lec9
//
//  Created by hackeru on 7 Sivan 5778.
//  Copyright © 5778 student.roey.honig. All rights reserved.
//

import UIKit


import AVFoundation // framework for playing sound
class ViewController: UIViewController {
    
    @IBOutlet weak var constraintLeftTop: NSLayoutConstraint!
    @IBOutlet weak var starTop: NSLayoutConstraint!
    @IBOutlet weak var rightMBallTop: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // we want to performe the seguaway from the code using its identifier
        print("hello")
        //when animation ends, last position
        starTop.constant += 100
        
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 5, options: [], animations: {
            // animation here
            self.view.layoutIfNeeded()
        }) { (isComplete) in
            self.performSegue(withIdentifier: "animateSegway", sender: nil)
            
        }
        
        
        //
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

