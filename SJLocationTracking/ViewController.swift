//
//  ViewController.swift
//  SJLocationTracking
//
//  Created by Sadruddin Junejo on 17/06/2015.
//  Copyright (c) 2015 SJunejo. All rights reserved.
//

import UIKit
import CoreData

protocol ViewControllerDelegate {
  func showLocationServicesAlert()
  
  func updateUI(newLocationDataArray: [(typeOfData: String, value: String)])
}

class ViewController: UIViewController, ViewControllerDelegate, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var tableViewLocationData: UITableView!
  
  var locationDataArray: [(typeOfData: String, value: String)] = []
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewLocationData.dataSource = self
        tableViewLocationData.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showLocationServicesAlert() {
        let locationServicesAlertController = UIAlertController(title: Constants.UIAlertViewControllerStrings.locationServicesUnavailableTitle,
        message: Constants.UIAlertViewControllerStrings.locationServicesUnavailableMessage,
        preferredStyle: UIAlertControllerStyle.Alert)
      
        locationServicesAlertController.addAction(UIAlertAction(title: Constants.UIAlertViewControllerStrings.ok, style: .Default, handler: nil))
    }

  func updateUI(newLocationDataArray: [(typeOfData: String, value: String)]) {
    dispatch_async(dispatch_get_main_queue()){
      self.locationDataArray = newLocationDataArray
      self.tableViewLocationData.reloadData()
    }
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableViewLocationData.dequeueReusableCellWithIdentifier(Constants.tableViewLocationDataKeys.tableViewCellIdentifier, forIndexPath: indexPath) as! UITableViewCell
    let row = indexPath.row as Int
    
    let (typeOfData: String, value: String) = self.locationDataArray[row]
    cell.textLabel?.text = value
    cell.detailTextLabel?.text = typeOfData
    
    return cell
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.locationDataArray.count
  }

}

