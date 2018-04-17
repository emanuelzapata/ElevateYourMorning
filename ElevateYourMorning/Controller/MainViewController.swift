//
//  ViewController.swift
//  ElevateYourMorning
//
//  Created by Nancy Vidales on 4/3/18.
//  Copyright © 2018 Nancy Vidales. All rights reserved.
//

/*
 TO DO:
    -change heart button to a label, figure out how to change on touch
    -when dequeuing cells use onLabel function to make sure it matches
 
 */

import UIKit
import UserNotifications
import WatchConnectivity

//array of Alarm objects
var Alarms = [Alarm]()
var counter = 0;
var editAlarm: Alarm!


class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var add_button: UIButton!
    
    let session = WCSession.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        self.tableView.backgroundColor = UIColor .clear;
        self.tableView.isOpaque = false;
        
        tableView.delegate = self
        tableView.dataSource = self
        
        /*
            Notification Stuff
        */
        
        //content
        let content = UNMutableNotificationContent()
        content.title = "Title"
        content.body = "Body"
        content.sound = UNNotificationSound.default()
        
        //trigger
        for a in Alarms{
            var time = DateComponents()
            time = self.formatDateComponent(alarm: a)
            let trigger = UNCalendarNotificationTrigger(dateMatching: time, repeats: true)
            
            //request
            let request = UNNotificationRequest(identifier: "testIdentifier", content: content, trigger: trigger)
            
            //send notification
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
        
        //watch
        NotificationCenter.default.addObserver(self, selector: #selector(watchRecieve), name: NSNotification.Name(rawValue: "reeivedWatchMessage"), object: nil)
        
        
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
        if(Alarms.count == 0 ){
            let defaultAlarm = Alarm()
            defaultAlarm.time_str = "7:00"
            defaultAlarm.time = Date()
            Alarms.append(defaultAlarm)
            
            return 1
        }
        else{
            return Alarms.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarm_cell") as! AlarmTableViewCell
        cell.layer.cornerRadius = 45;
        cell.time_label.text = Alarms[indexPath.row].time_str
        //cell.alarm = Alarms[indexPath.row]
        //sendInfo(toEdit: Alarms[indexPath.row])
        
        //days of the week
        self.labelColors(alarm: Alarms[indexPath.row], cell: cell)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Alarms[indexPath.row].display()
    }
    func sendInfo(toEdit: Alarm){
        editAlarm = toEdit;
    }
    
    
    /*
        make sure on/off heart matches
    */
    func onLabel(alarm: Alarm, cell: AlarmTableViewCell){
        if(alarm.on_off_btn == true){
            
        }
    }
    
    func labelColors(alarm: Alarm, cell: AlarmTableViewCell){
        if(alarm.days_of_the_week["sun"] == true){
            cell.sun_label.textColor = UIColor.red
        }
        else{
            cell.sun_label.textColor = UIColor.darkGray
        }
        
        if(alarm.days_of_the_week["mon"] == true){
            cell.mon_label.textColor = UIColor.red
        }
        else{
            cell.mon_label.textColor = UIColor.darkGray
        }
        
        if(alarm.days_of_the_week["tue"] == true){
            cell.tue_label.textColor = UIColor.red
        }
        else{
            cell.tue_label.textColor = UIColor.darkGray
        }
        
        if(alarm.days_of_the_week["wed"] == true){
            cell.wed_label.textColor = UIColor.red
        }
        else{
            cell.wed_label.textColor = UIColor.darkGray
        }
        
        if(alarm.days_of_the_week["thu"] == true){
            cell.thu_label.textColor = UIColor.red
        }
        else{
            cell.thu_label.textColor = UIColor.darkGray
        }
        
        if(alarm.days_of_the_week["fri"] == true){
            cell.fri_label.textColor = UIColor.red
        }
        else{
            cell.fri_label.textColor = UIColor.darkGray
        }
        
        if(alarm.days_of_the_week["sat"] == true){
            cell.sat_label.textColor = UIColor.red
        }
        else{
            cell.sat_label.textColor = UIColor.darkGray
        }
    }
    
    func formatDateComponent(alarm: Alarm) -> DateComponents{
        var date = DateComponents()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        var timeStr = dateFormatter.string(from: alarm.time)
        date.hour = Int(timeStr)
        dateFormatter.dateFormat = "mm"
        timeStr = dateFormatter.string(from: alarm.time)
        date.minute = Int(timeStr)
        
        return date
    }
    
    @objc func watchRecieve(info: NSNotification){
        let message = info.userInfo!
     
        DispatchQueue.main.async {
            //self.fromWatchLabel.text = message["msg"] as? String
        }
        
    }
  
}

