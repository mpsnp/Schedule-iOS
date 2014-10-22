//
//  SGroupTableViewCell.swift
//  Shedule
//
//  Created by George on 18.10.14.
//  Copyright (c) 2014 SMediaLink. All rights reserved.
//

import UIKit

class SGroupTableViewCell: UITableViewCell {
    
    @IBOutlet weak var borderedView: SBorderedView!
    @IBOutlet weak var labelTitle: UILabel!
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let alpha: CGFloat = selected ? 0.4 : 0.1
        borderedView.tintColor = UIColor(white: 1, alpha: alpha)
    }

}
