//
//  InterfaceController.swift
//  WatchIntro WatchKit Extension
//
//  Created by MacStudent on 2019-06-18.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController , WCSessionDelegate{
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        // output a debug message to the terminal
        print("Got a message!")
        
        // update the message with a label
        self.labelOutput.setText("\(message["name"])")

    }

    var labelSaysHello:Bool = true
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        print("watch app is loaded")
        if (WCSession.isSupported()) {
            print("Watch : Yes it is!")
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        else{
            print("Watch does not supported")
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    
    
    
    @IBOutlet weak var labelOutput: WKInterfaceLabel!
    
    @IBAction func btnPressed() {
        if(labelSaysHello == true)
        {
        print("Watch:  ---> button pressed")
        self.labelOutput.setText("Hello")
        self.labelSaysHello = false
        }
        else
        {
           self.labelOutput.setText("Good Bye")
            self.labelSaysHello = true
        }
        
    }
    
    
}
