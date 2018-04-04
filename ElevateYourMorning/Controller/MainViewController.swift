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
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var add_button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        self.tableView.backgroundColor = UIColor .clear;
        self.tableView.isOpaque = false;
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func on_off_btn_pressed(_ sender: UIButton) {
        //change image
        if((sender as AnyObject).currentImage == #imageLiteral(resourceName: "alarm_on")){
            sender.setImage(#imageLiteral(resourceName: "alarm_off"), for: .normal)
        }
        else{
            sender.setImage(#imageLiteral(resourceName: "alarm_on"), for: .normal)
        }
    }
    
    @IBAction func add_alarm_btn_pressed(_ sender: Any) {
        NSLog("add alarm button pressed")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 //size of Alarm array
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarm_cell") as! AlarmTableViewCell
        cell.layer.cornerRadius = 45;
        cell.time_label.text = "00:00"
        //change value of on/off button
        //cell.on_off_btn_pressed(alarm: Alarms[indexPath.row])
        return cell
    }
    
    
  
}

