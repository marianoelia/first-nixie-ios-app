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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func startDeviceSetup(_ sender: Any) {
        
        let setupController = SparkSetupMainController()
        self.present(setupController!, animated: true, completion: nil)
        
    }
    
    
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
                        device.callFunction("digitalwrite", withArguments: ["D6","HIGH"], completion: { (resultCode :NSNumber?, error : Error?) -> Void in
                            // 5
                           print("Called a function on myDevice")
                        })
                    }
                }
            }
        }
    }
    
    
}



