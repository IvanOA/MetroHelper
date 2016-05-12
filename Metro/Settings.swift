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
    @IBAction func Slider(sender: AnyObject) {
        CurrentRange.text = String(Int(SliderOutlet.value))
    }
    var filePl: FilePlist = FilePlist()

    @IBAction func Save(sender: AnyObject) {
        filePl.dist = Int(SliderOutlet.value)
        performSegueWithIdentifier("goBack", sender: nil)
      
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if filePl.dist == nil {
          filePl.dist = (2000-50)/2
        }
        print(filePl.dist)
        SliderOutlet.value = (filePl.dist as? Float)!
    }
}
