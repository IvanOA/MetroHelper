//
//  ViewController.swift
//  Metro
//
//  Created by kirill lukyanov on 14.04.16.
//  Copyright © 2016 home. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift
import SwiftyJSON

class ViewController: UITableViewController {
    var station_list: [String] = []
    var station_list_id: [Int] = []
    var refreshController = UIRefreshControl()
    var coordList: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
//        var opt: FilePlist = FilePlist()
//        opt.categ1 = true
//        opt.categ2 = true
        // Do any additional setup after loading the view, typically from a nib.
        
        var ColourA: [String] = []
        var IntA: [Int] = []
        let onlineLW: StationList = StationList()
//        let LoadSL: LoadData = LoadData()
        let LoadSL: GetStartedViewController = GetStartedViewController()
        self.refreshController.addTarget(self,action: "RefreshList",forControlEvents: .ValueChanged)
        tableView.addSubview(refreshController)
        self.refreshController.beginRefreshing()
        
        
//        let delay = Int64(1.5 * Double(NSEC_PER_SEC))
//        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delay)
//        dispatch_after(dispatchTime, dispatch_get_main_queue()) {
        
        var ResultData: Results<StationList> = LoadSL.LoadST.StationLoadDB()
        for value in ResultData{
            
                self.station_list.append(value.StationName)
                self.station_list_id.append(value.LineID)
//                coordList.append(value.Lat + "," + value.Lon)
//            LoadSL.LoadFS(value.Lat, lon: value.Lon)
        }
            self.refreshController.endRefreshing()
            self.tableView.reloadData()
//        }
//        LoadSL.LoadFS()
//        print(station_list.count)
//        station_list_sort = station_list.sort()
//        print(station_list_sort)

        
    }
    func RefreshList(){
        let PlaceUpd: LoadData = LoadData()
        PlaceUpd.PlaceClear()
//        PlaceUpd.LoadFS()
        self.refreshController.endRefreshing()
    }
    @IBAction func goBack (segue:UIStoryboardSegue){
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return station_list.count
//        return ResultData.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = station_list[indexPath.row]
        cell.imageView?.image = UIImage(named: String(station_list_id[indexPath.row]))
        return cell
    }
    //переход между экранами
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //определяем инд перехода
        if segue.identifier == "PlaceShow"{
            // определяем номер нажатой строки
            if let indexPath = self.tableView.indexPathForSelectedRow{
                // создаем объект класса конечного пункта нашего перехода
                let destvs: PlaceTVC = segue.destinationViewController as! PlaceTVC
                // передаем необходимую информацию о городе
                destvs.Station = station_list[indexPath.row]
            }
        }
    }

}

