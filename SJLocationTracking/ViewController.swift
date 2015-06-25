//
//  ViewController.swift
//  SJLocationTracking
//
//  Created by Sadruddin Junejo on 17/06/2015.
//  Copyright (c) 2015 SJunejo. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate {
  func showLocationServicesAlert()
  
  func updateUI(newLocationDataDictionary: OrderedDictionary<String, String>)
}

class ViewController: UIViewController, ViewControllerDelegate, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var tableViewLocationData: UITableView!
  
  var locationDataDictionary: OrderedDictionary<String, String>?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        locationDataDictionary = OrderedDictionary<String, String>()
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

  func updateUI(newLocationDataDictionary: OrderedDictionary<String, String>) {
    dispatch_async(dispatch_get_main_queue()){
      self.locationDataDictionary = newLocationDataDictionary
      self.tableViewLocationData.reloadData()
    }
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableViewLocationData.dequeueReusableCellWithIdentifier(Constants.tableViewLocationDataKeys.tableViewCellIdentifier, forIndexPath: indexPath) as! UITableViewCell
    let row = indexPath.row
    
    cell.textLabel?.text = locationDataDictionary?[row]
    return cell
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return locationDataDictionary!.count
  }

}

