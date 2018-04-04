//
//  ViewController.swift
//  ElevateYourMorning
//
//  Created by Nancy Vidales on 4/3/18.
//  Copyright © 2018 Nancy Vidales. All rights reserved.
//

import UIKit

//array of Alarm objects
let Alarms = [Alarm]()

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Alarms.count //size of Alarm array
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarm_cell") as! AlarmTableViewCell
        //set time label
        //set buttons
        return cell
    }
    
    //handle button presses here

}

