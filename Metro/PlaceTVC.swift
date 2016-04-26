//
//  PlaceTVC.swift
//  Metro
//
//  Created by Юля и Денис Юдины on 25.04.16.
//  Copyright © 2016 home. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class PlaceTVC: UITableViewController{
    var place_list: [String] = []
    var Station: String = ""
    var disList: [String] = []
    var LoadPlace: LoadData = LoadData()
    override func viewDidLoad() {
        super.viewDidLoad()
        var ResultData: Results<PlaceList> = LoadPlace.PlaceLoadDB("Крылатское")
        for value in ResultData[0].PList{
            place_list.append(value.name)
            disList.append(value.distance)
        }
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return place_list.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = place_list[indexPath.row]
        cell.detailTextLabel?.text = "Расстояние " + disList[indexPath.row] + "м."
        return cell
    }

}