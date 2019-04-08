//
//  AppDelegate.swift
//  EggTime
//
//  Created by Gabriel Betancourt on 4/6/19.
//  Copyright © 2019 Gabriel Betancourt. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {


    @IBOutlet weak var startTimerMenuItem: NSMenuItem!
    @IBOutlet weak var stopTimeMenuItem: NSMenuItem!
    @IBOutlet weak var fuckoffTimerMenuItem: NSMenuItem!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

