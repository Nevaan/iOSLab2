//
//  DetailViewController.swift
//  iOSLab2
//
//  Created by Paweł Łosek on 05.11.2016.
//  Copyright © 2016 Paweł Łosek. All rights reserved.
//


import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var artistField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var genreField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var ratingField: UILabel!
    
    
    @IBOutlet weak var ratingStepper: UIStepper!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var currentIndex: Int!
    var homeScreen: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeScreen = ((navigationController!.viewControllers[0]) as? ViewController)!
        fillFieldsWithData()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Buttons actions
    
    @IBAction func cancelAction(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
 
    @IBAction func deleteAction(sender: AnyObject) {
        homeScreen.albums.removeObjectAtIndex(currentIndex)
        homeScreen.tableView.reloadData()
        navigationController?.popViewControllerAnimated(true)
    }
    
    //Utils
    func fillFieldsWithData() {
        let album:NSDictionary = homeScreen.albums[currentIndex] as! NSDictionary
        
        artistField.text = String(album["artist"]!)
        titleField.text = String(album["title"]!)
        genreField.text = String(album["genre"]!)
        yearField.text = String(album["date"]!)
        ratingField.text = String(album["rating"]!)
    }
    
}

