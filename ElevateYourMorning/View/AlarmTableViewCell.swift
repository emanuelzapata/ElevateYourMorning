//
//  AlarmTableViewCell.swift
//  ElevateYourMorning
//
//  Created by Nancy Vidales on 4/4/18.
//  Copyright © 2018 Nancy Vidales. All rights reserved.
//

import UIKit

/*
 TO DO:
    -Add time label (from Alarms array time_str property
    -Add days of the week labels and set corresponding font color (on/off from Alarms array dictionary)
    -Add on/off button and set corresponding image (Alarms array on_off_btn)
 
 */

class AlarmTableViewCell: UITableViewCell {
    
    @IBOutlet weak var time_label: UILabel!
    @IBOutlet weak var sun_label: UILabel!
    @IBOutlet weak var mon_label: UILabel!
    @IBOutlet weak var tue_label: UILabel!
    @IBOutlet weak var wed_label: UILabel!
    @IBOutlet weak var thu_label: UILabel!
    @IBOutlet weak var fri_label: UILabel!
    @IBOutlet weak var sat_label: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    /*
        On/Off Button
    */
    func on_off_btn_pressed(alarm: Alarm) {
        NSLog("on off button pressed")
        //if on change to off change image
        if(alarm.on_off_btn == true){
            alarm.on_off_btn = false
        }
        //else change to on change image
        else{
            alarm.on_off_btn = true
        }
    }
    
    /*
        Edit button
    */
    @IBAction func edit_btn_pressed(_ sender: Any) {
        //change view
        NSLog("edit pressed")
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
