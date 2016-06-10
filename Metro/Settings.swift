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
    @IBOutlet weak var Sw3: UISwitch!
    @IBOutlet weak var Sw4: UISwitch!
    @IBOutlet weak var Sw5: UISwitch!
    @IBOutlet weak var Sw6: UISwitch!
    @IBAction func Slider(sender: AnyObject) {
        CurrentRange.text = String(Int(SliderOutlet.value))
    }
    var filePl: FilePlist = FilePlist()

    @IBAction func Save(sender: AnyObject) {
        // хавчик
        if Sw1.on == true {
            filePl.categ1 = true
        }
        else {
            filePl.categ1 = nil
        }
        // Продуктовые
        if Sw2.on == true {
            filePl.categ2 = true
        }
        else {
            filePl.categ2 = nil
        }
        // Банки
        if Sw3.on == true {
            filePl.categ3 = true
        }
        else {
            filePl.categ3 = nil
        }
        // Бары
        if Sw4.on == true {
            filePl.categ4 = true
        }
        else {
            filePl.categ4 = nil
        }
        // Кино
        if Sw5.on == true {
            filePl.categ5 = true
        }
        else {
            filePl.categ5 = nil
        }
        // Драгстор
        if Sw6.on == true {
            filePl.categ6 = true
        }
        else {
            filePl.categ6 = nil
        }
        filePl.dist = Int(SliderOutlet.value)
        performSegueWithIdentifier("goBack", sender: nil)
        filePl.dist = Int(SliderOutlet.value)
      
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if filePl.categ1 == nil{
            Sw1.on = false
        }
        else {
            Sw1.on = true
        }
        if filePl.categ2 == nil{
            Sw2.on = false
        }
        else {
            Sw2.on = true
        }
        if filePl.categ3 == nil{
            Sw3.on = false
        }
        else {
            Sw3.on = true
        }
        if filePl.categ4 == nil{
            Sw4.on = false
        }
        else {
            Sw4.on = true
        }
        if filePl.categ5 == nil{
            Sw5.on = false
        }
        else {
            Sw5.on = true
        }
        if filePl.categ6 == nil{
            Sw6.on = false
        }
        else {
            Sw6.on = true
        }
        if filePl.dist == nil {
            filePl.dist = 1000
        }
        print(filePl.dist)
        SliderOutlet.value = (filePl.dist as? Float)!
    }
}
