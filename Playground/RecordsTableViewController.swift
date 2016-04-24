//
//  RecordsTableViewController.swift
//  Playground
//
//  Created by Mehmet Alper Duran on 24/04/16.
//  Copyright © 2016 Alper Duran. All rights reserved.
//

import UIKit

var records = [String]()



class RecordsTableViewController: UIViewController, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if NSUserDefaults.standardUserDefaults().objectForKey("records") != nil {
            
            records = NSUserDefaults.standardUserDefaults().objectForKey("records") as! [String]
            
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var recordsTable: UITableView!

    // MARK: - Table view data source

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return records.count
        
    }

     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = records[indexPath.row]
        
        return cell
        
    }
    

    
    
    override func viewDidAppear(animated: Bool) {
        
        recordsTable.reloadData()
        
    }


}
