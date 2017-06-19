//
//  ViewController.swift
//  dragANDdrop
//
//  Created by Szabolcs Toth on 11/27/16.
//  Copyright © 2016 purzelbaum.hu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet var pathLabel: NSTextField!
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
         NotificationCenter.default.addObserver(self, selector: #selector(showMePath), name: NSNotification.Name(rawValue: "show"), object: nil)
        
        self.pathLabel.stringValue = "path will come here..."

        // Do any additional setup after loading the view.
    }

    func showMePath() {
            self.pathLabel.stringValue = droppedFilePath!
    }
}
