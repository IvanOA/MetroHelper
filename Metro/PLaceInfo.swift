//
//  PLaceInfo.swift
//  Metro
//
//  Created by Иван on 05.05.16.
//  Copyright © 2016 home. All rights reserved.
//

import Foundation
import RealmSwift

class PlaceInfo: UITableViewController {
    var places: [String] = []
    var place: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print(place)
        var placeDB: LoadData = LoadData()
        let info = placeDB.PlaceLoadInfoDB(place)
        
//        var places2: String = ""
//        var places3: String = ""
//        var places4: String = ""
//        var places5: String = ""
        for value in info{
            places.append(value.name)
            places.append(value.distance)
            if value.address != nil {
                places.append(value.address!)
            }
            else {
                places.append("no Info")
            }
            if value.number != nil {
                places.append(value.number!)
            }
            else {
                places.append("no Info")
            }
            if value.number != nil {
                places.append(value.url!)
            }
            else {
                places.append("no Info")
            }
            //            disList.append(value.distance)
        }
//        print(places1)
//        print(places2)
//        print(places3)
//        print(places4)
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = places[indexPath.row]
        return cell
    }
    
}