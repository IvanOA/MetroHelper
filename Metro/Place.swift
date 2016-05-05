//
//  Place.swift
//  Metro
//
//  Created by Юля и Денис Юдины on 24.04.16.
//  Copyright © 2016 home. All rights reserved.
//

import Foundation
import RealmSwift

class Place:Object{
    dynamic var name: String = ""
    dynamic var address: String? = nil
    dynamic var number: String? = nil
    dynamic var distance: String = ""
    dynamic var url: String? = nil
}

class PlaceList:Object{
    dynamic var nameM: String = ""
    var PList = List<Place>()
    override static func primaryKey() -> String?{
        return "nameM"
    }
}