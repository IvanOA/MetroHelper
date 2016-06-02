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

class ViewController: UITableViewController, UISearchResultsUpdating {
    var station_list: [String] = []
    var filteredStation_list = [String]()
    var resultSearchController = UISearchController()
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
        //Поиск
//        self.resultsController.tableView.dataSource = self
//        self.resultsController.tableView.delegate = self
//        self.searchController = UISearchController(searchResultsController: self.resultsController)
//        self.tableView.tableHeaderView = self.searchController.searchBar
//        self.searchController.searchResultsUpdater = self
        self.resultSearchController = UISearchController(searchResultsController: nil)
        self.resultSearchController.searchResultsUpdater = self
        self.resultSearchController.dimsBackgroundDuringPresentation = false
        self.resultSearchController.searchBar.sizeToFit()
        self.tableView.tableHeaderView = self.resultSearchController.searchBar
        //Поиск
        
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
        if self.resultSearchController.active
        {
            return self.filteredStation_list.count
        }
        else
        {
            return self.station_list.count
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        if tableView == self.tableView {
//            return self.station_list.count
//        } else {
//            return self.filteredStation_list.count
//        }
        return 1
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        if self.resultSearchController.active
        {
            cell.textLabel?.text = filteredStation_list[indexPath.row]
            cell.imageView?.image = UIImage(named: String(station_list_id[indexPath.row]))
        }
        else
        {
            cell.textLabel?.text = station_list[indexPath.row]
            cell.imageView?.image = UIImage(named: String(station_list_id[indexPath.row]))
        }
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
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.filteredStation_list.removeAll(keepCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (self.station_list as NSArray).filteredArrayUsingPredicate(searchPredicate)
        self.filteredStation_list = array as! [String]
        self.tableView.reloadData()
    }

}

