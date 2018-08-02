//
//  PopMenuViewController.swift
//  Collection of UI Interaction
//
//  Created by edaotech on 2018/8/1.
//  Copyright © 2018年 moekyo. All rights reserved.
//

import UIKit

class PopMenuViewController: UIViewController {

    let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 25
        containerView.layer.shadowColor = UIColor(white: 0.4, alpha: 0.4).cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 4)
        containerView.layer.shadowRadius = 10
        containerView.layer.shadowOpacity = 0.5
        
        let padding: CGFloat = 8
        let viewHeight: CGFloat = 40
        
        let subViews = [UIColor.red, .orange, .cyan, .green, .yellow, .purple].map({ (color) -> UIView in
            let subView = UIView()
            subView.backgroundColor = color
            subView.layer.cornerRadius = viewHeight / 2
            subView.tag = 999
            return subView
        })
        
        let stackView = UIStackView(arrangedSubviews: subViews)
        stackView.layoutMargins = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        stackView.distribution = .fillEqually
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.spacing = padding
        let width = CGFloat(subViews.count) * viewHeight  + CGFloat((subViews.count + 1)) * padding
        containerView.frame = CGRect(x: 0, y: 0, width: width, height: viewHeight + 2 * padding)
        stackView.frame = containerView.frame
        containerView.addSubview(stackView)
        return containerView
    }()
    
    
    
    var beganPoint: CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor.randomColor
        setupLongPressGesture()
        
        
        
    }
    
    func setupLongPressGesture() {
        view.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleGesture)))
    }
    
    @objc func handleGesture(gesture: UILongPressGestureRecognizer) {
        
        
        var pressLocation = gesture.location(in: self.view)
        let centerX = (view.frame.width - containerView.frame.width) / 2
        
        
        if gesture.state == .began {
            beganPoint = pressLocation
            view.addSubview(containerView)
            containerView.alpha = 0
            containerView.transform = CGAffineTransform(translationX: centerX, y: pressLocation.y)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                self.containerView.alpha = 1
                self.containerView.transform = CGAffineTransform(translationX: centerX, y: pressLocation.y - self.containerView.frame.height - 50)
            })
            
            
        } else if gesture.state == .changed {
            pressLocation = gesture.location(in: containerView)
            let point = CGPoint(x: pressLocation.x, y: 8)
            let hitTestView = containerView.hitTest(point, with: nil)
            if hitTestView?.tag == 999 {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    let stackView = self.containerView.subviews.first
                    stackView?.subviews.forEach({ (subView) in
                        subView.transform = .identity
                    })
                    hitTestView?.transform = CGAffineTransform(translationX: 0, y: -60)
                    
                    
                    
                }) { (_) in
                    
                }
            }
            
        } else if gesture.state == .ended {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                self.containerView.alpha = 0
                self.containerView.transform = CGAffineTransform(translationX: centerX, y: self.beganPoint.y)
                let stackView = self.containerView.subviews.first
                stackView?.subviews.forEach({ (subView) in
                    subView.transform = .identity
                })
            }) { (_) in
                self.containerView.removeFromSuperview()
            }
            
        }
        
    }
    
}
