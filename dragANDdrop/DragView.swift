//
//  DragView.swift
//  dragANDdrop
//
//  Created by Szabolcs Toth on 11/28/17.
//  Copyright © 2017 purzelbaum.hu. All rights reserved.
//

import Cocoa

class DragView: NSView {
    
    var filePath: String?
    private var fileTypeIsOk = false
    private var fileTypes = ["xml"]
    var droppedFilePath: String?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)

        let draggedType = NSPasteboard.PasteboardType(kUTTypeURL as String)
        self.registerForDraggedTypes([draggedType])
    }
    
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        if checkExtension(drag: sender) {
            fileTypeIsOk = true
            return .copy
        } else {
            fileTypeIsOk = false
            return []
        }
    }
    
    override func draggingUpdated(_ sender: NSDraggingInfo) -> NSDragOperation {
        if fileTypeIsOk {
            return .copy
        } else {
            return []
        }
    }
    
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        if let board = sender.draggingPasteboard.propertyList(forType: convertToNSPasteboardPasteboardType("NSFilenamesPboardType")) as? NSArray,
            let filePath  = board[0] as? String {
            droppedFilePath = filePath
            print(droppedFilePath)
            return true
        }
        return false
    }
    
    func checkExtension(drag: NSDraggingInfo) -> Bool {
        if let board = drag.draggingPasteboard.propertyList(forType: convertToNSPasteboardPasteboardType("NSFilenamesPboardType")) as? NSArray, let path = board[0] as? String {
            let url = NSURL(fileURLWithPath: path)
            if let fileExtension = url.pathExtension?.lowercased() {
                return fileTypes.contains(fileExtension)
            }
        }
        return false
    }
    
}


// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToNSPasteboardPasteboardTypeArray(_ input: [String]) -> [NSPasteboard.PasteboardType] {
    return input.map { key in NSPasteboard.PasteboardType(key) }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSPasteboardPasteboardType(_ input: NSPasteboard.PasteboardType) -> String {
    return input.rawValue
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToNSPasteboardPasteboardType(_ input: String) -> NSPasteboard.PasteboardType {
    return NSPasteboard.PasteboardType(rawValue: input)
}

