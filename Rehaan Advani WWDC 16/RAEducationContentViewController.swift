//
//  RAEducationContentViewController.swift
//  Rehaan Advani WWDC 16
//
//  Created by Rehaan Advani on 3/10/16.
//  Copyright © 2016 Rehaan Advani. All rights reserved.
//

import UIKit
import RQShineLabel

class RAEducationContentViewController: UIViewController {
    var imageArray = [UIImage(named: "paly1.JPG"), UIImage(named: "paly2.jpeg"), UIImage(named: "paly3.jpeg"), UIImage(named: "paly4.jpg")]
    var imageView = UIImageView()
    var imageFile = UIImage()
    var pageIndex = Int()
    var label = RQShineLabel()
    var labelText = String()
    var imageView2 = UIImageView()
    let darkBlur = UIBlurEffect(style: UIBlurEffectStyle.Dark)
    var blurView = UIVisualEffectView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addImageView()
        self.addImageView2()
        self.addLabel()

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
       if self.imageView.image == UIImage(named: "front.JPG") {
            self.blurView.removeFromSuperview()
            self.blurView = UIVisualEffectView(effect: darkBlur)
            blurView.frame = self.imageView.frame
            self.imageView.addSubview(blurView)
            self.label.shine()
            
            self.view.layoutIfNeeded()
            UIView.animateWithDuration(0.5, delay: 0.5, options: .AllowUserInteraction, animations: {
                self.label.alpha = 1
                self.imageView2.alpha = 0.0
                self.view.layoutIfNeeded()
                }, completion: nil)
        }
        self.blurView.removeFromSuperview()
        self.blurView = UIVisualEffectView(effect: darkBlur)
        blurView.frame = self.imageView.frame
        self.imageView.addSubview(blurView)
        self.label.shine()
        
        self.view.layoutIfNeeded()
        UIView.animateWithDuration(0.5, delay: 0.5, options: .AllowUserInteraction, animations: {
            self.label.alpha = 1
            self.imageView2.alpha = 0.0
            self.view.layoutIfNeeded()
            }, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    
    
    func addImageView() {
        self.imageView.image = imageFile
        //self.imageView.contentMode = .ScaleAspectFit
        self.view.addSubview(self.imageView)
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: /*0.5*/1.0, constant: 0.0))
        
    }
    
    func addImageView2() {
        self.imageView2.image = imageFile
        //self.imageView.contentMode = .ScaleAspectFit
        self.imageView2.bringSubviewToFront(self.imageView)
        self.imageView2.bringSubviewToFront(self.blurView)

        self.view.addSubview(self.imageView2)
        
        self.imageView2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: imageView2, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: imageView2, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: imageView2, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: imageView2, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: /*0.5*/1.0, constant: 0.0))
        
        
    }
    
    func addLabel() {
        self.label.shineDuration = 2
        self.label.text = self.labelText
        self.label.alpha = 0.0
        self.label.backgroundColor = UIColor.clearColor()
        //self.label.textColor = UIColor.blackColor()
        self.label.textColor = UIColor.whiteColor()
        self.label.font = UIFont(name: "SFUIText-Light", size: 20)
        self.label.textAlignment = .Center
        self.label.numberOfLines = 0
        self.label.bringSubviewToFront(self.imageView2)
        self.view.addSubview(self.label)
        
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: label, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.85, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: label, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: label, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.5, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: label, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        
        if self.view.frame.size.height == 568 {
            self.label.font = UIFont(name: "SFUIText-Light", size: 18)

        }
    }

}
