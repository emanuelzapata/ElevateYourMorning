//
//  AddAlarmViewController.swift
//  ElevateYourMorning
//
//  Created by Nancy Vidales on 4/4/18.
//  Copyright © 2018 Nancy Vidales. All rights reserved.
//

import UIKit
import WatchConnectivity

//Add to Alarms array
//use parse helper function

class AddAlarmViewController: UIViewController {
    
    let new_alarm = Alarm()
    let session = WCSession.default

    @IBOutlet weak var fromWatchLabel: UILabel!
    @IBOutlet weak var timePicker: UIDatePicker!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(watchReceieve), name: NSNotification.Name(rawValue: "receivedWatchMessage"), object: nil)
    }
    
    @objc func watchReceieve(info: NSNotification){
        let message = info.userInfo!
        DispatchQueue.main.async {
            NSLog("here!!!")
            self.fromWatchLabel.text = message["msg"] as? String
        
        }
        
    }

    @IBAction func save_btn_pressed(_ sender: Any) {
        new_alarm.time = timePicker.date
        new_alarm.parse_date()
        counter+=1;
        new_alarm.id = counter;
        new_alarm.display()
        Alarms.append(new_alarm)
    }
    
    @IBAction func sun_btn_pressed(_ sender: UIButton) {
        if(sender.currentTitleColor != UIColor.red){
            sender.setTitleColor(UIColor.red, for: .normal)
            new_alarm.days_of_the_week["sun"] = true
        }
        else{
            sender.setTitleColor(UIColor.darkGray, for: .normal)
            new_alarm.days_of_the_week["sun"] = false
            
        }
        
    }
    
    @IBAction func mon_btn_pressed(_ sender: UIButton) {
        if(sender.currentTitleColor != UIColor.red){
            sender.setTitleColor(UIColor.red, for: .normal)
            new_alarm.days_of_the_week["mon"] = true
        }
        else{
            sender.setTitleColor(UIColor.darkGray, for: .normal)
            new_alarm.days_of_the_week["mon"] = false
        }
    }
    
    @IBAction func tue_btn_pressed(_ sender: UIButton) {
        if(sender.currentTitleColor != UIColor.red){
            sender.setTitleColor(UIColor.red, for: .normal)
            new_alarm.days_of_the_week["tue"] = true
        }
        else{
            sender.setTitleColor(UIColor.darkGray, for: .normal)
            new_alarm.days_of_the_week["tue"] = false
        }
    }
    
    @IBAction func wed_btn_pressed(_ sender: UIButton) {
        if(sender.currentTitleColor != UIColor.red){
            sender.setTitleColor(UIColor.red, for: .normal)
            new_alarm.days_of_the_week["wed"] = true
        }
        else{
            sender.setTitleColor(UIColor.darkGray, for: .normal)
            new_alarm.days_of_the_week["wed"] = false
        }
    }
    
    @IBAction func thu_btn_pressed(_ sender: UIButton) {
        if(sender.currentTitleColor != UIColor.red){
            sender.setTitleColor(UIColor.red, for: .normal)
            new_alarm.days_of_the_week["thu"] = true
        }
        else{
            sender.setTitleColor(UIColor.darkGray, for: .normal)
            new_alarm.days_of_the_week["thu"] = false
        }
    }
    
    @IBAction func fri_btn_pressed(_ sender: UIButton) {
        if(sender.currentTitleColor != UIColor.red){
            sender.setTitleColor(UIColor.red, for: .normal)
            new_alarm.days_of_the_week["fri"] = true
        }
        else{
            sender.setTitleColor(UIColor.darkGray, for: .normal)
            new_alarm.days_of_the_week["fri"] = false
        }
    }
    
    @IBAction func sat_btn_pressed(_ sender: UIButton) {
        if(sender.currentTitleColor != UIColor.red){
            sender.setTitleColor(UIColor.red, for: .normal)
            new_alarm.days_of_the_week["sat"] = true
        }
        else{
            sender.setTitleColor(UIColor.darkGray, for: .normal)
            new_alarm.days_of_the_week["sat"] = false
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
