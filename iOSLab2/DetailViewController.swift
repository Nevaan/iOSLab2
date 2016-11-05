//
//  DetailViewController.swift
//  iOSLab2
//
//  Created by Paweł Łosek on 05.11.2016.
//  Copyright © 2016 Paweł Łosek. All rights reserved.
//


import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var switchStatus: UILabel!
    
    var data: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let label = data {
            switchStatus.text = data
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

