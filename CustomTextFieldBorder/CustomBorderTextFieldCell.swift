//
//  CustomBorderTextFieldCell.swift
//  CustomTextFieldBorder
//
//  Created by Tim Wolff on 11/02/2019.
//  Copyright © 2019 Tim Wolff. All rights reserved.
//

import Cocoa

/**
 Creates an custom border, that is just a line underneath the NSTextField.
 */
class CustomBorderTextFieldCell: NSTextFieldCell {
    // How thick should the border be
    let borderThickness: CGFloat = 3
    
    // Add extra height, to accomodate the underlined border, as the minimum required size for the NSTextField
    override var cellSize: NSSize {
        let originalSize = super.cellSize
        return NSSize(width: originalSize.width, height: originalSize.height + borderThickness)
    }
    
    // Render the custom border for the NSTextField
    override func draw(withFrame cellFrame: NSRect, in controlView: NSView) {
        // Area that covers the NSTextField itself. That is the total height minus our custom border size.
        let interiorFrame = NSRect(x: 0, y: 0, width: cellFrame.width, height: cellFrame.height - borderThickness)
        
        let path = NSBezierPath()
        path.lineWidth = borderThickness
        // Line width is at the center of the line.
        path.move(to: NSPoint(x: 0, y: cellFrame.height - (borderThickness / 2)))
        path.line(to: NSPoint(x: cellFrame.width, y: cellFrame.height - (borderThickness / 2)))
        NSColor.black.setStroke()
        path.stroke()
        
        // Pass in area minus the border thickness in the height
        drawInterior(withFrame: interiorFrame, in: controlView)
    }
}
