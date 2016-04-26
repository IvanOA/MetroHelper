//
//  LoadData.swift
//  Metro
//
//  Created by Юля и Денис Юдины on 17.04.16.
//  Copyright © 2016 home. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift
import SwiftyJSON

class LoadData
{
    let realm = try! Realm()
    func LoadLines(){
        var LineInf: LineList = LineList()
        var url: String = "https://data.cyrilmarten.com/nav.svc/lines/ru?cityid=1"
        var IdA: [Int] = []
        var ColorA: [String] = []
        var Dict: [Int:String] = [:]
    Alamofire.request(.GET, url).validate().responseJSON { response in
    switch response.result {
    case .Success:
    if let value = response.result.value {
//    let json = JSON(value)
        for (_,json):(String, JSON) in JSON(value){
            IdA.append(json["ID"].intValue)
            LineInf.LineId =  json["ID"].intValue
        }
//        LineInf = LineList(value: Dict)
        for i in IdA {
        var url2: String = "https://data.cyrilmarten.com/nav.svc/line/details/ru?id=" + String(i)
        Alamofire.request(.GET, url2).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    LineInf.LineName = json["Name"].stringValue
                    LineInf.ColourCode = json["Color"].stringValue
                    for (_,subJson):(String, JSON) in json["StationsOnLine"]{
                        var ST = StationList()
//                        print(subJson["ID"].intValue)
                        ST.StationID = subJson["ID"].intValue
//                        print(subJson["StationName"].stringValue)
                        ST.StationName = subJson["StationName"].stringValue
                        LineInf.StLst.append(ST)
                    }
//                    print(JSON(value))
//                    print(LineInf)
                    try! self.realm.write {
                        self.realm.add(LineInf, update: true)
                    }
                }
            case .Failure(let error):
                print(error)
            }
        }
        }
//    print(Dict)
    }
    case .Failure(let error):
    print(error)
        }
    }
        let last_data = self.realm.objects(LineList)
        print(last_data)
    }
    func LoadFS(){
        var PL = PlaceList()
        var url = "https://api.foursquare.com/v2/venues/search?"
        var param = ["client_id":"5RLDDBXJ2ETRSKAIVEGOKJ553YEI5K2GFZRAXLJ3LVW4TO3X","client_secret":"3R5FQAZKI4D40TGWXDAXR4C3R1RJCBSAEHZQ50DKZY0GPU5K","v":"20130815","ll":"55.757618,37.408748","radius":"1000"]
        Alamofire.request(.GET, url,parameters: param).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    var i = 0
                    PL.nameM = "Крылатское"
                    for (_,subJson):(String, JSON) in json["response"]["venues"] {
                    var tmp: Place = Place()
                    tmp.name = subJson["name"].stringValue
                    tmp.address = subJson["location"]["address"].string
                    tmp.number = subJson["contact"]["formattedPhone"].string
                    tmp.distance = subJson["location"]["distance"].stringValue
                    PL.PList.append(tmp)
//                    print(PlaceList[i].name)
//                    i++
                    }
                    print(PL)
                    try! self.realm.write {
                        self.realm.add(PL, update: true)
                    }
                }
            case .Failure(let error):
                print(error)
            }
            
        }
    }
    func PlaceLoadDB(station: String) -> Results<PlaceList>{
        let last_data = self.realm.objects(PlaceList).filter("nameM BEGINSWITH %@", station)
        print(last_data)
        return last_data
    }
}