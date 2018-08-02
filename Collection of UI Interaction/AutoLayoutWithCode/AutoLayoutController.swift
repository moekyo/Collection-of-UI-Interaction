//
//  AutoLayoutController.swift
//  Collection of UI Interaction
//
//  Created by edaotech on 2018/7/31.
//  Copyright © 2018年 moekyo. All rights reserved.
//

import UIKit
import Spring
class AutoLayoutController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var toolbarConstraints: [NSLayoutConstraint]!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var toolBar: DesignableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }

}


extension AutoLayoutController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let leadingConstraint = toolBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        
        var topMargin: CGFloat
        
        if (navigationController?.isNavigationBarHidden)! {
            topMargin = 30
        } else {
            topMargin = 30 + 44
        }
        
        let topConstraint = toolBar.topAnchor.constraint(equalTo: view.topAnchor, constant: topMargin)
        let trailingConstraint = toolBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)

        if scrollView.contentOffset.y >= 95 {
            toolBar.removeFromSuperview()
            NSLayoutConstraint.deactivate(toolbarConstraints)
            view.addSubview(toolBar)
            NSLayoutConstraint.activate([leadingConstraint,topConstraint,trailingConstraint])
        } else {
            NSLayoutConstraint.deactivate([leadingConstraint,topConstraint,trailingConstraint])
            toolBar.removeFromSuperview()
            headerView.addSubview(toolBar)
            NSLayoutConstraint.activate(toolbarConstraints)
        }
    }
}


extension AutoLayoutController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath)
        return cell
        
    }
    
    
    
}
