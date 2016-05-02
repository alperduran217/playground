//
//  RecordsViewController.swift
//  Playground
//
//  Created by Mehmet Alper Duran on 25/04/16.
//  Copyright © 2016 Alper Duran. All rights reserved.
//

import UIKit

var recordsOperation = [String]() // This is a global variable. All conrols can reach this object.


class RecordsViewController: UIViewController, UITableViewDelegate {

    
// !!== PRE-LOAD == !!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        if NSUserDefaults.standardUserDefaults().objectForKey("recordsOperation") != nil {
            
            records = NSUserDefaults.standardUserDefaults().objectForKey("recordsOperation") as! [String] // This is the NS Object for saving the records
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
// !!== UI OUTLET OBJECTS == !!
    
    @IBOutlet weak var recordsOperationTable: UITableView! // Showing the records on the record table

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // This is function that returns the Rows
        
        return recordsOperation.count
        
    }
    
// !!== FUNCTIONS == !!
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell { // This is function that returns cell
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = recordsOperation[indexPath.row]
        
        return cell
        
    }
    
    
    
    
    override func viewDidAppear(animated: Bool) { // This is for reloading data when changes makes on the table view
        
        recordsOperationTable.reloadData()
        
    }

}
