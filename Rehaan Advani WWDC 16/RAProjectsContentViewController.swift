//
//  RAProjectsContentViewController.swift
//  Rehaan Advani WWDC 16
//
//  Created by Rehaan Advani on 3/11/16.
//  Copyright © 2016 Rehaan Advani. All rights reserved.
//

import UIKit
import Agrume

class RAProjectsContentViewController: UIViewController {
    var imageView = UIImageView()
    var imageFile = UIImage()
    var titleText = String()
    var pageIndex = Int()
    var currentPage = 0
    var label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addLabel()
        self.addImageView()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addLabel() {
        self.label.text = self.titleText
        self.label.font = UIFont(name: "SFUIDisplay-Bold", size: 20)
        self.label.textAlignment = .Center
        self.label.numberOfLines = 0
        self.label.textColor = UIColor.whiteColor()
        self.view.addSubview(self.label)

        
        self.label.translatesAutoresizingMaskIntoConstraints = false
        
        if self.view.frame.size.height == 568 {
            self.label.font = UIFont(name: "SFUIDisplay-Bold", size: 18)
            
            self.view.addConstraint(NSLayoutConstraint(item: label, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: label, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: label, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.2, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: label, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.33, constant: 0.0))
        } else {
            self.view.addConstraint(NSLayoutConstraint(item: label, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: label, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: label, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.2, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: label, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.3, constant: 0.0))
        }
    }
    
    func addImageView() {
        self.imageView.userInteractionEnabled = true
        self.imageView.image = imageFile
        self.imageView.contentMode = .ScaleAspectFit
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(_:)))
        self.imageView.addGestureRecognizer(tap)
        self.view.addSubview(self.imageView)
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        
        if self.view.frame.size.height == 568 {
            self.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.67, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.58, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.17, constant: 0.0))
        } else if self.view.frame.size.height == 736 {
            self.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.67, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.565, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.158, constant: 0.0))
        } else {
            self.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.67, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.57, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.163, constant: 0.0))
        }
        
    }
    
    func imageTapped(sender: UITapGestureRecognizer) {
        let agrume = Agrume(image: self.imageView.image!)
        agrume.showFrom(self)
    }

}
