//
//  ViewController.swift
//  iOSLab2
//
//  Created by Paweł Łosek on 05.11.2016.
//  Copyright © 2016 Paweł Łosek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var albums: NSMutableArray = []
    var albumsDocPath: String = ""
    let fileManager = NSFileManager.defaultManager()
    let plistCatPath = NSBundle.mainBundle().pathForResource("albums", ofType: "plist");
    let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataFromFile()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.dataSource = self
        
        
        /* Observing application state to save/load data */
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.saveDataToFile), name: UIApplicationWillResignActiveNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.loadDataFromFile), name: UIApplicationDidBecomeActiveNotification, object: nil)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "albumDetailSegue") {
            var index: Int
            index = (tableView.indexPathForSelectedRow?.row)!
            
            (segue.destinationViewController as! DetailViewController).currentIndex = index
            
        }
    }
    
    func loadDataFromFile() {
        albumsDocPath = documentsPath.stringByAppendingString("/albums.plist")
        
        if !fileManager.fileExistsAtPath(albumsDocPath) {
            try? fileManager.copyItemAtPath(plistCatPath!, toPath: albumsDocPath)
        }
        
        albums = NSMutableArray(contentsOfFile: albumsDocPath)!
    }
    
    func saveDataToFile(){
        albums.writeToFile(albumsDocPath, atomically: true)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:AlbumCell = self.tableView.dequeueReusableCellWithIdentifier("AlbumTableCellView") as! AlbumCell
        
        cell.authorLabel.text = self.albums[indexPath.row]["artist"] as? String
        
        cell.titleLabel.text = self.albums[indexPath.row]["title"] as? String
        
        cell.titleLabel.adjustsFontSizeToFitWidth = false
        cell.titleLabel.lineBreakMode = NSLineBreakMode.ByTruncatingTail
        
        
        return cell
    }
    
    
    
}

