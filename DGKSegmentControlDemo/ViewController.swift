//
//  ViewController.swift
//  DGKSegmentControlDemo
//
//  Created by dip kasyap on 3/12/18.
//  Copyright © 2018 dip kasyap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentControl: DGKSegmentControl!
    @IBOutlet weak var lbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    
        //Setup
        segmentControl.titles = ["First", "Second"]
    
    }
    
    @IBAction func segmentDidChanged(_ sender: DGKSegmentControl) {
        self.lbl.text = sender.titles[sender.selectedIndex]
        
        print(sender.selectedTitle)
        
    }
    

}

