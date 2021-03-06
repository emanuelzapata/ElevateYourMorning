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
import AVFoundation

//array of Alarm objects
var Alarms = [Alarm]()
var counter = 0;
var editAlarm: Alarm!
var player: AVAudioPlayer?
var ringtones: [String] = ["GrinchScream", "NapalmDeath"]

var user_hr = 0



func playSound(){
    var n:Int = Int(arc4random_uniform(UInt32(ringtones.count)))
    
    guard let url = Bundle.main.url(forResource:ringtones[n], withExtension:"mp3")else {return}
    do{
        try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        try AVAudioSession.sharedInstance().setActive(true)
        
        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
        guard let player = player else{return}
        player.numberOfLoops = -1 //repeats the alarm
        player.play()
        
        /*if(user_hr >= 150){
            player.stop()
        }*/
    }
    catch let error{
        print(error.localizedDescription)
    }
}

func stopSound(){
    if(user_hr >= 150){
        player?.stop()
    }

}

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
        //content.sound = UNNotificationSound.default()
        content.sound = UNNotificationSound(named:"NapalmDeath.mp3")
        
        //trigger the alarm
        for a in Alarms{
            if(a.on_off_btn == true){
                var time = DateComponents()
                time = self.formatDateComponent(alarm: a)
                let trigger = UNCalendarNotificationTrigger(dateMatching: time, repeats: false)
                
                //request
                let request = UNNotificationRequest(identifier: "testIdentifier", content: content, trigger: trigger)
                
                //send notification
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            
                
                //play alarm
                //playSound()
                
            }
        }
        
        
        //watch
        NotificationCenter.default.addObserver(self, selector: #selector(watchReceieve), name: NSNotification.Name(rawValue: "receivedWatchMessage"), object: nil)
        
        
    }
    
    
    
    @objc func watchReceieve(info: NSNotification){
        let message = info.userInfo!
        DispatchQueue.main.async {
            print(message["msg"] as! String)
            let time = message["msg"] as! String
            user_hr = Int(time)!
            print("user_hr: \(user_hr)")
        }
        
    }
    
    @IBAction func on_off_btn_pressed(_ sender: UIButton) {
        //change image
        
        
        if((sender as AnyObject).currentImage == #imageLiteral(resourceName: "alarm_on")){
            sender.setImage(#imageLiteral(resourceName: "alarm_off"), for: .normal)
            Alarms[sender.tag].on_off_btn = false;

        }
        else{
            sender.setImage(#imageLiteral(resourceName: "alarm_on"), for: .normal)
            Alarms[sender.tag].on_off_btn = true;
        }
        Alarms[sender.tag].display()
    }
    
    @IBAction func add_alarm_btn_pressed(_ sender: Any) {
        NSLog("add alarm button pressed")
    }
    
    @IBAction func edit_alarm_btn_pressed(_ sender: Any) {
        NSLog("edit alarm button pressed")
        //NSLog(String((sender as! UIButton).tag))
       // Alarms[Int((sender as! UIButton).tag)].display()
        t = Int((sender as! UIButton).tag)
        NSLog(String(t))
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
    
    //function here to delete on a swipe function
    //this delete works but not on the original prototype lmao
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath)->[UITableViewRowAction]?{
        let delete = UITableViewRowAction(style: .destructive, title: "Delete"){
            (action, indexPath) in
            Alarms.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        return [delete]
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarm_cell") as! AlarmTableViewCell
        cell.layer.cornerRadius = 45;
        cell.time_label.text = Alarms[indexPath.row].time_str
        //cell.id = IDGenerator()
        //cell.alarm = Alarms[indexPath.row]
        //sendInfo(toEdit: Alarms[indexPath.row])
       
        //days of the week
        //this little line here sets the tag to the indexPath.row value
        cell.edit_button.tag = indexPath.row
        cell.on_button.tag = indexPath.row
        if(Alarms[indexPath.row].on_off_btn == true){
            cell.on_button.setImage(#imageLiteral(resourceName: "alarm_on"), for: .normal);
        }
        else{
            cell.on_button.setImage(#imageLiteral(resourceName: "alarm_off"), for: .normal);
        }
        
        self.labelColors(alarm: Alarms[indexPath.row], cell: cell)
        
        Alarms[indexPath.row].display()
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

