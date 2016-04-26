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
    var station_list: [String] = ["Крылатское"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var ColourA: [String] = []
        var IntA: [Int] = []
        let onlineLW: StationList = StationList()
        let LoadSL: LoadData = LoadData()
//        LoadSL.LoadLines()
//        LoadSL.LoadFS()
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

