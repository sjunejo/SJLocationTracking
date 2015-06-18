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
    
}

class ViewController: UIViewController, ViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showLocationServicesAlert() {
        let locationServicesAlertController = UIAlertController()
    }


}

