//
//  ViewController.swift
//  nixieControl1
//
//  Created by Mariano Elia on 2017-04-06.
//  Copyright © 2017 Mariano Elia. All rights reserved.
//

import UIKit
import Spark_SDK
import SparkSetup

class ViewController: UIViewController {
    
    @IBOutlet weak var startDeviceSetup: NSLayoutConstraint!

    @IBOutlet weak var blueLedSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Used for initially setting up device
    @IBAction func startDeviceSetup(_ sender: Any) {
        
        let setupController = SparkSetupMainController()
        self.present(setupController!, animated: true, completion: nil)
        
    }
    
    //Call scramble
    @IBAction func readVariableButtonTapped(_ sender: Any) {
        SparkCloud.sharedInstance().getDevices { (sparkDevicesList : [Any]?, error :Error?) -> Void in
            // 2
            if let sparkDevices = sparkDevicesList as? [SparkDevice]
            {
                print(sparkDevices)
                // 3
                for device in sparkDevices
                {
                    if device.name == "myDevice"
                    {
                        // 4
                        device.callFunction("Scramble", withArguments: ["on"], completion: { (resultCode :NSNumber?, error : Error?) -> Void in
                            // 5
                           print("Called a function on myDevice")
                        })
                    }
                }
            }
        }
    }
    
    
    
    @IBAction func blueLEDSwitched(_ sender: Any) {
        SparkCloud.sharedInstance().getDevices { (sparkDevicesList : [Any]?, error :Error?) -> Void in
            // 2
            if let sparkDevices = sparkDevicesList as? [SparkDevice]
            {
                print(sparkDevices)
                // 3
                for device in sparkDevices
                {
                    if device.name == "myDevice"
                    {
                        if self.blueLedSwitch.isOn{
                            device.callFunction("BlueLEDs", withArguments: ["on"], completion: { (resultCode :NSNumber?, error : Error?) -> Void in
                        })
                            print("Led is on")
                        }
                                else {
                                device.callFunction("BlueLEDs", withArguments: ["off"], completion: { (resultCode :NSNumber?, error : Error?) -> Void in
                                })
                            print("LED is off")
                                }
                        // 4
                        
                            // 5
                            print("Called a function on myDevice")
                    
                    }
                }
            }
        }
    }
    
    
    
    @IBAction func showDate(_ sender: Any) {
        SparkCloud.sharedInstance().getDevices { (sparkDevicesList : [Any]?, error :Error?) -> Void in
            // 2
            if let sparkDevices = sparkDevicesList as? [SparkDevice]
            {
                print(sparkDevices)
                // 3
                for device in sparkDevices
                {
                    if device.name == "myDevice"
                    {
                        // 4
                        device.callFunction("Date", withArguments: ["on"], completion: { (resultCode :NSNumber?, error : Error?) -> Void in
                            // 5
                            print("Called a function on myDevice")
                        })
                    }
                }
            }
        }
    }
    
    
    @IBAction func startEffect(_ sender: Any) {
    
        SparkCloud.sharedInstance().getDevices { (sparkDevicesList : [Any]?, error :Error?) -> Void in
            // 2
            if let sparkDevices = sparkDevicesList as? [SparkDevice]
            {
                print(sparkDevices)
                // 3
                for device in sparkDevices
                {
                    if device.name == "myDevice"
                    {
                        // 4
                        device.callFunction("Start Effect", withArguments: ["on"], completion: { (resultCode :NSNumber?, error : Error?) -> Void in
                            // 5
                            print("Called a function on myDevice")
                        })
                    }
                }
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


