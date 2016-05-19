//
//  StationList.swift
//  Metro
//
//  Created by kirill lukyanov on 14.04.16.
//  Copyright © 2016 home. All rights reserved.
//

import Foundation
import RealmSwift

class StationList: Object {
    dynamic var StationName: String = ""
    dynamic var StationID: Int = 0
    dynamic var Lat: String = ""
    dynamic var Lon: String = ""
}