//
//  EggTime.swift
//  EggTime
//
//  Created by Gabriel Betancourt on 4/8/19.
//  Copyright © 2019 Gabriel Betancourt. All rights reserved.
//

import Foundation
protocol EggTimeProtocol {
    /*
        A protocol sets out a contract and any object that is defined as conforming to the EggTimeProtocol must supply the below 2 functions.
    */
    func timeRemainingOnTimer(_ timer: EggTime, timeRemaining: TimeInterval)
    func timerHasFinished(_ timer: EggTime)
}

class EggTime {
    var timer: Timer? = nil
    var startTime: Date?
    var duration: TimeInterval = 360 // default to 6 min
    var elapsedTime: TimeInterval = 0 // equal to double, used to show seconds
    
    var timerStopped: Bool {
        return time == nil && elapsedTime == 0
    }
    
    var timerPaused: Bool {
        return timer == nil && elapsedTime > 0
    }
    
    var delegate: EggTimeProtocol?
    
    @objc dynamic func timerAction(){
        guard let startTime = startTime else {
            return
        }
        // timeIntervalSinceNow produces a negative integer, placing a negative in front changes it back to a positive integer
        elapsedTime = -startTime.timeIntervalSinceNow
        
        let secondsRemaining = (duration - elapsedTime).rounded()
        
        if secondsRemaining <= 0 {
            fuckoffTimer()
            delegate?.timerHasFinished(self)
        } else {
            delegate?.timeRemainingOnTimer(self, timeRemaining: secondsRemaining)
        }
    }
    
    func startTimer(){
        startTime = Date()
        elapsedTime = 0
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        timerAction()
    }
    
    func resumeTimer(){
        startTime = Date(timeIntervalSinceNow: -elapsedTime)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        timerAction()
    }
    
    func stopTimer(){
        // pauses the timer
        timer?.invalidate()
        timer = nil
        
        timerAction()
    }
    
    func fuckoffTimer(){
        // stop the timer and reset (fuck off) to start
        timer?.invalidate()
        timer = nil
        
        startTime = nil
        duration = 360
        elapsedTime = 0
        
        timerAction()
    }
}
