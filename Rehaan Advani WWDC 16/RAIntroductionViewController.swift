//
//  RAIntroductionViewController.swift
//  Rehaan Advani WWDC 16
//
//  Created by Rehaan Advani on 1/4/16.
//  Copyright © 2016 Rehaan Advani. All rights reserved.
//

import UIKit
import Shimmer
import MessageUI

class RAIntroductionViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    //MARK: Properties
    var aboutMeView: UIView! = UIView()
    var projectsView: UIView! = UIView()
    var educationView: UIView! = UIView()
    var skillsView: UIView! = UIView()
    var interestView: UIView! = UIView()
    var honorsView: UIView! = UIView()
    
    var aboutMeConAfter = [NSLayoutConstraint]()
    var projectsConAfter = [NSLayoutConstraint]()
    var educationConAfter = [NSLayoutConstraint]()
    var skillsConAfter = [NSLayoutConstraint]()
    var interestsConAfter = [NSLayoutConstraint]()
    var honorsConAfter = [NSLayoutConstraint]()
    
    let aboutMeLabel = UILabel()
    let educationLabel = UILabel()
    let interestsLabel = UILabel()
    let projectsLabel = UILabel()
    let skillsLabel = UILabel()
    let honorsLabel = UILabel()
    let why = UILabel()
    let shimmer = FBShimmeringView()
   
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.aboutMeView.layer.cornerRadius = self.aboutMeView.frame.size.width/2
    }
    

    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if traitCollection.forceTouchCapability == .Available {
            self.registerForPreviewingWithDelegate(self, sourceView: self.aboutMeView)
            self.registerForPreviewingWithDelegate(self, sourceView: self.projectsView)
            self.registerForPreviewingWithDelegate(self, sourceView: self.educationView)
            self.registerForPreviewingWithDelegate(self, sourceView: self.skillsView)
            self.registerForPreviewingWithDelegate(self, sourceView: self.interestView)
            self.registerForPreviewingWithDelegate(self, sourceView: self.honorsView)
            self.registerForPreviewingWithDelegate(self, sourceView: self.why)
        }

        self.navBar()
        self.addAboutMe()
        self.addEducation()
        self.addInterests()
        self.addProjects()
        self.addSkills()
        self.addHonors()
        self.addWhy()
        self.lastAnim()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.aboutMeTap), name: "about", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.educationTap), name: "education", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.projectsTap), name: "projects", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.whyPressed(_:)), name: "why", object: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.5) { () -> Void in
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        }
    }
    
    func addParallaxToView(vw: UIView) {
        let amount = 100
        
        let horizontal = UIInterpolatingMotionEffect(keyPath: "center.x", type: .TiltAlongHorizontalAxis)
        horizontal.minimumRelativeValue = -amount
        horizontal.maximumRelativeValue = amount
        
        let vertical = UIInterpolatingMotionEffect(keyPath: "center.y", type: .TiltAlongVerticalAxis)
        vertical.minimumRelativeValue = -amount
        vertical.maximumRelativeValue = amount
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontal, vertical]
        vw.addMotionEffect(group)
    }
    
    
    //MARK: Navigation Bar
    func navBar() {
        self.title = "Rehaan Advani"
        self.navigationController?.navigationBar.barStyle = .Black
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 192/255, green: 57/255, blue: 43/255, alpha: 1.0)
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        var navTitleFont = UIFont(name: "SFUIText-Light", size: 20)
        
        if self.view.frame.size.height == 568 {
            navTitleFont = UIFont(name: "SFUIText-Light", size: 19)
        } else if self.view.frame.size.height == 736 {
            navTitleFont = UIFont(name: "SFUIText-Light", size: 21)

        }
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: navTitleFont!]
        
        if self.view.frame.size.height == 736 {
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "back5.jpg")!)
        } else {
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "back9.jpg")!)
        }
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        let compose = UIBarButtonItem(barButtonSystemItem: .Compose, target: self, action: #selector(RAIntroductionViewController.compose))
        self.navigationItem.rightBarButtonItem = compose
        
    }
    
    func compose() {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        if MFMailComposeViewController.canSendMail() {
            let emailSubject = "Rehaan Advani WWDC"
            let messageBody = "\n\nWWDC 2016"
            let toRecipients: [String] = ["rehaan.advani@gmail.com"]
            let mc: MFMailComposeViewController = MFMailComposeViewController()
            
            mc.mailComposeDelegate = self
            mc.setSubject(emailSubject)
            mc.setMessageBody(messageBody, isHTML: false)
            
            mc.setToRecipients(toRecipients)
            
            mc.navigationBar.barStyle = .Black
            mc.navigationBar.tintColor = UIColor.whiteColor()
            UIBarButtonItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont(name: "SFUIText-Light", size: 17)!, NSForegroundColorAttributeName: UIColor.whiteColor()], forState: .Normal)
            let navigationTitleFont = UIFont(name: "SFUIText-Light", size: 20)!
            mc.navigationBar.titleTextAttributes = [NSFontAttributeName: navigationTitleFont]
    
            let attr = NSDictionary(dictionary: [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont(name: "SFUIText-Light", size: 18)!])
            mc.navigationBar.titleTextAttributes = attr as? [String : AnyObject]
            
            self.presentViewController(mc, animated: true, completion: { () -> Void in
                //UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: false)
               
                mc.navigationBar.barTintColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
                UIBarButtonItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont(name: "SFUIText-Light", size: 17)!], forState: .Normal)
            })
            
        } else {
            
            if let font = UIFont(name: "SFUIText-Light", size: 17) {
                UIBarButtonItem.appearance().setTitleTextAttributes([NSFontAttributeName: font], forState: .Normal)
            }
            
            let alert = UIAlertController(title: "Email", message: "No email account found", preferredStyle: .Alert)
            let alertAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            alert.addAction(alertAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }

    }
    
    override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
        return .None
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.navigationBar.barTintColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)

        if let font = UIFont(name: "SFUIText-Light", size: 17) {
            UIBarButtonItem.appearance().setTitleTextAttributes([NSFontAttributeName: font], forState: .Normal)
        }
        
        switch result.rawValue {
        case MFMailComposeResultFailed.rawValue:
            let alert = UIAlertController(title: "Failed", message: "Email failed to be sent", preferredStyle: .Alert)
            let alertAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            alert.addAction(alertAction)
            self.presentViewController(alert, animated: true, completion: nil)
        default:
            break
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    //MARK: UIViews
    func addAboutMe() {
        self.aboutMeView.layer.cornerRadius = 50
        self.aboutMeView.clipsToBounds = true
        self.aboutMeView.backgroundColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        self.view.addSubview(aboutMeView)
        
        self.aboutMeView.translatesAutoresizingMaskIntoConstraints = false
        let aboutMeConBefore = [NSLayoutConstraint(item: self.aboutMeView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.aboutMeView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.aboutMeView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.aboutMeView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.01, constant: -60.0)]
        self.view.addConstraints(aboutMeConBefore)
        
        if self.view.frame.size.height == 568 {
            self.aboutMeView.layer.cornerRadius = 45
            self.view.addConstraint(NSLayoutConstraint(item: self.aboutMeView, attribute: .Width, relatedBy: .Equal
                , toItem: self.view, attribute: .Width, multiplier: 0, constant: 90))
            self.view.addConstraint(NSLayoutConstraint(item: self.aboutMeView, attribute: .Height, relatedBy: .Equal
                , toItem: self.view, attribute: .Height, multiplier: 0, constant: 90))
            
            self.aboutMeConAfter = [NSLayoutConstraint(item: self.aboutMeView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 90), NSLayoutConstraint(item: self.aboutMeView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 90), NSLayoutConstraint(item: self.aboutMeView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.aboutMeView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0)]
        } else {
            self.aboutMeConAfter = [NSLayoutConstraint(item: self.aboutMeView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.aboutMeView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.aboutMeView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.aboutMeView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0)]
        }
        
        self.aboutMeLabel.text = "About Me"
        self.aboutMeLabel.textColor = UIColor.whiteColor()
        self.aboutMeLabel.font = UIFont(name: "SFUIText-Light", size: 17)
        self.aboutMeLabel.textAlignment = .Center
        self.aboutMeView.addSubview(self.aboutMeLabel)
        
        self.aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.aboutMeLabel, attribute: .Width, relatedBy: .Equal, toItem: self.aboutMeView, attribute: .Width, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.aboutMeLabel, attribute: .Height, relatedBy: .Equal, toItem: self.aboutMeView, attribute: .Height, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.aboutMeLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.aboutMeView, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.aboutMeLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.aboutMeView, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        
        self.view.layoutIfNeeded()
        UIView.animateWithDuration(0.8) { () -> Void in //0.75
            NSLayoutConstraint.deactivateConstraints(aboutMeConBefore)
            NSLayoutConstraint.activateConstraints(self.aboutMeConAfter)
            self.view.layoutIfNeeded()
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(RAIntroductionViewController.aboutMeTap))
        self.aboutMeView.addGestureRecognizer(tapGesture)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func addProjects() {
        self.projectsView.layer.cornerRadius = 50
        self.projectsView.clipsToBounds = true
        self.projectsView.backgroundColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        self.view.addSubview(self.projectsView)
        
        self.projectsView.translatesAutoresizingMaskIntoConstraints = false
        let projectsConBefore = [NSLayoutConstraint(item: self.projectsView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.projectsView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.projectsView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.projectsView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.01, constant: -60.0)]
        self.view.addConstraints(projectsConBefore)
        
        if self.view.frame.size.height == 568 {
            self.projectsView.layer.cornerRadius = 45
            self.view.addConstraint(NSLayoutConstraint(item: self.projectsView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 90))
            self.view.addConstraint(NSLayoutConstraint(item: self.projectsView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 90))
            
            self.projectsConAfter = [NSLayoutConstraint(item: self.projectsView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 90), NSLayoutConstraint(item: self.projectsView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 90), NSLayoutConstraint(item: self.projectsView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.projectsView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0)]
        } else {
            self.projectsConAfter = [NSLayoutConstraint(item: self.projectsView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.projectsView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.projectsView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.projectsView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0)]
        }
        
        self.projectsLabel.text = "Projects"
        self.projectsLabel.textColor = UIColor.whiteColor()
        self.projectsLabel.font = UIFont(name: "SFUIText-Light", size: 17)
        self.projectsLabel.textAlignment = .Center
        self.projectsView.addSubview(self.projectsLabel)
        
        self.projectsLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.projectsLabel, attribute: .Width, relatedBy: .Equal, toItem: self.projectsView, attribute: .Width, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.projectsLabel, attribute: .Height, relatedBy: .Equal, toItem: self.projectsView, attribute: .Height, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.projectsLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.projectsView, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.projectsLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.projectsView, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        
        self.view.layoutIfNeeded()
        UIView.animateKeyframesWithDuration(0.8, delay: 0.8, options: .AllowUserInteraction, animations: { () -> Void in
                NSLayoutConstraint.deactivateConstraints(projectsConBefore)
                NSLayoutConstraint.activateConstraints(self.projectsConAfter)
                self.view.sendSubviewToBack(self.projectsView)
                self.view.layoutIfNeeded()
            }, completion: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(RAIntroductionViewController.projectsTap))
        self.projectsView.addGestureRecognizer(tapGesture)
    }
    
    func addEducation() {
        self.educationView.layer.cornerRadius = 50
        self.educationView.clipsToBounds = true
        //self.educationView.backgroundColor = UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1.0)
        self.educationView.backgroundColor = UIColor(red: 192/255, green: 57/255, blue: 43/255, alpha: 1.0)
        self.view.addSubview(self.educationView)
        
        self.educationView.translatesAutoresizingMaskIntoConstraints = false
        let educationConBefore = [NSLayoutConstraint(item: self.educationView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.educationView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.educationView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.educationView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.01, constant: -60.0)]
        self.view.addConstraints(educationConBefore)
        
        if self.view.frame.size.height == 568 {
            self.educationView.layer.cornerRadius = 45
            self.view.addConstraint(NSLayoutConstraint(item: self.educationView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 90))
            self.view.addConstraint(NSLayoutConstraint(item: self.educationView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 90))
            
            self.educationConAfter = [NSLayoutConstraint(item: self.educationView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 90), NSLayoutConstraint(item: self.educationView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 90), NSLayoutConstraint(item: self.educationView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.educationView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0)]
        } else {
            self.educationConAfter = [NSLayoutConstraint(item: self.educationView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.educationView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.educationView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.educationView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0)]
        }
        
        self.educationLabel.text = "Education"
        self.educationLabel.textColor = UIColor.whiteColor()
        self.educationLabel.font = UIFont(name: "SFUIText-Light", size: 17)
        self.educationLabel.textAlignment = .Center
        self.educationView.addSubview(self.educationLabel)
        
        self.educationLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.educationLabel, attribute: .Width, relatedBy: .Equal, toItem: self.educationView, attribute: .Width, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.educationLabel, attribute: .Height, relatedBy: .Equal, toItem: self.educationView, attribute: .Height, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.educationLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.educationView, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.educationLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.educationView, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        
        self.view.layoutIfNeeded()
        UIView.animateKeyframesWithDuration(0.8, delay: 1.6, options: .AllowUserInteraction, animations: { () -> Void in
                NSLayoutConstraint.deactivateConstraints(educationConBefore)
                NSLayoutConstraint.activateConstraints(self.educationConAfter)
                self.view.sendSubviewToBack(self.educationView)
                self.view.layoutIfNeeded()
            }, completion: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(RAIntroductionViewController.educationTap))
        self.educationView.addGestureRecognizer(tapGesture)
    }
    
    func addSkills() {
        self.skillsView.layer.cornerRadius = 50
        self.skillsView.clipsToBounds = true
        //self.skillsView.backgroundColor = UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1.0)
        self.skillsView.backgroundColor = UIColor(red: 192/255, green: 57/255, blue: 43/255, alpha: 1.0)
        self.view.addSubview(self.skillsView)
        
        self.skillsView.translatesAutoresizingMaskIntoConstraints = false
        let skillsConBefore = [NSLayoutConstraint(item: self.skillsView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.skillsView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.skillsView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.skillsView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.01, constant: -60.0)]
        self.view.addConstraints(skillsConBefore)
        
        if self.view.frame.size.height == 568 {
            self.skillsView.layer.cornerRadius = 45
            self.view.addConstraint(NSLayoutConstraint(item: self.skillsView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 90))
            self.view.addConstraint(NSLayoutConstraint(item: self.skillsView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 90))
            
            self.skillsConAfter = [NSLayoutConstraint(item: self.skillsView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 90), NSLayoutConstraint(item: self.skillsView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 90), NSLayoutConstraint(item: self.skillsView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.skillsView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0)]
        } else {
            self.skillsConAfter = [NSLayoutConstraint(item: self.skillsView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.skillsView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.skillsView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.skillsView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0)]
        }
        
        self.skillsLabel.text = "Skills"
        self.skillsLabel.textColor = UIColor.whiteColor()
        self.skillsLabel.font = UIFont(name: "SFUIText-Light", size: 17)
        self.skillsLabel.textAlignment = .Center
        self.skillsView.addSubview(self.skillsLabel)
        
        self.skillsLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.skillsLabel, attribute: .Width, relatedBy: .Equal, toItem: self.skillsView, attribute: .Width, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.skillsLabel, attribute: .Height, relatedBy: .Equal, toItem: self.skillsView, attribute: .Height, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.skillsLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.skillsView, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.skillsLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.skillsView, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        
        self.view.layoutIfNeeded()
        UIView.animateKeyframesWithDuration(0.8, delay: 2.4, options: .AllowUserInteraction, animations: { () -> Void in
                NSLayoutConstraint.deactivateConstraints(skillsConBefore)
                NSLayoutConstraint.activateConstraints(self.skillsConAfter)
                self.view.sendSubviewToBack(self.skillsView)
                self.view.layoutIfNeeded()
            }, completion: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(RAIntroductionViewController.skillsTap))
        self.skillsView.addGestureRecognizer(tapGesture)
    }
    
    func addInterests() {
        self.interestView.layer.cornerRadius = 50
        self.interestView.clipsToBounds = true
        self.interestView.backgroundColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        self.view.addSubview(self.interestView)
        
        self.interestView.translatesAutoresizingMaskIntoConstraints = false
        let interestsConBefore = [NSLayoutConstraint(item: self.interestView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.interestView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.interestView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.interestView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.01, constant: -60.0)]
        self.view.addConstraints(interestsConBefore)
        
        if self.view.frame.size.height == 568 {
            self.interestView.layer.cornerRadius = 45
            self.view.addConstraint(NSLayoutConstraint(item: self.interestView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 90))
            self.view.addConstraint(NSLayoutConstraint(item: self.interestView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 90))
            
            self.interestsConAfter = [NSLayoutConstraint(item: self.interestView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 90), NSLayoutConstraint(item: self.interestView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 90), NSLayoutConstraint(item: self.interestView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.interestView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0)]
        } else {
            self.interestsConAfter = [NSLayoutConstraint(item: self.interestView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.interestView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.interestView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.interestView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0)]
        }
        
        self.interestsLabel.text = "Interests"
        self.interestsLabel.textColor = UIColor.whiteColor()
        self.interestsLabel.font = UIFont(name: "SFUIText-Light", size: 17)
        self.interestsLabel.textAlignment = .Center
        self.interestView.addSubview(self.interestsLabel)
        
        self.interestsLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.interestsLabel, attribute: .Width, relatedBy: .Equal, toItem: self.interestView, attribute: .Width, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.interestsLabel, attribute: .Height, relatedBy: .Equal, toItem: self.interestView, attribute: .Height, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.interestsLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.interestView, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.interestsLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.interestView, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        
        self.view.layoutIfNeeded()
        UIView.animateKeyframesWithDuration(0.8, delay: 3.2, options: .AllowUserInteraction, animations: { () -> Void in
                NSLayoutConstraint.deactivateConstraints(interestsConBefore)
                NSLayoutConstraint.activateConstraints(self.interestsConAfter)
                self.view.sendSubviewToBack(self.interestView)
                self.view.layoutIfNeeded()
            }, completion: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(RAIntroductionViewController.interestTap))
        self.interestView.addGestureRecognizer(tapGesture)
    }
    
    func addHonors() {
        self.honorsView.layer.cornerRadius = 50
        self.honorsView.clipsToBounds = true
        self.honorsView.backgroundColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        self.view.addSubview(self.honorsView)
        
        self.honorsView.translatesAutoresizingMaskIntoConstraints = false
        let honorsConBefore = [NSLayoutConstraint(item: self.honorsView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.honorsView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.honorsView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.honorsView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.01, constant: -60.0)]
        self.view.addConstraints(honorsConBefore)
        
        if self.view.frame.size.height == 568 {
            self.honorsView.layer.cornerRadius = 45
            self.view.addConstraint(NSLayoutConstraint(item: self.honorsView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 90))
            self.view.addConstraint(NSLayoutConstraint(item: self.honorsView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 90))
            
            self.honorsConAfter = [NSLayoutConstraint(item: self.honorsView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 90), NSLayoutConstraint(item: self.honorsView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 90), NSLayoutConstraint(item: self.honorsView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.honorsView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0)]
        } else {
            self.honorsConAfter = [NSLayoutConstraint(item: self.honorsView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.honorsView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.honorsView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.honorsView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0)]
        }
        
        self.honorsLabel.text = "Honors"
        self.honorsLabel.textColor = UIColor.whiteColor()
        self.honorsLabel.font = UIFont(name: "SFUIText-Light", size: 17)
        self.honorsLabel.textAlignment = .Center
        self.honorsView.addSubview(self.honorsLabel)
        
        self.honorsLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.honorsLabel, attribute: .Width, relatedBy: .Equal, toItem: self.honorsView, attribute: .Width, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.honorsLabel, attribute: .Height, relatedBy: .Equal, toItem: self.honorsView, attribute: .Height, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.honorsLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.honorsView, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.honorsLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.honorsView, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        
        self.view.layoutIfNeeded()
        UIView.animateKeyframesWithDuration(0.8, delay: 4, options: .AllowUserInteraction, animations: { () -> Void in
                NSLayoutConstraint.deactivateConstraints(honorsConBefore)
                NSLayoutConstraint.activateConstraints(self.honorsConAfter)
                self.view.sendSubviewToBack(self.honorsView)
                self.view.layoutIfNeeded()
            }, completion: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(RAIntroductionViewController.honorsTap))
        self.honorsView.addGestureRecognizer(tapGesture)
    }
    
    func addWhy() {
        why.userInteractionEnabled = false
        why.text = "Why WWDC?"
        why.font = UIFont(name: "SFUIText-Light", size: 18)
        why.textAlignment = .Center
        why.textColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        self.shimmer.contentView = why
        self.shimmer.shimmeringSpeed = 175
        self.shimmer.shimmeringPauseDuration = 0
        self.shimmer.shimmeringAnimationOpacity = 0.25
        self.shimmer.shimmeringOpacity = 1.0
        self.shimmer.shimmeringDirection = .Right
        self.shimmer.alpha = 0.0
        self.shimmer.userInteractionEnabled = true
        self.view.addSubview(shimmer)
        
        shimmer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: shimmer, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: shimmer, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.1, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: shimmer, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: shimmer, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.9, constant: 0.0))
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(RAIntroductionViewController.whyPressed(_:)))
        shimmer.addGestureRecognizer(tap)
    }
    
    
    func whyPressed(sender: UITapGestureRecognizer) {
        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: .Default)
        self.navigationController?.pushViewController(RAWhyViewController(), animated: true)
    }
    
    func lastAnim() {
        let aboutMeConNew = [NSLayoutConstraint(item: self.aboutMeView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.aboutMeView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.aboutMeView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 0.35, constant: 0.0), NSLayoutConstraint(item: self.aboutMeView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.5, constant: 0.0)]
        
        self.view.layoutIfNeeded()
        UIView.animateKeyframesWithDuration(1, delay: /*4.5*/4.8, options: .AllowUserInteraction, animations: { () -> Void in
            NSLayoutConstraint.deactivateConstraints(self.aboutMeConAfter)
            NSLayoutConstraint.activateConstraints(aboutMeConNew)
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        let projectsConNew = [NSLayoutConstraint(item: self.projectsView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.projectsView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.projectsView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.65, constant: 0.0), NSLayoutConstraint(item: self.projectsView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.5, constant: 0.0)]
        
        UIView.animateKeyframesWithDuration(1, delay: 4.8/*7*/, options: .AllowUserInteraction, animations: { () -> Void in
            NSLayoutConstraint.deactivateConstraints(self.projectsConAfter)
            NSLayoutConstraint.activateConstraints(projectsConNew)
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        let educationConNew = [NSLayoutConstraint(item: self.educationView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.educationView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.educationView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 0.35, constant: 0.0), NSLayoutConstraint(item: self.educationView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0.0)]
        
        UIView.animateKeyframesWithDuration(0.75, delay: 4.8/*8*/, options: .AllowUserInteraction, animations: { () -> Void in
            NSLayoutConstraint.deactivateConstraints(self.educationConAfter)
            NSLayoutConstraint.activateConstraints(educationConNew)
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        let skillsConNew = [NSLayoutConstraint(item: self.skillsView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.skillsView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.skillsView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.65, constant: 0.0), NSLayoutConstraint(item: self.skillsView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0.0)]
        
        UIView.animateKeyframesWithDuration(0.75, delay: 4.8/*8.75*/, options: .AllowUserInteraction, animations: { () -> Void in
            NSLayoutConstraint.deactivateConstraints(self.skillsConAfter)
            NSLayoutConstraint.activateConstraints(skillsConNew)
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        let interestsConNew = [NSLayoutConstraint(item: self.interestView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.interestView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.interestView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 0.35, constant: 0.0), NSLayoutConstraint(item: self.interestView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.5, constant: 0.0)]
        
        UIView.animateKeyframesWithDuration(1, delay: 4.8/*9.5*/, options: .AllowUserInteraction, animations: { () -> Void in
            NSLayoutConstraint.deactivateConstraints(self.interestsConAfter)
            NSLayoutConstraint.activateConstraints(interestsConNew)
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        let honorsConNew = [NSLayoutConstraint(item: self.honorsView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.honorsView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.honorsView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.65, constant: 0.0), NSLayoutConstraint(item: self.honorsView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.5, constant: 0.0)]
        
        UIView.animateKeyframesWithDuration(1, delay: 4.8/*10.5*/, options: .AllowUserInteraction, animations: { () -> Void in
            NSLayoutConstraint.deactivateConstraints(self.honorsConAfter)
            NSLayoutConstraint.activateConstraints(honorsConNew)
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        
        UIView.animateKeyframesWithDuration(0.8, delay: 5.5, options: .AllowUserInteraction, animations: { () -> Void in
            self.shimmer.alpha = 1.0
            self.shimmer.shimmering = true
            self.why.userInteractionEnabled = true
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    //MARK: Tap Gestures
    func aboutMeTap() {
        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: .Default)
        self.navigationController?.pushViewController(RAAboutMeViewController(), animated: true)
    }
    
    func projectsTap() {
        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: .Default)
        self.navigationController?.pushViewController(RAProjectsViewController(), animated: true)
    }
    
    func educationTap() {
        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: .Default)
        self.navigationController?.pushViewController(RAEducationViewController(), animated: true)
    }
    
    func skillsTap() {
        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: .Default)
        self.navigationController?.pushViewController(RASkillsViewController(), animated: true)
    }
    
    func interestTap() {
        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: .Default)
        self.navigationController?.pushViewController(RAInterestViewController(), animated: true)
    }
    
    func honorsTap() {
        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: .Default)
        self.navigationController?.pushViewController(RAHonorsViewController(), animated: true)
    }
    
    func some() {
        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: .Default)
        self.navigationController?.pushViewController(RAAboutMeViewController(), animated: true)
    }

}

public enum Shortcut: String {
    case aboutMe = "AboutMe"
    case education = "Education"
    case projects = "Projects"
    case why = "WhyWWDC"
}

extension RAIntroductionViewController: UIViewControllerPreviewingDelegate {
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        var viewController = UIViewController()
        
        if previewingContext.sourceView == self.aboutMeView {
            viewController = RAAboutMeViewController()
        } else if previewingContext.sourceView == self.projectsView {
            viewController = RAProjectsViewController()
        } else if previewingContext.sourceView == self.educationView {
            viewController = RAEducationViewController()
        } else if previewingContext.sourceView == self.skillsView {
            viewController = RASkillsViewController()
        } else if previewingContext.sourceView == self.interestView {
            viewController = RAInterestViewController()
        } else if previewingContext.sourceView == self.honorsView {
            viewController = RAHonorsViewController()
        } else {
            viewController = RAWhyViewController()
        }
        
        //viewController.preferredContentSize = CGSize(width: 0, height: 0)
        return viewController
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        
        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: .Default)
        
        if previewingContext.sourceView == self.aboutMeView {
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
            self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        } else if previewingContext.sourceView == self.projectsView {
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
            self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        } else if previewingContext.sourceView == self.educationView {
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
            self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
            RAEducationViewController().view.setNeedsDisplay()
        } else if previewingContext.sourceView == self.skillsView {
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 192/255, green: 57/255, blue: 43/255, alpha: 1.0)
            self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        } else if previewingContext.sourceView == self.interestView {
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
            self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        } else if previewingContext.sourceView == self.honorsView {
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
            self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        } else {
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
            self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        }
        
        
        showViewController(viewControllerToCommit, sender: self)
    }
}
