//
//  SBorderedButton.swift
//  Shedule
//
//  Created by George on 17.10.14.
//  Copyright (c) 2014 SMediaLink. All rights reserved.
//

import UIKit

@IBDesignable
class SBorderedButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0
    @IBInspectable var borderColor: UIColor = UIColor.blackColor()
    
    override func drawRect(rect: CGRect)
    {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        tintColor!.setFill()
        borderColor.setStroke()
        path.fill()
        path.stroke()
        super.drawRect(rect)
    }
}
