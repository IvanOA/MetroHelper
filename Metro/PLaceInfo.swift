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

class PlaceInfo: UIViewController, MKMapViewDelegate{
    var places: [String] = []
    var place: String = ""
    @IBOutlet weak var URL: UILabel!
//    @IBOutlet var Distance: UIView!
    @IBOutlet weak var Name: UILabel!
    
    @IBOutlet weak var Distance: UILabel!
    @IBOutlet weak var Phone: UILabel!
    @IBOutlet weak var Address: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
//        navigationController?.navigationItem.title = "dsdsd"
        
        print(place)
        var placeDB: LoadData = LoadData()
        let info = placeDB.PlaceLoadInfoDB(place)
        
        
        
//        var places2: String = ""
//        var places3: String = ""
//        var places4: String = ""
//        var places5: String = ""
        for value in info{
//            Distance.text = value.distance
            if value.address != nil {
                if value.formattedAddress != nil {
                    Address.text = "Адрес: \(value.formattedAddress!)"
                    print(value.formattedAddress)
                }
                else {
                    Address.text = "Адрес: \(value.address!)"
                }
                
                var placeLocation = CLLocationCoordinate2D(latitude: Double(value.latitude)!, longitude: Double(value.longitude)!)
                
                let placePlacemark = MKPlacemark(coordinate: placeLocation, addressDictionary: nil)
                let palceMapItem = MKMapItem(placemark: placePlacemark)
                let placeAnnotation = MKPointAnnotation()
                
                placeAnnotation.title = value.name
                
                if let location = placePlacemark.location {
                    placeAnnotation.coordinate = location.coordinate
                }
                self.mapView.showAnnotations([placeAnnotation], animated: true )
            }
            places.append(value.name)
            places.append(value.distance)
            Name.text = value.name
            Distance.text = "Расстояние: \(value.distance)"
            if value.number != nil {
                Phone.text = "Телефон: \(value.number!)"
            }
            else {
                Phone.text = "Телефон: информация отсутствует"
            }
            if value.url != nil {
                URL.text = "Вебсайт: \(value.url!)"
            }
            else {
                URL.text = "Вебсайт: информация отсутствует"
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