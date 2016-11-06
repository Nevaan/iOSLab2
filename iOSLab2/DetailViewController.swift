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
        
        ratingStepper.maximumValue = 5
        ratingStepper.wraps = true
        ratingStepper.autorepeat = true
                
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Buttons actions
    @IBAction func ratingStepperAction(sender: UIStepper) {
        ratingField.text = Int(sender.value).description
    }
    
    
    @IBAction func newRecordAction(sender: AnyObject) {
        clearFields()
        currentIndex = homeScreen.albums.count
        deleteButton.enabled = false
    }
    
    @IBAction func saveAction(sender: AnyObject) {
        if(currentIndex >= homeScreen.albums.count) {
            let newRecord = NSMutableDictionary(dictionary:
                [
                    "artist": artistField.text!,
                    "date": yearField.text!,
                    "genre": genreField.text!,
                    "rating": ratingField.text!,
                    "title": titleField.text!
                ]
            )
            homeScreen.albums.addObject(newRecord)
        } else {
            let updatedRecord:NSMutableDictionary = homeScreen.albums[currentIndex] as! NSMutableDictionary
            updatedRecord.setValue(artistField.text!, forKey: "artist")
            updatedRecord.setValue(yearField.text, forKey: "date")
            updatedRecord.setValue(genreField.text, forKey: "genre")
            updatedRecord.setValue(ratingField.text, forKey: "rating")
            updatedRecord.setValue(titleField.text, forKey: "title")
        }
        
        homeScreen.tableView.reloadData()
        navigationController?.popViewControllerAnimated(true)
    }
    
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
        ratingStepper.value = album["rating"]!.doubleValue
    }
    
    func clearFields() {
        artistField.text = ""
        titleField.text = ""
        genreField.text = ""
        yearField.text = ""
        ratingField.text = "0"
        ratingStepper.value = 0
    }
    
    
}

