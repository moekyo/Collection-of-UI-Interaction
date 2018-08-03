//
//  ViewController.swift
//  Collection of UI Interaction
//
//  Created by edaotech on 2018/7/31.
//  Copyright © 2018年 moekyo. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    let controllerNames = ["AutoLayoutController", "PopMenuViewController"]
    let titles = ["自动布局实现界面元素悬停", "长按弹出菜单"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controllerNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.reloadColor()
        cell.titleLabel.text = titles[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let vcName = controllerNames[indexPath.row]
        let vc = UIStoryboard(name: vcName, bundle: nil).instantiateInitialViewController()
        show(vc!, sender: nil)
        
    }
    
    
}
