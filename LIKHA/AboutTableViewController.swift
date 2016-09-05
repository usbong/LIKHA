//
//  AboutTableViewController.swift
//  LIKHA
//
//  Created by Chris Amanse on 05/09/2016.
//  Copyright © 2016 Usbong Social Systems, Inc. All rights reserved.
//

import UIKit

class AboutTableViewController: UITableViewController {
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        // Use text found in "About.txt" in text view
        if let aboutURL = NSBundle.mainBundle().URLForResource("About", withExtension: "txt"),
            let text = try? String(contentsOfURL: aboutURL, encoding: NSUTF8StringEncoding) {
            
            self.textView.text = text
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 900
    }
}
