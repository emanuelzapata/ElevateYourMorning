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
    var time_str = "00:00"
    var alarm_label = "Alarm"
    var on_off_btn = true
    
    var days_of_the_week: [String:Bool] = ["sun":true, "mon":true, "tue":true, "wed":true, "thu":true, "fri":true, "sat":true]
    
    
    func parse_date(){
        
    }

   
}
