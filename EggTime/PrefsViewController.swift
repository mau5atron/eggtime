//
//  PrefsViewController.swift
//  EggTime
//
//  Created by Gabriel Betancourt on 4/8/19.
//  Copyright © 2019 Gabriel Betancourt. All rights reserved.
//

import Cocoa

class PrefsViewController: NSViewController {

    @IBOutlet weak var presetsPopup: NSPopUpButton!
    @IBOutlet weak var customSlider: NSSlider!
    @IBOutlet weak var customTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func popupValueChanged(_ sender: NSPopUpButton) {
    }
    
    @IBAction func sliderValueChanged(_ sender: NSSlider) {
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
    }
    
    @IBAction func okButtonClicked(_ sender: Any) {
    }
}
