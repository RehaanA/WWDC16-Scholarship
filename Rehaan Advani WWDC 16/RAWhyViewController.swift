//
//  RAWhyViewController.swift
//  Rehaan Advani WWDC 16
//
//  Created by Rehaan Advani on 3/11/16.
//  Copyright © 2016 Rehaan Advani. All rights reserved.
//

import UIKit
import Agrume

class RAWhyViewController: UIViewController {
    var imageView1 = UIImageView()
    var imageView2 = UIImageView()
    var imageView3 = UIImageView()

    var label1 = UILabel()
    var label2 = UILabel()
    var label3 = UILabel()
    
    var slideLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navBar()
        self.addImageViews()
        self.addLabels()
        self.addAnims()
        
        
    }
    
    override func willMoveToParentViewController(parent: UIViewController?) {
        super.willMoveToParentViewController(parent)
        if parent == nil {
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
            self.navigationController?.navigationBar.tintColor = UIColor.lightGrayColor()
        }
    }
    
    //MARK: Navigation Bar
    func navBar() {
        self.title = "Why WWDC?"
        self.navigationController?.navigationBar.barStyle = .Black
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        var navTitleFont = UIFont(name: "SFUIText-Light", size: 20)
        
        if self.view.frame.size.height == 568 {
            navTitleFont = UIFont(name: "SFUIText-Light", size: 19)
        } else if self.view.frame.size.height == 736 {
            navTitleFont = UIFont(name: "SFUIText-Light", size: 21)
        }

        
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: navTitleFont!]
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let clock = UIBarButtonItem(image: UIImage(named: "clock.png"), style: UIBarButtonItemStyle.Plain, target: self, action: #selector(self.clockTapped(_:)))
        self.navigationItem.rightBarButtonItem = clock
        
    }
    
    func clockTapped(sender: UIBarButtonItem) {
        self.presentViewController(UINavigationController(rootViewController: RACountdownViewController()), animated: true, completion: nil)
    }

    
    func tap1(sender: UITapGestureRecognizer) {
        let agrume = Agrume(image: self.imageView1.image!)
        agrume.showFrom(self)
    }
    
    func tap2(sender: UITapGestureRecognizer) {
        let agrume = Agrume(image: self.imageView2.image!)
        agrume.showFrom(self)
    }
    
    func tap3(sender: UITapGestureRecognizer) {
        let agrume = Agrume(image: self.imageView3.image!)
        agrume.showFrom(self)
    }
    
    func addImageViews() {
        self.imageView1.image = UIImage(named: "session.jpg")
        self.imageView1.clipsToBounds = true
        self.imageView1.layer.cornerRadius = 20
        self.imageView1.alpha = 0
        self.imageView1.userInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tap1(_:)))
        self.imageView1.addGestureRecognizer(tap)
        self.view.addSubview(self.imageView1)
        
        self.imageView1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.imageView1, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.4, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.imageView1, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.2, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.imageView1, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 0.5, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.imageView1, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.5, constant: 0.0))
        
        self.imageView2.image = UIImage(named: "people.jpg")
        self.imageView2.clipsToBounds = true
        self.imageView2.layer.cornerRadius = 20
        self.imageView2.alpha = 0
        self.imageView2.userInteractionEnabled = true
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.tap2(_:)))
        self.imageView2.addGestureRecognizer(tap2)
        self.view.addSubview(self.imageView2)
        
        self.imageView2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.imageView2, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.4, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.imageView2, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.2, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.imageView2, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.5, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.imageView2, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        
        self.imageView3.image = UIImage(named: "apple1.jpg")
        self.imageView3.clipsToBounds = true
        self.imageView3.layer.cornerRadius = 20
        self.imageView3.alpha = 0
        self.imageView3.userInteractionEnabled = true
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(self.tap3(_:)))
        self.imageView3.addGestureRecognizer(tap3)
        self.view.addSubview(self.imageView3)
        
        self.imageView3.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.imageView3, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.4, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.imageView3, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.2, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.imageView3, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 0.5, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.imageView3, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.5, constant: 0.0))
    }
    
    func addLabels() {
        self.label1.text = "It is a great way to learn more about iOS development by attending the amazing sessions and labs."
        self.label1.font = UIFont(name: "SFUIText-Light", size: 15)
        self.label1.textAlignment = .Center
        self.label1.numberOfLines = 0
        self.label1.alpha = 0
        self.view.addSubview(self.label1)
        
        self.label1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.label1, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.4, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.label1, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.2, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.label1, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.5, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.label1, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.5, constant: 0.0))
        
        self.label2.text = "There are lots of talented individuals who are passionate about coding, and WWDC enables you to connect with them."
        self.label2.font = UIFont(name: "SFUIText-Light", size: 15)
        self.label2.textAlignment = .Center
        self.label2.numberOfLines = 0
        self.label2.alpha = 0
        self.view.addSubview(self.label2)
        
        self.label2.translatesAutoresizingMaskIntoConstraints = false
        
        if self.view.frame.size.height == 568 {
            
            self.view.addConstraint(NSLayoutConstraint(item: self.label2, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.4, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.label2, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.25, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.label2, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 0.5, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.label2, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        } else {
            
            self.view.addConstraint(NSLayoutConstraint(item: self.label2, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.4, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.label2, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.2, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.label2, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 0.5, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.label2, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        }
        
        self.label3.text = "WWDC allows you to connect more with the Apple brand. Being at the front lines when Apple introduces their next big OS is surreal."
        self.label3.font = UIFont(name: "SFUIText-Light", size: 15)
        self.label3.textAlignment = .Center
        self.label3.numberOfLines = 0
        self.label3.alpha = 0
        self.view.addSubview(self.label3)
        
        self.label3.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.label3, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.4, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.label3, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.25, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.label3, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.5, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.label3, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.5, constant: 0.0))
        
        if self.view.frame.size.height == 568 {
            self.label1.font = UIFont(name: "SFUIText-Light", size: 14)
            self.label2.font = UIFont(name: "SFUIText-Light", size: 14)
            self.label3.font = UIFont(name: "SFUIText-Light", size: 14)
        } else if self.view.frame.size.height == 736 {
            self.label1.font = UIFont(name: "SFUIText-Light", size: 16)
            self.label2.font = UIFont(name: "SFUIText-Light", size: 16)
            self.label3.font = UIFont(name: "SFUIText-Light", size: 16)
        }
    }
    
    
    
    func addAnims() {
        UIView.animateWithDuration(0.5) { () -> Void in
            self.imageView1.alpha = 1.0
        }
        
        UIView.animateKeyframesWithDuration(0.5, delay: 0.5, options: .AllowUserInteraction, animations: { () -> Void in
            self.label1.alpha = 1.0
            }, completion: nil)
        
        UIView.animateKeyframesWithDuration(0.5, delay: 1, options: .AllowUserInteraction, animations: { () -> Void in
            self.imageView2.alpha = 1.0
            }, completion: nil)
        
        UIView.animateKeyframesWithDuration(0.5, delay: 1.5, options: .AllowUserInteraction, animations: { () -> Void in
            self.label2.alpha = 1.0
            }, completion: nil)
        
        UIView.animateKeyframesWithDuration(0.5, delay: 2, options: .AllowUserInteraction, animations: { () -> Void in
            self.imageView3.alpha = 1.0
            }, completion: nil)
        
        UIView.animateKeyframesWithDuration(0.5, delay: 2.5, options: .AllowUserInteraction, animations: { () -> Void in
            self.label3.alpha = 1.0
            }, completion: nil)
        
        UIView.animateKeyframesWithDuration(0.5, delay: 3, options: .AllowUserInteraction, animations: { () -> Void in
            self.slideLabel.alpha = 1.0
            }, completion: nil)
    }
}
