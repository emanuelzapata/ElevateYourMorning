//
//  AddAlarmViewController.swift
//  ElevateYourMorning
//
//  Created by Nancy Vidales on 4/4/18.
//  Copyright © 2018 Nancy Vidales. All rights reserved.
//

import UIKit

//Add to Alarms array
//use parse helper function

class AddAlarmViewController: UIViewController {

    @IBOutlet weak var timePicker: UIDatePicker!
    var sunday = false
    var monday = false
    var tuesday = false
    var wednesday = false
    var thursday = false
    var friday = false
    var satruday = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sun_btn_pressed(_ sender: UIButton) {
        if(sender.currentTitleColor != UIColor.red){
            sender.setTitleColor(UIColor.red, for: .normal)
        }
        else{
            sender.setTitleColor(UIColor.darkGray, for: .normal)
        }
        
    }
    
    @IBAction func mon_btn_pressed(_ sender: UIButton) {
        if(sender.currentTitleColor != UIColor.red){
            sender.setTitleColor(UIColor.red, for: .normal)
        }
        else{
            sender.setTitleColor(UIColor.darkGray, for: .normal)
        }
    }
    
    @IBAction func tue_btn_pressed(_ sender: UIButton) {
        if(sender.currentTitleColor != UIColor.red){
            sender.setTitleColor(UIColor.red, for: .normal)
        }
        else{
            sender.setTitleColor(UIColor.darkGray, for: .normal)
        }
    }
    
    @IBAction func wed_btn_pressed(_ sender: UIButton) {
        if(sender.currentTitleColor != UIColor.red){
            sender.setTitleColor(UIColor.red, for: .normal)
        }
        else{
            sender.setTitleColor(UIColor.darkGray, for: .normal)
        }
    }
    
    @IBAction func thu_btn_pressed(_ sender: UIButton) {
        if(sender.currentTitleColor != UIColor.red){
            sender.setTitleColor(UIColor.red, for: .normal)
        }
        else{
            sender.setTitleColor(UIColor.darkGray, for: .normal)
        }
    }
    
    @IBAction func fri_btn_pressed(_ sender: UIButton) {
        if(sender.currentTitleColor != UIColor.red){
            sender.setTitleColor(UIColor.red, for: .normal)
        }
        else{
            sender.setTitleColor(UIColor.darkGray, for: .normal)
        }
    }
    
    @IBAction func sat_btn_pressed(_ sender: UIButton) {
        if(sender.currentTitleColor != UIColor.red){
            sender.setTitleColor(UIColor.red, for: .normal)
        }
        else{
            sender.setTitleColor(UIColor.darkGray, for: .normal)
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
