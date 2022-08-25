//
//  ViewController.swift
//  dragANDdrop
//
//  Created by Szabolcs Toth on 11/27/16.
//  Copyright © 2016 purzelbaum.hu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var imageView: NSImageView!
    @IBOutlet var dragView: DragView!
    @IBOutlet var pathLabel: NSTextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = Drapanddrop.imageOfDrop
    }
}
