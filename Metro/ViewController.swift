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
        let LoadSL: LoadData = LoadData()
//        LoadSL.LoadLines()

        var ResultData: Results<StationList> = LoadSL.StationLoadDB()
        for value in ResultData{
            
                station_list.append(value.StationName)
//                coordList.append(value.Lat + "," + value.Lon)
//            LoadSL.LoadFS(value.Lat, lon: value.Lon)
        }
//        LoadSL.LoadFS()
        self.refreshController.addTarget(self,action: "RefreshList",forControlEvents: .ValueChanged)
        tableView.addSubview(refreshController)
        
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
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = station_list[indexPath.row]
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

