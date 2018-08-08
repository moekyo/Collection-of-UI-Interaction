//
//  HoverTableViewController.swift
//  Collection of UI Interaction
//
//  Created by edaotech on 2018/8/8.
//  Copyright © 2018年 moekyo. All rights reserved.
//

import UIKit

class HoverTableViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableHeaderView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topContainerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension HoverTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .cyan
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
}

extension HoverTableViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
////        print(scrollView.contentOffset)
//        if scrollView.contentOffset.y == 200 {
//            tableView.isScrollEnabled = true
//        } else {
//            tableView.isScrollEnabled = false
//        }
//        
//        
////        if scrollView.contentOffset.y >= 200 {
////            tableView.isScrollEnabled = false
////        } else {
////            tableView.isScrollEnabled = true
////        }
    }
    
}
