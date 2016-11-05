//
//  ViewController.swift
//  iOSLab2
//
//  Created by Paweł Łosek on 05.11.2016.
//  Copyright © 2016 Paweł Łosek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switcher: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "detailsSegue") {
            var state: String
            if(switcher.isOn) {
                state = "ON"
            } else {
                state = "OFF"
            }
        
            (segue.destination as! DetailViewController).data = state
            
        }
    }

}

