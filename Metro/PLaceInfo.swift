//
//  PLaceInfo.swift
//  Metro
//
//  Created by Иван on 05.05.16.
//  Copyright © 2016 home. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit
import MapKit

class PlaceInfo: UIViewController {
    var places: [String] = []
    var place: String = ""
    @IBOutlet weak var URL: UILabel!
    @IBOutlet var Distance: UIView!
    @IBOutlet weak var Phone: UILabel!
    @IBOutlet weak var Address: UILabel!
    @IBOutlet weak var mapView: MKMapView!
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
//            Distance.text = value.distance
            
            places.append(value.name)
            places.append(value.distance)
            if value.address != nil {
                Address.text = value.address!
            }
            else {
                Address.text = "no Info"
            }
            if value.number != nil {
                Phone.text = value.number!
            }
            else {
                Phone.text = "no Info"
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

//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
//    }
//    
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
//        cell.textLabel?.text = places[indexPath.row]
//        return cell
//    }
//    
}