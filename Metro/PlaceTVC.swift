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
    @IBOutlet weak var loads_st: UIActivityIndicatorView!
    var place_list: [String] = []
    var Station: String = ""
    var disList: [String] = []
    var IconList: [String] = []
    var LoadPlace: LoadData = LoadData()
//    var refreshController = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        var title: UIButton = UIButton(frame: CGRectMake(0, 0, 100, 32))
        var info = LoadPlace.StationInfoLoadDB(Station)
        print(Station, info[0].Lat,info[0].Lon)
        loads_st.hidden = true
        loads_st.startAnimating()
//        self.refreshController.addTarget(self,action: "",forControlEvents: .ValueChanged)
//        refreshController.frame.origin.x = 200
//        refreshController.frame.origin.y = 300
//        tableView.addSubview(refreshController)
//        refreshController.beginRefreshing()
        LoadPlace.LoadFS(info[0].Lat,lon: info[0].Lon, sName: Station)
        
        let delay = Int64(1.5 * Double(NSEC_PER_SEC))
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delay)
        dispatch_after(dispatchTime, dispatch_get_main_queue()) {
        
        var ResultData: Results<PlaceList> = self.LoadPlace.PlaceLoadDB(self.Station)
        for value in ResultData[0].PList{
            if (value.address != nil)||(value.formattedAddress != nil) || (value.icon1 == "") {
            self.place_list.append(value.name)
            self.disList.append(value.distance)
            self.IconList.append(value.icon1)
                title.setTitle(self.Station, forState: UIControlState.Normal)
                title.titleLabel?.font = UIFont(name: "PlaceTVC", size: 30.0)
                title.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
                self.navigationItem.titleView = title
            }
        }
            self.loads_st.stopAnimating()
//            self.refreshController.endRefreshing()
            self.tableView.reloadData()
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
        cell.imageView?.image = UIImage(named: IconList[indexPath.row])
        cell.detailTextLabel?.text = "Расстояние " + disList[indexPath.row] + "м."
        return cell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //определяем инд перехода
        if segue.identifier == "PlaceInfo"{
            // определяем номер нажатой строки
            if let indexPath = self.tableView.indexPathForSelectedRow{
                // создаем объект класса конечного пункта нашего перехода
                let destvs: PlaceInfo = segue.destinationViewController as! PlaceInfo
                // передаем необходимую информацию о городе
                destvs.place = place_list[indexPath.row]
            }
        }
    }


}