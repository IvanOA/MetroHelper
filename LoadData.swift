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
//        var LineInf: LineList = LineList()
        var url: String = "https://data.cyrilmarten.com/nav.svc/lines/ru?cityid=1"
//        var IdA: [Int] = []
//        var ColorA: [String] = []
//        var Dict: [Int:String] = [:]
    Alamofire.request(.GET, url).validate().responseJSON { response in
    switch response.result {
    case .Success:
    if let value = response.result.value {
//    let json = JSON(value)
        for (_,json):(String, JSON) in JSON(value){
//            IdA.append(json["ID"].intValue)
//            LineInf.LineId =  json["ID"].intValue
            self.LoadStation(json["ID"].intValue)
        }
//        LineInf = LineList(value: Dict)
        
//    print(Dict)
    }
    case .Failure(let error):
    print(error)
        }
    }
        let last_data = self.realm.objects(LineList)
        print(last_data)
    }
    var filter: Settings = Settings()
    func LoadStation(i: Int) {
        var LineInf: LineList = LineList()
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
                            ST.Lat = subJson["GpsCoordLatitude"].stringValue
                            ST.Lon = subJson["GpsCoordLongitude"].stringValue
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
    func LoadFS(lat: String, lon: String){
        var PL = PlaceList()
        var url = "https://api.foursquare.com/v2/venues/search?"
        var radius = "1000"
        var cat: String = ""
        var cat1: String = "4d4b7105d754a06374d81259"
        var cat2: String = "4bf58dd8d48988d1f9941735"
        var cat3: String = "4bf58dd8d48988d10a951735"
        var cat4: String = "4bf58dd8d48988d116941735"
        var cat5: String = "4bf58dd8d48988d17f941735"
        var cat6: String = "4bf58dd8d48988d10f951735"
        var cat7: String = "4bf58dd8d48988d121941735,4bf58dd8d48988d11f941735,4bf58dd8d48988d11a941735,4bf58dd8d48988d1d6941735"

//        var cat2: String = ""
        if filter.filePl.dist != nil{
            radius = String(filter.filePl.dist!)
        }
        if filter.filePl.categ1 != nil{
            cat = cat1
        }
        if filter.filePl.categ2 != nil{
            cat += ",\(cat2)"
        }
        if filter.filePl.categ3 != nil{
            cat += ",\(cat3)"
        }
        if filter.filePl.categ4 != nil{
            cat += ",\(cat4)"
        }
        if filter.filePl.categ5 != nil{
            cat += ",\(cat5)"
        }
        if filter.filePl.categ6 != nil{
            cat += ",\(cat6)"
        }
        if filter.filePl.categ7 != nil{
            cat += ",\(cat7)"
        }
        var param = ["client_id":"5RLDDBXJ2ETRSKAIVEGOKJ553YEI5K2GFZRAXLJ3LVW4TO3X","client_secret":"3R5FQAZKI4D40TGWXDAXR4C3R1RJCBSAEHZQ50DKZY0GPU5K","v":"20130815","ll":"\(lat),\(lon)","radius":radius,"categoryId":cat,"limit":"50"]
//        print("radius= \(param)")
        Alamofire.request(.GET, url,parameters: param).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    print("radius= \(radius)")
                    let json = JSON(value)
                    var i = 0
                    PL.nameM = "Крылатское"
                    for (_,subJson):(String, JSON) in json["response"]["venues"] {
                    var tmp: Place = Place()
                    tmp.latitude = subJson["location"]["lat"].stringValue
                    tmp.longitude = subJson["location"]["lng"].stringValue
                    tmp.name = subJson["name"].stringValue
                    tmp.address = subJson["location"]["address"].string
                    tmp.formattedAddress = subJson["location"]["crossStreet"].string
                    tmp.number = subJson["contact"]["formattedPhone"].string
                    tmp.distance = subJson["location"]["distance"].stringValue
                    tmp.url = subJson["url"].string
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
    func PlaceLoadInfoDB(place: String) -> Results<Place>{
        let last_data = self.realm.objects(Place).filter("name BEGINSWITH %@", place)
        print(last_data)
        return last_data
    }
    func PlaceClear(){
        let last_data = self.realm.objects(Place)
        try! self.realm.write {
            self.realm.delete(last_data)
        }
    }
    func StationLoadDB() -> Results<StationList>{
        let last_data = self.realm.objects(StationList)
        print(last_data)
        return last_data
    }
}