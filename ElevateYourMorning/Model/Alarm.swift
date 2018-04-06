//
//  Alarm.swift
//  ElevateYourMorning
//
//  Created by Nancy Vidales on 4/4/18.
//  Copyright © 2018 Nancy Vidales. All rights reserved.
//

import UIKit

/* Alarm class
    variables
        -time of type Date to be set with date picker
        -time_str will be parsed from time variable
        -alarm_label to store the alarm title
        -days_of_the_week dictionary for when the alarm should go off
        -on_off_btn to display on/off image
 
    functions
        -parse_date to format time variable as HH:mm
 
 TO DO:
 
 
*/

class Alarm: NSObject {
    
    var time: Date!
    var time_str = "7:00"
    var alarm_label = "Alarm"
    var on_off_btn = true
    var id = 0
    
    var days_of_the_week: [String:Bool] = ["sun":false, "mon":false, "tue":false, "wed":false, "thu":false, "fri":false, "sat":false]
    

    func parse_date(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        time_str = dateFormatter.string(from: time)
        
    }
    
    func display(){
        NSLog(time_str)
        NSLog(alarm_label)
        if(on_off_btn == true){
            NSLog("alarm: on")
        }
        else{
            NSLog("alarm: off")
        }
        for (day, status) in days_of_the_week{
            if(status == true){
                NSLog("on for day \(day)")
            }
        }
        NSLog("id: \(id)")
    }

   
}
