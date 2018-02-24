//
//  RAInterestViewController.swift
//  Rehaan Advani WWDC 16
//
//  Created by Rehaan Advani on 1/15/16.
//  Copyright © 2016 Rehaan Advani. All rights reserved.
//

import UIKit

class RAInterestViewController: UIViewController {
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var itemBehavior: UIDynamicItemBehavior!
    
    var ios = UIButton(frame: CGRect(x: 25, y: 25, width: 110, height: 110))
    var web = UIButton(frame: CGRect(x: 100, y: 47, width: 110, height: 110))
    var tennis = UIButton(frame: CGRect(x: 300, y: 237, width: 110, height: 110))
    var math = UIButton(frame: CGRect(x: 150, y: 0, width: 110, height: 110))
    var science = UIButton(frame: CGRect(x: 200, y: 150, width: 110, height: 110))
    
    let darkBlur = UIBlurEffect(style: UIBlurEffectStyle.Light)
    var blurView = UIVisualEffectView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navBar()
        self.addAnimator()
    }

    override func willMoveToParentViewController(parent: UIViewController?) {
        super.willMoveToParentViewController(parent)
        if parent == nil {
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        }
    }

    
    //MARK: Navigation Bar
    func navBar() {
        self.title = "Interests"
        self.navigationController?.navigationBar.barStyle = .Black
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        var navTitleFont = UIFont(name: "SFUIText-Light", size: 20)
        
        if self.view.frame.size.height == 568 {
            navTitleFont = UIFont(name: "SFUIText-Light", size: 19)
        } else if self.view.frame.size.height == 736 {
            navTitleFont = UIFont(name: "SFUIText-Light", size: 21)
        }
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: navTitleFont!]
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bridge5.jpg")!)
        
        self.blurView = UIVisualEffectView(effect: darkBlur)
        blurView.frame = self.view.frame
        self.view.addSubview(blurView)

        
    }
    
    //MARK: UIDynamicAnimator
    func addAnimator() {
        
        self.ios.backgroundColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        self.ios.layer.cornerRadius = 55
        self.ios.setTitle("iOS Dev", forState: .Normal)
        self.ios.titleLabel?.textColor = UIColor.whiteColor()
        self.ios.addTarget(self, action: #selector(RAInterestViewController.iosTapped(_:)), forControlEvents: .TouchUpInside)
        self.ios.titleLabel?.font = UIFont(name: "SFUIText-Light", size: 18)
        self.view.addSubview(ios)
        
        self.web.backgroundColor = UIColor(red: 192/255, green: 57/255, blue: 43/255, alpha: 1.0)
        self.web.setTitle("Web Dev", forState: .Normal)
        self.web.titleLabel?.textColor = UIColor.whiteColor()
        self.web.addTarget(self, action: #selector(RAInterestViewController.webTapped(_:)), forControlEvents: .TouchUpInside)
        self.web.layer.cornerRadius = 55
        self.web.titleLabel?.font = UIFont(name: "SFUIText-Light", size: 18)
        self.view.addSubview(web)
        
        
        self.tennis.backgroundColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        self.tennis.layer.cornerRadius = 55
        self.tennis.setTitle("Tennis", forState: .Normal)
        self.tennis.titleLabel?.textColor = UIColor.whiteColor()
        self.tennis.addTarget(self, action: #selector(RAInterestViewController.tennisTapped(_:)), forControlEvents: .TouchUpInside)
        self.tennis.titleLabel?.font = UIFont(name: "SFUIText-Light", size: 18)
        self.view.addSubview(tennis)
        
        
        self.math.backgroundColor = UIColor(red: 192/255, green: 57/255, blue: 43/255, alpha: 1.0)
        self.math.layer.cornerRadius = 55
        self.math.setTitle("Math", forState: .Normal)
        self.math.titleLabel?.textColor = UIColor.whiteColor()
        self.math.addTarget(self, action: #selector(RAInterestViewController.mathTapped(_:)), forControlEvents: .TouchUpInside)
        self.math.titleLabel?.font = UIFont(name: "SFUIText-Light", size: 18)
        self.view.addSubview(math)
        
        
        self.science.backgroundColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        self.science.layer.cornerRadius = 55
        self.science.setTitle("Science", forState: .Normal)
        self.science.titleLabel?.textColor = UIColor.whiteColor()
        self.science.addTarget(self, action: #selector(RAInterestViewController.sciTapped(_:)), forControlEvents: .TouchUpInside)
        self.science.titleLabel?.font = UIFont(name: "SFUIText-Light", size: 18)
        self.view.addSubview(science)
        
        if self.view.frame.size.height == 568 {
            self.ios.frame.size.width = 90
            self.ios.frame.size.height = 90
            self.ios.layer.cornerRadius = 45
            
            self.web.frame.size.width = 90
            self.web.frame.size.height = 90
            self.web.layer.cornerRadius = 45
            
            self.tennis.frame.size.width = 90
            self.tennis.frame.size.height = 90
            self.tennis.layer.cornerRadius = 45
            self.tennis.center.x = 250
            
            self.math.frame.size.width = 90
            self.math.frame.size.height = 90
            self.math.layer.cornerRadius = 45
            
            self.science.frame.size.width = 90
            self.science.frame.size.height = 90
            self.science.layer.cornerRadius = 45
        }
        
        
        self.animator = UIDynamicAnimator(referenceView: self.view)
        self.gravity = UIGravityBehavior(items: [ios, web, tennis, math, science])
        self.collision = UICollisionBehavior(items: [ios, web, tennis, math, science])
        self.itemBehavior = UIDynamicItemBehavior(items: [ios, web, tennis, math, science])
        collision.collisionMode = .Everything
        collision.translatesReferenceBoundsIntoBoundary = true
        itemBehavior.elasticity = 1.0
        self.animator.addBehavior(gravity)
        self.animator.addBehavior(collision)
        self.animator.addBehavior(itemBehavior)
    }
    
    func iosTapped(sender: UIButton) {
        let detailView = RAInterestsDetailViewController()
        detailView.area = "iOS Development"
        
        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: .Default)


        self.navigationController?.pushViewController(detailView, animated: true)
    }
    
    func webTapped(sender: UIButton) {
        let detailView = RAInterestsDetailViewController()
        detailView.area = "Web Development"
        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: .Default)

        self.navigationController?.pushViewController(detailView, animated: true)
    }
    
    func tennisTapped(sender: UIButton) {
        let detailView = RAInterestsDetailViewController()
        detailView.area = "Tennis"
        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: .Default)

        self.navigationController?.pushViewController(detailView, animated: true)
    }
    
    func mathTapped(sender: UIButton) {
        let detailView = RAInterestsDetailViewController()
        detailView.area = "Math"
        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: .Default)

        self.navigationController?.pushViewController(detailView, animated: true)
    }
    
    func sciTapped(sender: UIButton) {
        let detailView = RAInterestsDetailViewController()
        detailView.area = "Science"
        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: .Default)

        self.navigationController?.pushViewController(detailView, animated: true)
    }
    

}

