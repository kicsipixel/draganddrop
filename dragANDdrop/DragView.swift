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
    private var acceptedFileExtension = ["gz"]
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        
        registerForDraggedTypes([NSPasteboard.PasteboardType.fileURL])
    }
    
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        fileTypeIsOk = checkExtension(drag: sender)
        return []
    }
    
    override func draggingUpdated(_ sender: NSDraggingInfo) -> NSDragOperation {
        return fileTypeIsOk ? .copy : []
    }
    
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
     
        guard let pasteboard = sender.draggingPasteboard().propertyList(forType: NSPasteboard.PasteboardType(rawValue: "NSFilenamesPboardType")) as? NSArray,
            let path = pasteboard[0] as? String
            else { return false }
                
        return true
    }


    fileprivate func checkExtension(drag: NSDraggingInfo) -> Bool {
        guard let board = drag.draggingPasteboard().propertyList(forType: NSPasteboard.PasteboardType(rawValue: "NSFilenamesPboardType")) as? NSArray,
            let path = board[0] as? String
            else { return false }
        
        let suffix = URL(fileURLWithPath: path).pathExtension
        for ext in self.acceptedFileExtension {
            if ext.lowercased() == suffix {
                return acceptedFileExtension.contains(ext.lowercased())
            }
        }
        return false
    }
}
