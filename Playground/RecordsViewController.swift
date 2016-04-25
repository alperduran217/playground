//
//  RecordsViewController.swift
//  Playground
//
//  Created by Mehmet Alper Duran on 25/04/16.
//  Copyright © 2016 Alper Duran. All rights reserved.
//

import UIKit

var recordsOperation = [String]()


class RecordsViewController: UIViewController, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if NSUserDefaults.standardUserDefaults().objectForKey("recordsOperation") != nil {
            
            records = NSUserDefaults.standardUserDefaults().objectForKey("recordsOperation") as! [String]
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var recordsOperationTable: UITableView!

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return recordsOperation.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = recordsOperation[indexPath.row]
        
        return cell
        
    }
    
    
    
    
    override func viewDidAppear(animated: Bool) {
        
        recordsOperationTable.reloadData()
        
    }

}
