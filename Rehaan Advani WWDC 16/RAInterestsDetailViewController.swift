//
//  RAInterestsDetailViewController.swift
//  Rehaan Advani WWDC 16
//
//  Created by Rehaan Advani on 2/28/16.
//  Copyright © 2016 Rehaan Advani. All rights reserved.
//

import UIKit
import Agrume

class RAInterestsDetailViewController: UIViewController {
    
    var area: String!
    var imageView1 = UIImageView()
    var desc1 = UILabel()
    var imageView2 = UIImageView()
    var desc2 = UILabel()
    var scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navBar()
        self.addScrollView()
        self.addUIElements()
    }
    
    func navBar() {
        self.title = self.area
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
    
    override func willMoveToParentViewController(parent: UIViewController?) {
        super.willMoveToParentViewController(parent)
        if parent == nil {
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
            self.navigationController?.navigationBar.tintColor = UIColor.lightGrayColor()
        }
    }
    
    func addScrollView() {
        self.scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 1000)
        
        if self.view.frame.size.height == 568 {
            self.scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 850)
        } else if self.view.frame.size.height == 736 {
            self.scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 1100)
        }
        
        self.view.addSubview(self.scrollView)
        
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.scrollView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.scrollView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.scrollView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.scrollView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
    }
    
    func tap1(sender: UITapGestureRecognizer) {
        let agrume = Agrume(image: self.imageView1.image!)
        agrume.showFrom(self)
    }
    
    func tap2(sender: UITapGestureRecognizer) {
        let agrume = Agrume(image: self.imageView2.image!)
        agrume.showFrom(self)
    }
    
    func addUIElements() {
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.tap1(_:)))
        self.imageView1.addGestureRecognizer(tap1)
        self.imageView1.userInteractionEnabled = true
        self.imageView1.alpha = 0
        self.scrollView.addSubview(self.imageView1)
        
        self.imageView1.translatesAutoresizingMaskIntoConstraints = false
        
        if self.view.frame.size.height == 568 {
            self.view.addConstraint(NSLayoutConstraint(item: self.imageView1, attribute: .Width, relatedBy: .Equal, toItem: self.scrollView, attribute: .Width, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.imageView1, attribute: .Height, relatedBy: .Equal, toItem: self.scrollView, attribute: .Height, multiplier: 0.3, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.imageView1, attribute: .CenterX, relatedBy: .Equal, toItem: self.scrollView, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.imageView1, attribute: .CenterY, relatedBy: .Equal, toItem: self.scrollView, attribute: .CenterY, multiplier: 0.075, constant: (self.navigationController?.navigationBar.frame.size.height)! + UIApplication.sharedApplication().statusBarFrame.height))
        } else if self.view.frame.size.height == 736 {
            self.view.addConstraint(NSLayoutConstraint(item: self.imageView1, attribute: .Width, relatedBy: .Equal, toItem: self.scrollView, attribute: .Width, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.imageView1, attribute: .Height, relatedBy: .Equal, toItem: self.scrollView, attribute: .Height, multiplier: 0.3, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.imageView1, attribute: .CenterX, relatedBy: .Equal, toItem: self.scrollView, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.imageView1, attribute: .CenterY, relatedBy: .Equal, toItem: self.scrollView, attribute: .CenterY, multiplier: 0.125, constant: (self.navigationController?.navigationBar.frame.size.height)! + UIApplication.sharedApplication().statusBarFrame.height))
        } else {
            self.view.addConstraint(NSLayoutConstraint(item: self.imageView1, attribute: .Width, relatedBy: .Equal, toItem: self.scrollView, attribute: .Width, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.imageView1, attribute: .Height, relatedBy: .Equal, toItem: self.scrollView, attribute: .Height, multiplier: 0.3, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.imageView1, attribute: .CenterX, relatedBy: .Equal, toItem: self.scrollView, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.imageView1, attribute: .CenterY, relatedBy: .Equal, toItem: self.scrollView, attribute: .CenterY, multiplier: 0.1, constant: (self.navigationController?.navigationBar.frame.size.height)! + UIApplication.sharedApplication().statusBarFrame.height))
        }
        
        self.desc1.alpha = 0
        self.desc1.font = UIFont(name: "SFUIText-Light", size: 17)
        self.desc1.textColor = UIColor.blackColor()
        self.desc1.textAlignment = .Left
        self.desc1.numberOfLines = 0
        self.scrollView.addSubview(self.desc1)
        
        self.desc1.translatesAutoresizingMaskIntoConstraints = false
        
        if self.view.frame.size.height == 736 {
            self.desc1.font = UIFont(name: "SFUIText-Light", size: 19)
        }
        
        if self.view.frame.size.height == 568 {
            self.view.addConstraint(NSLayoutConstraint(item: self.desc1, attribute: .Width, relatedBy: .Equal, toItem: self.scrollView, attribute: .Width, multiplier: 0.9, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.desc1, attribute: .Height, relatedBy: .Equal, toItem: self.scrollView, attribute: .Height, multiplier: 0.375, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.desc1, attribute: .CenterX, relatedBy: .Equal, toItem: self.scrollView, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.desc1, attribute: .CenterY, relatedBy: .Equal, toItem: self.scrollView, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        } else {
            self.view.addConstraint(NSLayoutConstraint(item: self.desc1, attribute: .Width, relatedBy: .Equal, toItem: self.scrollView, attribute: .Width, multiplier: 0.9, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.desc1, attribute: .Height, relatedBy: .Equal, toItem: self.scrollView, attribute: .Height, multiplier: 0.35, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.desc1, attribute: .CenterX, relatedBy: .Equal, toItem: self.scrollView, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.desc1, attribute: .CenterY, relatedBy: .Equal, toItem: self.scrollView, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        }
        
        
        self.imageView2.alpha = 0
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.tap2(_:)))
        self.imageView2.addGestureRecognizer(tap2)
        self.imageView2.userInteractionEnabled = true
        self.scrollView.addSubview(self.imageView2)
        
        self.imageView2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.imageView2, attribute: .Width, relatedBy: .Equal, toItem: self.scrollView, attribute: .Width, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.imageView2, attribute: .Height, relatedBy: .Equal, toItem: self.scrollView, attribute: .Height, multiplier: 0.4, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.imageView2, attribute: .CenterX, relatedBy: .Equal, toItem: self.scrollView, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.imageView2, attribute: .CenterY, relatedBy: .Equal, toItem: self.scrollView, attribute: .CenterY, multiplier: 1.8, constant: 0.0))
        
        
        self.desc2.alpha = 0
        self.desc2.font = UIFont(name: "SFUIText-Light", size: 17)
        self.desc2.textColor = UIColor.blackColor()
        self.desc2.textAlignment = .Left
        self.desc2.numberOfLines = 0
        self.scrollView.addSubview(self.desc2)
        
        if self.view.frame.size.height == 736 {
            self.desc2.font = UIFont(name: "SFUIText-Light", size: 19)
        }
        
        self.desc2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.desc2, attribute: .Width, relatedBy: .Equal, toItem: self.scrollView, attribute: .Width, multiplier: 0.9, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.desc2, attribute: .Height, relatedBy: .Equal, toItem: self.scrollView, attribute: .Height, multiplier: 0.35, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.desc2, attribute: .CenterX, relatedBy: .Equal, toItem: self.scrollView, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.desc2, attribute: .CenterY, relatedBy: .Equal, toItem: self.scrollView, attribute: .CenterY, multiplier: 2.6, constant: 0.0))
        
        if self.view.frame.size.height == 568 {
            self.desc1.font = UIFont(name: "SFUIText-Light", size: 15.5)
            self.desc2.font = UIFont(name: "SFUIText-Light", size: 15.5)
        }


        if self.title == "iOS Development" {
            self.imageView1.image = UIImage(named: "code.png")
            self.desc1.text = "I have always had a passion for developing iOS apps. The iPhone is the product I use everyday, and to have my personal apps running on my device is a surreal experience. Additionally, creating products that other people can use and benefit from has always been my dream. That is what I have envisioned for the future of the app I am currently working on, Performance+."
            self.imageView2.image = UIImage(named: "rohan.JPG")
            self.desc2.text = "I got into the world of programming and iOS development when my very good and talented friend, Rohan Kapur (Who is also a WWDC 2013 scholar), introduced me to Xcode and Objective-C. It is because of him I am where I am today, and I thank him for that. He is an extremely inspiring individual who pushes people to do their best."
        } else if self.title == "Web Development" {
            self.imageView1.image = UIImage(named: "javascript.png")
            self.desc1.text = "When I first started programming, I fell in love with the ease and simplicity of javascript. The syntax was clean, and was easily understood. Additionally, I picked up HTML and CSS as well, now improving my ability to design clean and simplistic web pages."
            self.imageView2.image = UIImage(named: "website.png")
            self.desc2.text = "Above is an image of the website I am creating for my app, Performance+. By developing this website, I learned a lot about the principles of web design, and more about the javascript programming language. Furthermore, I learned about design in general, and how to create a web page that appeals to the user's eye. I plan on releasing this website alongside my app soon."
        } else if self.title == "Math" {
            self.imageView1.image = UIImage(named: "quadratic.jpg")
            self.desc1.text = "I have always been interested in the field of mathematics. I have always enjoyed solving hard problems, as well as cool brain teasers. Currently, I am enrolled in Geometry Honors, and I will take Algebra 2/Trigonometry Honors next year. I thoroughly enjoyed my math class this year, and I am looking forward to next year."
            self.imageView2.image = UIImage(named: "sine.png")
            self.desc2.text = "I also use math everyday when I program. Math is an essential part of Computer Science. Sometimes, I would use math to create a specific UIBezierPath for an object to travel on. Shown above is a graph of a sine wave, and this is a common thing I would use when I code in Swift."
        } else if self.title == "Science" {
            self.imageView1.image = UIImage(named: "bio.jpg")
            self.desc1.text = "I am currently enrolled in an honors biology course at my high school. I am fascinated by the various processes that occur to make the miracle life. I learned about important concepts such as aerobic respiration, the body system, cell processes, etc. Next year, I will be taking honors chemistry, and I am looking forward to it. I have always been interested at what happens at the molecular level."
            self.imageView2.image = UIImage(named: "physics.jpg")
            self.desc2.text = "During my junior and senior year of high school, I will be taking extremely high levels of physics, including AP Physics C. Though these will be extremely difficult courses, I am looking forward to learning more, and applying math to the field of Science. Math is a passion of mine, and I can't wait to apply it more to science."
        } else {
            self.imageView1.image = UIImage(named: "tennis1.jpg")
            self.desc1.text = "Earlier in the academic year, I tried out for my high school tennis team. Thankfully, I made the team. My school team is now ranked #1 in the league and we are doing very well. I am thoroughly enjoying being on the tennis team. This entire experience has taught me that working with a team is the most effective way of going about life."
            self.imageView2.image = UIImage(named: "sign.jpg")
            self.desc2.text = "Outisde of school, I am constantly practicing with other friends on the team. By playing on the school team, I have made many new friends in many different grades. They are amazing people, and I strive to learn from them everyday. I have found that the best way of improving is by simply playing frequently."
        }
        
        UIView.animateWithDuration(0.5) { 
            self.imageView1.alpha = 1
        }
        
        UIView.animateWithDuration(0.5, delay: 0.5, options: .AllowUserInteraction, animations: { 
            self.desc1.alpha = 1
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 1.0, options: .AllowUserInteraction, animations: {
            self.imageView2.alpha = 1
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 1.5, options: .AllowUserInteraction, animations: {
            self.desc2.alpha = 1
            }, completion: nil)
    }
}
