//
//  RecordsTableViewController.swift
//  Playground
//
//  Created by Mehmet Alper Duran on 24/04/16.
//  Copyright © 2016 Alper Duran. All rights reserved.
//

import UIKit

var records = [String]() // This is a global variable. All conrols can reach this object.



class RecordsTableViewController: UIViewController, UITableViewDelegate {

// !!== PRE-LOAD == !!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if NSUserDefaults.standardUserDefaults().objectForKey("records") != nil {
            
            records = NSUserDefaults.standardUserDefaults().objectForKey("records") as! [String] // This is the NS Object for saving the records

            
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
// !!== UI OUTLET OBJECTS == !!
    
    @IBOutlet weak var recordsTable: UITableView! // Showing the records on the record table


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {  // This is function that returns the Rows
        
        return records.count
        
    }

     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {  // This is function that returns cell
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = records[indexPath.row]
        
        return cell
        
    }
    

    
    
    override func viewDidAppear(animated: Bool) { // This is for reloading data when changes makes on the table view
        
        recordsTable.reloadData()
        
    }


}
