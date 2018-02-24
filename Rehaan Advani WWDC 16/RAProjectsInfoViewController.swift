//
//  RAProjectsInfoViewController.swift
//  Rehaan Advani WWDC 16
//
//  Created by Rehaan Advani on 3/11/16.
//  Copyright © 2016 Rehaan Advani. All rights reserved.
//

import UIKit
import Cosmos

class RAProjectsInfoViewController: UIViewController {
    var appName = String()
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    let items = ["details", "inspiration"]
    var segmentedControl = UISegmentedControl()
    let descTitle = UILabel()
    let desc = UILabel()
    var cosmosView = CosmosView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navBar()
        self.addUIElements()
        self.addDetails()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func navBar() {
        //self.navigationController?.navigationBar.barStyle = .Black
        //self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        //self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        var navTitleFont = UIFont(name: "SFUIText-Light", size: 20)
        
        if self.view.frame.size.height == 568 {
            navTitleFont = UIFont(name: "SFUIText-Light", size: 19)
        } else if self.view.frame.size.height == 736 {
            navTitleFont = UIFont(name: "SFUIText-Light", size: 21)
        }
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: navTitleFont!]
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let cancel = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(RAProjectsInfoViewController.cancel))
        if let font = UIFont(name: "SFUIText-Light", size: 17) {
            UIBarButtonItem.appearance().setTitleTextAttributes([NSFontAttributeName: font], forState: .Normal)
        }
        self.navigationItem.leftBarButtonItem = cancel
    }
    
    func cancel() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func addUIElements() {
        self.imageView.clipsToBounds = true
        self.imageView.layer.cornerRadius = 30
        self.view.addSubview(self.imageView)
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        
        if self.view.frame.size.height == 568 {
            self.view.addConstraint(NSLayoutConstraint(item: self.imageView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.35, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.imageView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.2, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.imageView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 0.45, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.imageView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.5, constant: 0.0))
        } else {
            self.view.addConstraint(NSLayoutConstraint(item: self.imageView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.35, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.imageView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.2, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.imageView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 0.45, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.imageView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.45, constant: 0.0))
        }
        
        self.titleLabel.text = self.appName
        self.titleLabel.font = UIFont(name: "SFUIDisplay-Bold", size: 20)
        self.titleLabel.textAlignment = .Left
        self.view.addSubview(self.titleLabel)
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        if self.view.frame.size.height == 568 {
            self.view.addConstraint(NSLayoutConstraint(item: self.titleLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.55, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.titleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.4, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.titleLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.35, constant: 0.0))
        } else {
            self.view.addConstraint(NSLayoutConstraint(item: self.titleLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.55, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.titleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.4, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.titleLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.3, constant: 0.0))
        }
        
        self.dateLabel.font = UIFont(name: "SFUIText-Light", size: 16)
        self.dateLabel.textAlignment = .Left
        self.dateLabel.numberOfLines = 0
        self.view.addSubview(self.dateLabel)
        
        self.dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        if self.view.frame.size.height == 568 {
            self.dateLabel.font = UIFont(name: "SFUIText-Light", size: 15)
            
            self.view.addConstraint(NSLayoutConstraint(item: self.dateLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.55, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.dateLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.4, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.dateLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.titleLabel, attribute: .CenterY, multiplier: 1.3, constant: 0.0))
        } else {
            self.view.addConstraint(NSLayoutConstraint(item: self.dateLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.55, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.dateLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.4, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.dateLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.titleLabel, attribute: .CenterY, multiplier: 1.3, constant: 0.0))
        }
        
        self.segmentedControl = UISegmentedControl(items: items)
        self.segmentedControl.selectedSegmentIndex = 0
        self.segmentedControl.setTitle("Details", forSegmentAtIndex: 0)
        self.segmentedControl.setTitle("Inspiration", forSegmentAtIndex: 1)
        self.segmentedControl.addTarget(self, action: #selector(RAProjectsInfoViewController.indexChanged(_:)), forControlEvents: .ValueChanged)
        self.segmentedControl.backgroundColor = UIColor.whiteColor()
        self.segmentedControl.tintColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        self.view.addSubview(self.segmentedControl)
        
        self.segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        if self.view.frame.size.height == 568 {
            
            self.view.addConstraint(NSLayoutConstraint(item: self.segmentedControl, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.87, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.segmentedControl, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.segmentedControl, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.85, constant: 0.0))
        } else {
            
            self.view.addConstraint(NSLayoutConstraint(item: self.segmentedControl, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.87, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.segmentedControl, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.segmentedControl, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.8, constant: 0.0))
        }
        
        self.cosmosView.userInteractionEnabled = false
        self.cosmosView.settings.starSize = 15
        self.cosmosView.settings.totalStars = 5
        self.cosmosView.settings.filledColor = UIColor.orangeColor()
        self.cosmosView.settings.emptyColor = UIColor.whiteColor()
        self.cosmosView.settings.filledBorderColor = UIColor.orangeColor()
        self.cosmosView.settings.emptyBorderColor = UIColor.orangeColor()
        self.cosmosView.settings.emptyBorderWidth = 1
        self.cosmosView.settings.filledBorderWidth = 1
        self.cosmosView.settings.fillMode = StarFillMode.Half
        self.view.addSubview(self.cosmosView)
        
        self.cosmosView.translatesAutoresizingMaskIntoConstraints = false
        
        if self.view.frame.size.height == 568 {
            self.view.addConstraint(NSLayoutConstraint(item: self.cosmosView, attribute: .Width, relatedBy: .Equal, toItem: self.dateLabel, attribute: .Width, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.cosmosView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.1, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.cosmosView, attribute: .CenterX, relatedBy: .Equal, toItem: self.dateLabel, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.cosmosView, attribute: .CenterY, relatedBy: .Equal, toItem: self.dateLabel, attribute: .CenterY, multiplier: 1.6, constant: 0.0))
        } else {
            self.view.addConstraint(NSLayoutConstraint(item: self.cosmosView, attribute: .Width, relatedBy: .Equal, toItem: self.dateLabel, attribute: .Width, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.cosmosView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.1, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.cosmosView, attribute: .CenterX, relatedBy: .Equal, toItem: self.dateLabel, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.cosmosView, attribute: .CenterY, relatedBy: .Equal, toItem: self.dateLabel, attribute: .CenterY, multiplier: 1.8, constant: 0.0))
        }
        
        
        if self.appName == "Performance+" {
            self.imageView.image = UIImage(named: "p+.png")
            self.dateLabel.text = "June 2015 - Present"
            self.cosmosView.rating = 4.5
        } else if self.appName == "WWDC 2015" {
            self.imageView.image = UIImage(named: "wwdc15.png")
            
            if self.view.frame.size.height == 568 {
                self.dateLabel.text = "February 2015 - \nApril 2015"
            } else {
                self.dateLabel.text = "February 2015 - April 2015"
            }
        
            self.imageView.layer.borderWidth = 1
            self.imageView.layer.borderColor = UIColor.blackColor().CGColor
            self.cosmosView.rating = 2.5
        }
    }
    
    func addDetails() {
        self.descTitle.text = "Description"
        self.descTitle.alpha = 1.0
        self.descTitle.font = UIFont(name: "SFUIDisplay-Bold", size: 20)
        self.descTitle.textAlignment = .Left
        self.view.addSubview(self.descTitle)
        
        self.descTitle.translatesAutoresizingMaskIntoConstraints = false
        
        if self.view.frame.size.height == 736 {
            self.descTitle.font = UIFont(name: "SFUIDisplay-Bold", size: 22)
        }
        
        if self.view.frame.size.height == 568 {
            
            self.view.addConstraint(NSLayoutConstraint(item: self.descTitle, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.85, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.descTitle, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.descTitle, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.05, constant: 0.0))
        } else {
            
            self.view.addConstraint(NSLayoutConstraint(item: self.descTitle, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.85, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.descTitle, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.descTitle, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        }
        
        if self.appName == "Performance+" {
            self.desc.text = "Performance+ is a performance management application. Its main function is to allow managers to set goals for their employees, as well as track their performance over time. Additionally, this is also a feedback centered application. An employee can easily log in and see their progress towards completing their goals, and how their manager is evaluating them."
        } else if self.appName == "WWDC 2015" {
             self.desc.text = "Last year, I applied to WWDC with a slick app about myself. This app clearly conveyed me as a person, my skills, my interests, and my reasoning behind wanting to go to WWDC. I learned a lot more about iOS development by creating this app. I hope that this year I can attend the conference and learn a lot from the other attendees."
        }
        self.desc.numberOfLines = 0
        self.desc.alpha = 1.0
        self.desc.font = UIFont(name: "SFUIText-Light", size: 16)
        self.desc.textAlignment = .Left
        self.view.addSubview(self.desc)
        
        if self.view.frame.size.height == 736 {
            self.desc.font = UIFont(name: "SFUIText-Light", size: 18)
        }
        
        self.desc.translatesAutoresizingMaskIntoConstraints = false
        
        if self.view.frame.size.height == 568 {
            self.view.addConstraint(NSLayoutConstraint(item: self.desc, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.85, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.desc, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.desc, attribute: .CenterY, relatedBy: .Equal, toItem: self.descTitle, attribute: .CenterY, multiplier: 1.45, constant: 0.0))
        } else {
            self.view.addConstraint(NSLayoutConstraint(item: self.desc, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.85, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.desc, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.desc, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.35, constant: 0.0))
        }
    }
    
    func indexChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            UIView.animateWithDuration(0.5) { () -> Void in
                self.descTitle.text = "Description"
                if self.appName == "Performance+" {
                    self.desc.text = "Performance+ is a performance management application. Its main function is to allow managers to set goals for their employees, as well as track their performance over time. Additionally, this is also a feedback centered application. An employee can easily log in and see their progress towards completing their goals, and how their manager is evaluating them."
                } else if self.appName == "WWDC 2015" {
                    self.desc.text = "Last year, I applied to WWDC with a slick app about myself. This app clearly conveyed me as a person, my skills, my interests, and my reasoning behind wanting to go to WWDC. I learned a lot more about iOS development by creating this app. I hope that this year I can attend the conference and learn a lot from the other attendees."
                }
            }
            break
        case 1:
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.descTitle.text = "Inspiration"
                if self.appName == "Performance+" {
                    self.desc.text = "I was initially approached by an Apple employee who worked in Talent Analytics. He explained to me that there wasn't an elegant way of tracking employee performance over time and setting goals. Since that day, I have worked tirelessly on the solution to the problem, and I am glad to say that the app is almost complete. Expect a release within the next month."
                } else if self.appName == "WWDC 2015" {
                    self.desc.text = "Ever since I got into the world of programming, it has been my dream to attend WWDC. WWDC is a great conference where I can learn more about Apple's platforms, as well as how other talented developers are taking advantage of those tools. Being at WWDC is still my dream, and I hope that it can become a reality this June."
                }
            })
            break
        default:
            break
        }
    }
}
