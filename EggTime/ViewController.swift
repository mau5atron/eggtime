//
//  ViewController.swift
//  EggTime
//
//  Created by Gabriel Betancourt on 4/6/19.
//  Copyright © 2019 Gabriel Betancourt. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var timeLeftField: NSTextField!
    @IBOutlet weak var eggImageView: NSImageView!
    @IBOutlet weak var startButton: NSButton!
    @IBOutlet weak var stopButton: NSButton!
    @IBOutlet weak var fuckoffButton: NSButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func startButtonClicked(_ sender: Any) {
    }
    
    @IBAction func stopButtonClicked(_ sender: Any) {
    }
    
    
    @IBAction func fuckoffButtonClicked(_ sender: Any) {
    }

    @IBAction func startTimerrMenuItemSelected(_ sender: Any){
        startButtonClicked(sender)
    }
    
    @IBAction func stopTimerMenuItemSelected(_ sender: Any){
        stopButtonClicked(sender)
    }
    
    @IBAction func fuckoffTimerMenuItemSelected(_ sender: Any){
        fuckoffButtonClicked(sender)
    }
}


