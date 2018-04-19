//
//  InterfaceController.swift
//  ElevateYourMorning WatchKit Extension
//
//  Created by Nancy Vidales on 4/3/18.
//  Copyright © 2018 Nancy Vidales. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity
import HealthKit


class InterfaceController: WKInterfaceController, WCSessionDelegate, HKWorkoutSessionDelegate {
    
    
    
    
    let session = WCSession.default
    let healthStore = HKHealthStore()
    
    let configuration = HKWorkoutConfiguration()
    var workoutSession: HKWorkoutSession?

    @IBOutlet var timeLabel: WKInterfaceDate!
    @IBOutlet var BPMLabel: WKInterfaceLabel!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
       
    }
    
    @IBAction func startTapped() {
        self.session.sendMessage(["msg" : "it works!"], replyHandler: nil, errorHandler: nil)
        
        //start workout session
        //workout configuration
        configuration.activityType = .play
        configuration.locationType = .indoor
        
        do {
            workoutSession = try HKWorkoutSession(configuration: configuration)
            
            workoutSession?.delegate = self
            self.healthStore.start(workoutSession!)
            print("workout started")
            
            let anchor = HKQueryAnchor.init(fromValue: 0)
            
            //query heart rate data
            let heartRateType = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)
            
            // Match samples with a start date after the workout start
            let predicate = HKQuery.predicateForSamples(withStart: workoutSession?.startDate, end: nil, options: [])
            
            let query = HKAnchoredObjectQuery(type: heartRateType!, predicate: predicate, anchor: anchor, limit: 0, resultsHandler: { (query, samples, deletedObjects, anchor, error) in
                // Handle when the query first returns results
                // TODO: do whatever you want with samples (note you are not on the main thread)
                guard let sample = samples, let delObj = deletedObjects else {
                    // Handle the error here.
                    fatalError("*** An error occurred during the initial query: \(error!.localizedDescription) ***")
                }
                
                for heartRate in sample{
                    print("\(heartRate)")
                }
                
            })
           
            
            // This is called each time a new value is entered into HealthKit (samples may be batched together for efficiency)
            query.updateHandler = { (query, samples, deletedObjects, anchor, error) -> Void in
                // Handle update notifications after the query has initially run
                // TODO: do whatever you want with samples (note you are not on the main thread)
            }
            
            // Start the query
            self.healthStore.execute(query)

            
        }
        catch let error as NSError {
            // Perform proper error handling here...
            fatalError("*** Unable to create the workout session: \(error.localizedDescription) ***")
        }
    }
    
    
    @IBAction func endTapped() {
        if(workoutSession != nil){
            self.healthStore.end(workoutSession!)
            print("workout ended")
        }
    }
    
    
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    //workout stuff
    func workoutSession(_ workoutSession: HKWorkoutSession, didChangeTo toState: HKWorkoutSessionState, from fromState: HKWorkoutSessionState, date: Date) {
        
    }
    
    func workoutSession(_ workoutSession: HKWorkoutSession, didFailWithError error: Error) {
        
    }

}
