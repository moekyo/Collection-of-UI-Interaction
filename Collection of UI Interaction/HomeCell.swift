//
//  HomeCell.swift
//  Collection of UI Interaction
//
//  Created by edaotech on 2018/7/31.
//  Copyright © 2018年 moekyo. All rights reserved.
//

import UIKit
import Spring

class HomeCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var containerView: DesignableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        visualEffectView.layer.cornerRadius = 14
        visualEffectView.layer.masksToBounds = true
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func reloadColor() {
        containerView.backgroundColor = UIColor.randomColor
    }
    
    
    

}
