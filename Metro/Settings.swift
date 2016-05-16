//
//  Settings.swift
//  Metro
//
//  Created by Иван on 05.05.16.
//  Copyright © 2016 home. All rights reserved.
//

import Foundation
import UIKit

class Settings: UIViewController {
    
    @IBOutlet weak var SliderOutlet: UISlider!
    @IBOutlet weak var CurrentRange: UILabel!
    @IBOutlet weak var Sw1: UISwitch!
    @IBOutlet weak var Sw2: UISwitch!
    
    @IBAction func Slider(sender: AnyObject) {
        CurrentRange.text = String(Int(SliderOutlet.value))
    }
    var filePl: FilePlist = FilePlist()

    @IBAction func Save(sender: AnyObject) {
        if Sw1.on == true {
            filePl.categ1 = true
        }
        else {
            filePl.categ1 = nil
        }
//        if Sw2.on == true {
//            filePl.categ2 = true
//        }
//        else {
//            filePl.categ2 = nil
//        }
        filePl.dist = Int(SliderOutlet.value)
        performSegueWithIdentifier("goBack", sender: nil)
      
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if filePl.categ1 == nil{
            Sw1.on = false
        }
        else {
            Sw1.on = true
        }
//        if filePl.categ2 == nil {
//            Sw2.on = false
//        }
//        else {
//            Sw2.on = true
//        }
        
        if filePl.dist == nil {
            filePl.dist = (2000-50)/2
        }
        print(filePl.dist)
        SliderOutlet.value = (filePl.dist as? Float)!
    }
}
