//
//  RAHonorsDetailViewController.swift
//  Rehaan Advani WWDC 16
//
//  Created by Rehaan Advani on 4/4/16.
//  Copyright © 2016 Rehaan Advani. All rights reserved.
//

import UIKit
import Agrume

class RAHonorsDetailViewController: UIViewController {
    
    var pageIndex = Int()
    var logoImage = UIImageView()
    var desc = UILabel()
    var image = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addLogo()
        self.addDesc()
        
        self.view.backgroundColor = UIColor.whiteColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imageTapped(sender: UITapGestureRecognizer) {
        let agrume = Agrume(image: self.logoImage.image!)
        agrume.showFrom(self)
    }
    
    func addLogo() {
        self.logoImage.alpha = 0
        self.logoImage.userInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(_:)))
        self.logoImage.addGestureRecognizer(tap)
        if self.logoImage.image == UIImage(named: "hiq2.png") {
            self.logoImage.contentMode = .ScaleAspectFit
            self.view.addSubview(self.logoImage)
            
            self.logoImage.translatesAutoresizingMaskIntoConstraints = false
            self.view.addConstraint(NSLayoutConstraint(item: logoImage, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.75, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: logoImage, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.3, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: logoImage, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: logoImage, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 0.6, constant: 0.0))
        } else if self.logoImage.image == UIImage(named: "twitterLogo.png") {
            self.logoImage.contentMode = .ScaleAspectFill
            self.view.addSubview(self.logoImage)
            
            self.logoImage.translatesAutoresizingMaskIntoConstraints = false
            self.view.addConstraint(NSLayoutConstraint(item: logoImage, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.75, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: logoImage, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.3, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: logoImage, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: logoImage, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 0.6, constant: 0.0))
        } else if self.logoImage.image == UIImage(named: "elevate.jpeg") {
            self.logoImage.clipsToBounds = true
            self.logoImage.layer.cornerRadius = 20
            self.view.addSubview(self.logoImage)
            
            logoImage.translatesAutoresizingMaskIntoConstraints = false
            view.addConstraint(NSLayoutConstraint(item: logoImage, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.9, constant: 0.0))
            view.addConstraint(NSLayoutConstraint(item: logoImage, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.5, constant: 0.0))
            view.addConstraint(NSLayoutConstraint(item: logoImage, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
            view.addConstraint(NSLayoutConstraint(item: logoImage, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
            
        } else {
            self.logoImage.clipsToBounds = true
            self.logoImage.layer.cornerRadius = 20
            self.view.addSubview(self.logoImage)
            
            logoImage.translatesAutoresizingMaskIntoConstraints = false
            view.addConstraint(NSLayoutConstraint(item: logoImage, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.9, constant: 0.0))
            view.addConstraint(NSLayoutConstraint(item: logoImage, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.5, constant: 0.0))
            view.addConstraint(NSLayoutConstraint(item: logoImage, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
            view.addConstraint(NSLayoutConstraint(item: logoImage, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        }
    
        
        UIView.animateWithDuration(0.75, delay: 0.15, options: .AllowUserInteraction, animations: {
            self.logoImage.alpha = 1
        }, completion: nil)
    }
    
    func addDesc() {
        desc.alpha = 0
        desc.numberOfLines = 0
        desc.font = UIFont(name: "SFUIText-Light", size: 18)
        desc.textAlignment = .Center
        view.addSubview(desc)
        
        if self.view.frame.size.height == 568 {
            self.desc.font = UIFont(name: "SFUIText-Light", size: 16)
        }
        
        desc.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraint(NSLayoutConstraint(item: desc, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.9, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: desc, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.5, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: desc, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: desc, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.35, constant: 0.0))
        
        UIView.animateWithDuration(0.75, delay: 0.8, options: .AllowUserInteraction, animations: {
            self.desc.alpha = 1
        }, completion: nil)
    }
}
