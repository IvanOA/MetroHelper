//
//  FilePlist.swift
//  Metro
//
//  Created by Иван on 05.05.16.
//  Copyright © 2016 home. All rights reserved.
//

import Foundation


class FilePlist {
    var dist: AnyObject?{
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey("dist") as AnyObject?
        }
        set{
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "dist")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    var categ1: AnyObject?{
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey("categ1") as AnyObject?
        }
        set{
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "categ1")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    var categ2: AnyObject?{
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey("categ2") as AnyObject?
        }
        set{
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "categ2")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    var categ3: AnyObject?{
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey("categ3") as AnyObject?
        }
        set{
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "categ3")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    var categ4: AnyObject?{
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey("categ4") as AnyObject?
        }
        set{
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "categ4")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    var categ5: AnyObject?{
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey("categ5") as AnyObject?
        }
        set{
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "categ5")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    var categ6: AnyObject?{
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey("categ6") as AnyObject?
        }
        set{
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "categ6")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    var categ7: AnyObject?{
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey("categ7") as AnyObject?
        }
        set{
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "categ7")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
}