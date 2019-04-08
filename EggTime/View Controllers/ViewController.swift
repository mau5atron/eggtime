//
//  ViewController.swift
//  EggTime
//
//  Created by Gabriel Betancourt on 4/6/19.
//  Copyright © 2019 Gabriel Betancourt. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    var eggTime = EggTime()
    
    @IBOutlet weak var timeLeftField: NSTextField!
    @IBOutlet weak var eggImageView: NSImageView!
    @IBOutlet weak var startButton: NSButton!
    @IBOutlet weak var stopButton: NSButton!
    @IBOutlet weak var fuckoffButton: NSButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eggTime.delegate = self
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func startButtonClicked(_ sender: Any) {
        if eggTime.timerPaused {
            eggTime.resumeTimer()
        } else {
            eggTime.duration = 360
            eggTime.startTimer()
        }
    }
    
    @IBAction func stopButtonClicked(_ sender: Any) {
        eggTime.stopTimer()
    }
    
    @IBAction func fuckoffButtonClicked(_ sender: Any) {
        eggTime.fuckoffTimer()
        updateDisplay(for: 360)
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

extension ViewController: EggTimeProtocol {
    func timeRemainingOnTimer(_ timer: EggTime, timeRemaining: TimeInterval){
        updateDisplay(for: timeRemaining)
    }
    
    func timerHasFinished(_ timer: EggTime) {
        updateDisplay(for: 0)
    }
}

extension ViewController {
    func updateDisplay(for timeRemaining: TimeInterval){
        timeLeftField.stringValue = textToDisplay(for: timeRemaining)
        eggImageView.image = imageToDisplay(for: timeRemaining)
    }
    
    private func textToDisplay(for timeRemaining: TimeInterval) -> String {
        if timeRemaining == 0 {
            return "Done!"
        }
        
        let minutesRemaining = floor(timeRemaining / 60)
        let secondsRemaining = timeRemaining - (minutesRemaining * 60)
        let secondsDisplay = String(format: "%02d", Int(secondsRemaining))
        let timeRemainingDisplay = "\(Int(minutesRemaining)):\(secondsDisplay)"
        
        return timeRemainingDisplay
    }
    
    private func imageToDisplay(for timeRemaining: TimeInterval) -> NSImage? {
        let percentageComplete = 100 - (timeRemaining / 360 * 100)
        
        if eggTime.timerPaused {
            let pausedImageName = (timeRemaining == 0) ? "100" : "Paused"
            return NSImage(named: pausedImageName)
        }
        
        let imageName: String
        switch percentageComplete {
        case 0 ..< 25:
            imageName = "0"
        case 25 ..< 50:
            imageName = "25"
        case 50 ..< 75:
            imageName = "50"
        case 75 ..< 100:
            imageName = "75"
        default:
            imageName = "100"
        }
        
        return NSImage(named: imageName)
    }
}
