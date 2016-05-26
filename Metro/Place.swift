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
    dynamic var latitude: String = ""
    dynamic var longitude: String = ""
    dynamic var name: String = ""
    dynamic var address: String? = nil
    dynamic var formattedAddress: String? = nil
    dynamic var number: String? = nil
    dynamic var distance: String = ""
    dynamic var url: String? = nil
    dynamic var icon1: String = ""
    dynamic var icon2: String = ""
}

class PlaceList:Object{
    dynamic var nameM: String = ""
    var PList = List<Place>()
    override static func primaryKey() -> String?{
        return "nameM"
    }
}