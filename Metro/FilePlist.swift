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
    
}