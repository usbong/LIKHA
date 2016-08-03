//
//  ViewController.swift
//  MISA
//
//  Created by Chris Amanse on 02/08/2016.
//  Copyright © 2016 Usbong Social Systems, Inc. All rights reserved.
//

import UIKit
import UsbongKit

class ViewController: UIViewController {
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageViewHeightConstraint.constant = heightForCoverImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressStart(sender: AnyObject) {
        let treeURL = NSBundle.mainBundle().URLForResource("MISA", withExtension: "utree")!
        
        Usbong.presentViewer(onViewController: self, withUtreeURL: treeURL)
    }
    
    func heightForCoverImage() -> CGFloat {
        if let originalSize = coverImageView.image?.size {
            let width = view.bounds.width
            let aspectRatio = width / originalSize.width
            let height = aspectRatio * originalSize.height
            
            return height
        }
        
        return 0
    }
}

