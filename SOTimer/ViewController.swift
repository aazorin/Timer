//
//  ViewController.swift
//  SOTimer
//
//  Created by Hitesh on 10/18/16.
//  Copyright © 2016 myCompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    var intCounter : Int = 0

    @IBOutlet weak var lblCounter: UILabel!
    
    @IBOutlet weak var btnStart: UIButton!
    
    @IBOutlet weak var btnStop: UIButton!
    
    @IBOutlet weak var btnReset: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblCounter.layer.cornerRadius = lblCounter.frame.size.width/2
        lblCounter.layer.masksToBounds = true
        
        btnStart.layer.cornerRadius = 5
        btnStart.layer.masksToBounds = true
        
        btnStop.layer.cornerRadius = 5
        btnStop.layer.masksToBounds = true
        
        btnReset.layer.cornerRadius = 5
        btnReset.layer.masksToBounds = true
        
        btnStart.enabled = true
        btnStop.enabled = false
        btnReset.enabled = false

    }

    @IBAction func actionStart(sender: AnyObject) {
        //Schedule a timer
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
        
        btnStart.enabled = false
        btnStop.enabled = true
        btnReset.enabled = true
    }
    
    func updateCountdown() {
        intCounter += 1

        //Set counter in UILabel
        lblCounter.text! = String(format: "%02d:%02d:%02d", intCounter / 3600, (intCounter % 3600) / 60, (intCounter % 3600) % 60)
    }
    
    @IBAction func actionStop(sender: AnyObject) {
        //Invalidate timer
        timer.invalidate()
        
        btnStart.enabled = true
        btnStop.enabled = false
        btnReset.enabled = true
    }
    
    @IBAction func actionReset(sender: AnyObject) {
        intCounter = 0
        actionStop(sender)
        lblCounter.text! = "00:00:00"
        
        btnStart.enabled = true
        btnStop.enabled = false
        btnReset.enabled = false
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

