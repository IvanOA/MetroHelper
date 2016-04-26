//
//  LineList.swift
//  Metro
//
//  Created by Юля и Денис Юдины on 19.04.16.
//  Copyright © 2016 home. All rights reserved.
//

import Foundation
import RealmSwift

class LineList:Object{
    var StLst = List<StationList>()
    dynamic var LineId: Int = 0
    dynamic var ColourCode: String = ""
    dynamic var LineName: String = ""
    override static func primaryKey() -> String?{
        return "LineId"
    }
}