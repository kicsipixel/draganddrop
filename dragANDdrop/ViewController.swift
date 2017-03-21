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
        
        self.pathLabel.stringValue = "path will come here..."

        // Do any additional setup after loading the view.
    }

    func showMePath(path: String) {
        print(path)
        
        if self.pathLabel == nil {
            print("Something wrong...")
        } else {
            self.pathLabel.stringValue = path
        }
    }
}

