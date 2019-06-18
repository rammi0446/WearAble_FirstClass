//
//  ViewController.swift
//  WatchIntro
//
//  Created by MacStudent on 2019-06-18.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController , WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    //MARK: Watch connectivity session Delegate Functions

    

    @IBOutlet weak var outputLabel: UILabel!
    @IBAction func btnPressed(_ sender: Any) {
        //ouput to console
        print("you pushed the button")
        //output to label
        self.outputLabel.text = "button pressed"
        // check if the watch is paired / accessible
        if (WCSession.default.isReachable) {
            // construct the message you want to send
            // the message is in dictionary
            let message = ["name": "raman"]
            // send the message to the watch
            WCSession.default.sendMessage(message, replyHandler: nil)
            print("Phone: send the data")
            self.outputLabel.text = "msg send"
        }
        else{
            print("Phone: cannot find watch")
              self.outputLabel.text = "cannot find watch"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //check if phone support WCSession
        //need WCSession to communicate with watch
        if (WCSession.isSupported()) {
            print("Yes it is!")
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        else{
            print("phone does not supported")
        }
    }


}

