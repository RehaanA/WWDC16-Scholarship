//
//  RAAboutMeViewController.swift
//  Rehaan Advani WWDC 16
//
//  Created by Rehaan Advani on 1/15/16.
//  Copyright © 2016 Rehaan Advani. All rights reserved.
//

import UIKit
import Shimmer
import Agrume


class RAAboutMeViewController: UIViewController {
    
    //MARK: Properties
    let profileImage = UIImageView()
    let introLabel = UILabel()
    var shimmeringView = FBShimmeringView()
    
    var profileConAfter = [NSLayoutConstraint]()
    var introConAfter = [NSLayoutConstraint]()
    var shimmerConBefore = [NSLayoutConstraint]()
    
    var twitter = UIImageView()
    var facebook = UIImageView()
    var linkedin = UIImageView()
    var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if traitCollection.forceTouchCapability == .Available {
            self.registerForPreviewingWithDelegate(self, sourceView: self.linkedin)
            self.registerForPreviewingWithDelegate(self, sourceView: self.twitter)
            self.registerForPreviewingWithDelegate(self, sourceView: self.facebook)
            self.registerForPreviewingWithDelegate(self, sourceView: self.introLabel)

        }
        
        self.navBar()
        self.addIntroLabel()
        self.addImageView()
        self.addShimmeringView()
        self.addPanGesture()
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        self.title = "About Me"
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
        
    }
    
    func locationTapped() {
        self.presentViewController(UINavigationController(rootViewController: RAMapViewController()), animated: true, completion: nil)
    }
    
    
    func addIntroLabel() {
        let attributedText = NSMutableAttributedString(string: "Hi, My name is Rehaan Advani. I am a 15 year old iOS developer who lives in Palo Alto, CA.")
        let myRange = NSRange(location: 75, length: 15)
        attributedText.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0), range: myRange)
        attributedText.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.StyleSingle.rawValue, range: myRange)
        attributedText.addAttribute(NSUnderlineColorAttributeName, value: UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0), range: myRange)
        self.introLabel.attributedText = attributedText
        let tap = UITapGestureRecognizer(target: self, action: #selector(RAAboutMeViewController.locationTapped))
        self.introLabel.addGestureRecognizer(tap)
        self.introLabel.userInteractionEnabled = true
        self.introLabel.font = UIFont(name: "SFUIText-Light", size: 25)
        self.introLabel.numberOfLines = 0
        self.introLabel.textAlignment = .Center
        self.view.addSubview(self.introLabel)
        
        if self.view.frame.size.height == 568 {
            self.introLabel.font = UIFont(name: "SFUIText-Light", size: 23)

        } else if self.view.frame.size.height == 736 {
            self.introLabel.font = UIFont(name: "SFUIText-Light", size: 25)
        }
        
        self.introLabel.translatesAutoresizingMaskIntoConstraints = false
        let introConBefore = [NSLayoutConstraint(item: self.introLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.82, constant: 0.0), NSLayoutConstraint(item: self.introLabel, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.4, constant: 1.0), NSLayoutConstraint(item: self.introLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.introLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.001, constant: 0.0)]
        self.view.addConstraints(introConBefore)
        
        introConAfter = [NSLayoutConstraint(item: self.introLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.82, constant: 0.0), NSLayoutConstraint(item: self.introLabel, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.4, constant: 1.0), NSLayoutConstraint(item: self.introLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.introLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.1, constant: 0.0)]
        
        self.view.layoutIfNeeded()
        UIView.animateWithDuration(3) { () -> Void in
            NSLayoutConstraint.deactivateConstraints(introConBefore)
            NSLayoutConstraint.activateConstraints(self.introConAfter)
            self.view.layoutIfNeeded()
        }
    }
    
    func profileTapped(sender: UITapGestureRecognizer) {
        if let image = UIImage(named: "IMG_4529.JPG") {
            let agrume = Agrume(image: image)
            agrume.showFrom(self)
        }
    }
    
    func addImageView() {
        self.profileImage.userInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.profileTapped(_:)))
        self.profileImage.addGestureRecognizer(tap)
        self.profileImage.image = UIImage(named: "IMG_4529.JPG")
        self.profileImage.clipsToBounds = true
        self.profileImage.layer.cornerRadius = 75
        self.profileImage.layer.borderWidth = 3
        self.profileImage.layer.borderColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0).CGColor
        self.profileImage.alpha = 0.0
        self.view.addSubview(self.profileImage)
        
        self.profileImage.translatesAutoresizingMaskIntoConstraints = false
        let profileConBefore = [NSLayoutConstraint(item: self.profileImage, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 150), NSLayoutConstraint(item: self.profileImage, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 150), NSLayoutConstraint(item: self.profileImage, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.profileImage, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.00000000001, constant: 0.0)]
        self.view.addConstraints(profileConBefore)
        
        if self.view.frame.size.height == 568 {
            self.profileImage.layer.cornerRadius = 65
            self.view.addConstraint(NSLayoutConstraint(item: self.profileImage, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 130))
            self.view.addConstraint(NSLayoutConstraint(item: self.profileImage, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 130))
            
            profileConAfter = [NSLayoutConstraint(item: self.profileImage, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 130), NSLayoutConstraint(item: self.profileImage, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 130), NSLayoutConstraint(item: self.profileImage, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.profileImage, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.5, constant: 0.0)]
        } else if self.view.frame.size.height == 736 {
            self.profileImage.layer.cornerRadius = 80
            
            profileConAfter = [NSLayoutConstraint(item: self.profileImage, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 160), NSLayoutConstraint(item: self.profileImage, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 160), NSLayoutConstraint(item: self.profileImage, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.profileImage, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.5, constant: 0.0)]

        } else {
            profileConAfter = [NSLayoutConstraint(item: self.profileImage, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 150), NSLayoutConstraint(item: self.profileImage, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 150), NSLayoutConstraint(item: self.profileImage, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.profileImage, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.5, constant: 0.0)]
        }
        
        self.view.layoutIfNeeded()
        UIView.animateKeyframesWithDuration(1.5, delay: 1.5, options: .AllowUserInteraction, animations: { () -> Void in
            NSLayoutConstraint.deactivateConstraints(profileConBefore)
            NSLayoutConstraint.activateConstraints(self.profileConAfter)
            self.profileImage.alpha = 1.0
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func addShimmeringView() {
        self.shimmeringView.shimmeringSpeed = 175
        self.shimmeringView.shimmeringPauseDuration = 0
        self.shimmeringView.shimmeringAnimationOpacity = 0.25
        self.shimmeringView.shimmeringOpacity = 1.0
        self.shimmeringView.shimmeringDirection = FBShimmerDirection.Right
        self.shimmeringView.alpha = 0.0
        self.view.addSubview(self.shimmeringView)
        
        let slideLabel = UILabel()
        slideLabel.text = "> Slide To View More Information"
        slideLabel.textAlignment = .Center
        slideLabel.font = UIFont(name: "SFUIText-Light", size: 18)
        self.shimmeringView.contentView = slideLabel
        
        self.shimmeringView.translatesAutoresizingMaskIntoConstraints = false
        shimmerConBefore = [NSLayoutConstraint(item: self.shimmeringView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.shimmeringView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.2, constant: 0.0), NSLayoutConstraint(item: self.shimmeringView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.shimmeringView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.75, constant: 0.0)]
        self.view.addConstraints(shimmerConBefore)
        
        self.view.layoutIfNeeded()
        UIView.animateKeyframesWithDuration(1, delay: 3, options: .AllowUserInteraction, animations: { () -> Void in
            self.shimmeringView.alpha = 1.0
            self.shimmeringView.shimmering = true
            self.shimmeringView.shimmeringSpeed = 200
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func addPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(RAAboutMeViewController.pan(_:)))
        self.view.addGestureRecognizer(panGesture)
    }
    
    func pan(sender: UIPanGestureRecognizer) {
        if sender.state == UIGestureRecognizerState.Changed {
            let newConstraints = [NSLayoutConstraint(item: self.profileImage, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 150), NSLayoutConstraint(item: self.profileImage, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 150), NSLayoutConstraint(item: self.profileImage, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 3, constant: 0.0), NSLayoutConstraint(item: self.profileImage, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.5, constant: 0.0)]
            let newConstraints2 = [NSLayoutConstraint(item: self.introLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.82, constant: 0.0), NSLayoutConstraint(item: self.introLabel, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.4, constant: 1.0), NSLayoutConstraint(item: self.introLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 3, constant: 0.0), NSLayoutConstraint(item: self.introLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.1, constant: 0.0)]
            let newConstraints3 = [NSLayoutConstraint(item: self.shimmeringView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.shimmeringView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.2, constant: 0.0), NSLayoutConstraint(item: self.shimmeringView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 3, constant: 0.0), NSLayoutConstraint(item: self.shimmeringView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.75, constant: 0.0)]
            
            
            self.view.layoutIfNeeded()
            UIView.animateWithDuration(1, animations: { () -> Void in
                NSLayoutConstraint.deactivateConstraints(self.profileConAfter)
                NSLayoutConstraint.activateConstraints(newConstraints)
                NSLayoutConstraint.deactivateConstraints(self.introConAfter)
                NSLayoutConstraint.activateConstraints(newConstraints2)
                NSLayoutConstraint.deactivateConstraints(self.shimmerConBefore)
                NSLayoutConstraint.activateConstraints(newConstraints3)
                self.addLinks()
                self.view.layoutIfNeeded()
            })
            
        }
    }
    
    func addLinks() {
        for recognizer in self.view.gestureRecognizers ?? [] {
            self.view.removeGestureRecognizer(recognizer)
        }
        
        self.label.text = "Find out more about me: "
        self.label.font = UIFont(name: "SFUIText-Light", size: 25)
        self.label.numberOfLines = 0
        self.label.textAlignment = .Center
        self.label.alpha = 0.0
        self.view.addSubview(self.label)
        
        if self.view.frame.size.height == 568 {
            self.label.font = UIFont(name: "SFUIText-Light", size: 23)
        }
        
        self.label.translatesAutoresizingMaskIntoConstraints = false
        let con = [NSLayoutConstraint(item: self.label, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.85, constant: 0.0), NSLayoutConstraint(item: self.label, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.label, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.6, constant: 0.0)]
        
        self.linkedin.image = UIImage(named: "LinkedIn.png")
        self.linkedin.contentMode = UIViewContentMode.ScaleAspectFit
        self.linkedin.alpha = 0.0
        let tap = UITapGestureRecognizer(target: self, action: #selector(RAAboutMeViewController.linkedinTapped(_:)))
        self.linkedin.addGestureRecognizer(tap)
        self.linkedin.userInteractionEnabled = true
        self.view.addSubview(linkedin)
        
        self.linkedin.translatesAutoresizingMaskIntoConstraints = false
        let con2 = [NSLayoutConstraint(item: self.linkedin, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 90), NSLayoutConstraint(item: self.linkedin, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 90), NSLayoutConstraint(item: self.linkedin, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.linkedin, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.9, constant: 0.0)]
        
        self.facebook.image = UIImage(named: "Facebook.png")
        self.facebook.contentMode = .ScaleAspectFit
        self.facebook.alpha = 0.0
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(RAAboutMeViewController.facebookTapped(_:)))
        self.facebook.addGestureRecognizer(tap2)
        self.facebook.userInteractionEnabled = true
        self.view.addSubview(facebook)
        
        self.facebook.translatesAutoresizingMaskIntoConstraints = false
        let con3 = [NSLayoutConstraint(item: self.facebook, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 90), NSLayoutConstraint(item: self.facebook, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 90), NSLayoutConstraint(item: self.facebook, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.facebook, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.2, constant: 0.0)]
        
        self.twitter.image = UIImage(named: "Twitter.png")
        self.twitter.contentMode = .ScaleAspectFit
        self.twitter.alpha = 0.0
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(RAAboutMeViewController.twitterTapped(_:)))
        self.twitter.addGestureRecognizer(tap3)
        self.twitter.userInteractionEnabled = true
        self.view.addSubview(twitter)
        
        self.twitter.translatesAutoresizingMaskIntoConstraints = false
        let con4 = [NSLayoutConstraint(item: self.twitter, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 90), NSLayoutConstraint(item: self.twitter, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 90), NSLayoutConstraint(item: self.twitter, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.twitter, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.5, constant: 0.0)]
        
        self.view.layoutIfNeeded()
        UIView.animateKeyframesWithDuration(0.5, delay: 1, options: .AllowUserInteraction, animations: { () -> Void in
            NSLayoutConstraint.activateConstraints(con)
            self.label.alpha = 1.0
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        self.view.layoutIfNeeded()
        UIView.animateKeyframesWithDuration(0.5, delay: 1.5, options: .AllowUserInteraction, animations: { () -> Void in
            NSLayoutConstraint.activateConstraints(con2)
            self.linkedin.alpha = 1.0
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        self.view.layoutIfNeeded()
        UIView.animateKeyframesWithDuration(0.5, delay: 2, options: .AllowUserInteraction, animations: { () -> Void in
            NSLayoutConstraint.activateConstraints(con3)
            self.facebook.alpha = 1.0
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animateKeyframesWithDuration(0.5, delay: 2.5, options: .AllowUserInteraction, animations: { () -> Void in
            NSLayoutConstraint.activateConstraints(con4)
            self.twitter.alpha = 1.0
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func linkedinTapped(sender: UITapGestureRecognizer) {
        let webView = RAWebViewController()
        webView.type = "LinkedIn"
        self.presentViewController(UINavigationController(rootViewController: webView), animated: true, completion: nil)
    }
    
    func facebookTapped(sender: UITapGestureRecognizer) {
        let webView = RAWebViewController()
        webView.type = "Facebook"
        self.presentViewController(UINavigationController(rootViewController: webView), animated: true, completion: nil)
    }
    
    func twitterTapped(sender: UITapGestureRecognizer) {
        let webView = RAWebViewController()
        webView.type = "Twitter"
        self.presentViewController(UINavigationController(rootViewController: webView), animated: true, completion: nil)
    }
}

extension RAAboutMeViewController: UIViewControllerPreviewingDelegate {
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        let viewController = RAWebViewController()
        
        if previewingContext.sourceView == self.linkedin {
            viewController.type = "LinkedIn"
        } else if previewingContext.sourceView == self.facebook {
            viewController.type = "Facebook"
        } else if previewingContext.sourceView == self.twitter {
            viewController.type = "Twitter"
        } else {
            let vc = RAMapViewController()
            
            vc.navigationController?.navigationBar.barStyle = .Black
            vc.navigationController?.navigationBar.barTintColor = UIColor(red: 192/255, green: 57/255, blue: 43/255, alpha: 1.0)
            vc.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
            let navTitleFont = UIFont(name: "SFUIText-Light", size: 20)
            vc.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: navTitleFont!]
            
            return vc
        }
        
        //viewController.preferredContentSize = CGSize(width: 0, height: 0)
        
        viewController.navigationController?.navigationBar.barStyle = .Black
        viewController.navigationController?.navigationBar.barTintColor = UIColor(red: 192/255, green: 57/255, blue: 43/255, alpha: 1.0)
        viewController.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        let navTitleFont = UIFont(name: "SFUIText-Light", size: 20)
        viewController.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: navTitleFont!]
        return viewController
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        
        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: .Default)
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 192/255, green: 57/255, blue: 43/255, alpha: 1.0)

        
        self.presentViewController(UINavigationController(rootViewController: viewControllerToCommit), animated: true, completion: nil)
    }

}
