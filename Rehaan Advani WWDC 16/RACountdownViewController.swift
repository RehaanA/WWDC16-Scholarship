//
//  RACountdownViewController.swift
//  Rehaan Advani WWDC 16
//
//  Created by Rehaan Advani on 4/5/16.
//  Copyright © 2016 Rehaan Advani. All rights reserved.
//

import UIKit

class RACountdownViewController: UIViewController {
    var releaseDate: NSDate?
    
    var yearsTitleLabel = UILabel()
    var yearsLabel = UILabel()
    var monthsTitleLabel = UILabel()
    var monthsLabel = UILabel()
    var daysTitleLabel = UILabel()
    var daysLabel = UILabel()
    var hoursTitleLabel = UILabel()
    var hoursLabel = UILabel()
    var minutesTitleLabel = UILabel()
    var minutesLabel = UILabel()
    var secondsTitleLabel = UILabel()
    var secondsLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navBar()
        
        let releaseDateString = "2016-06-13 10:00:00"
        let releaseDateFormatter = NSDateFormatter()
        releaseDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        releaseDate = releaseDateFormatter.dateFromString(releaseDateString)!
        
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(self.countDownDate), userInfo: nil, repeats: true)
        
        self.addUIElements()

    }
    
    func countDownDate() {
        let currentDate = NSDate()
        
        let diffDateComponents = NSCalendar.currentCalendar().components([NSCalendarUnit.Month, NSCalendarUnit.Day, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second], fromDate: currentDate, toDate: releaseDate!, options: .MatchFirst)
        
        self.yearsLabel.text = "0"
        self.monthsLabel.text = "\(diffDateComponents.month)"
        self.daysLabel.text = "\(diffDateComponents.day)"
        self.hoursLabel.text = "\(diffDateComponents.hour)"
        self.minutesLabel.text = "\(diffDateComponents.minute)"
        self.secondsLabel.text = "\(diffDateComponents.second)"
    }
    
    func navBar() {
        self.title = "Countdown To WWDC 2016"
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
        
        let done = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(self.done))
        self.navigationItem.leftBarButtonItem = done
    }
    
    func done() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func addUIElements() {
        /*self.yearsLabel.alpha = 0
        self.monthsLabel.alpha = 0
        self.daysLabel.alpha = 0
        self.hoursLabel.alpha = 0
        self.minutesLabel.alpha = 0
        self.secondsLabel.alpha = 0
        
        self.yearsTitleLabel.alpha = 0
        self.monthsTitleLabel.alpha = 0
        self.daysTitleLabel.alpha = 0
        self.hoursTitleLabel.alpha = 0
        self.minutesTitleLabel.alpha = 0
        self.secondsTitleLabel.alpha = 0*/
        
        self.yearsTitleLabel.text = "Years"
        self.yearsTitleLabel.font = UIFont(name: "SFUIText-Light", size: 20)
        self.yearsTitleLabel.textColor = UIColor.blackColor()
        self.yearsTitleLabel.textAlignment = .Center
        self.view.addSubview(self.yearsTitleLabel)
        
        self.yearsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        if self.view.frame.size.height == 568 {
            self.view.addConstraint(NSLayoutConstraint(item: self.yearsTitleLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.5, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.yearsTitleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 0.5, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.yearsTitleLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.3, constant: 0))
        } else {
            self.view.addConstraint(NSLayoutConstraint(item: self.yearsTitleLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.5, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.yearsTitleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 0.5, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: self.yearsTitleLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.25, constant: 0))
        }
        
        self.yearsLabel.font = UIFont(name: "SFUIText-Light", size: 25)
        self.yearsLabel.textColor = UIColor.whiteColor()
        self.yearsLabel.backgroundColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        self.yearsLabel.clipsToBounds = true
        self.yearsLabel.layer.cornerRadius = 65
        self.yearsLabel.textAlignment = .Center
        self.view.addSubview(self.yearsLabel)
        
        self.yearsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        if self.view.frame.size.height == 568 {
            self.yearsLabel.layer.cornerRadius = 55
            self.view.addConstraint(NSLayoutConstraint(item: self.yearsLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 110))
            self.view.addConstraint(NSLayoutConstraint(item: self.yearsLabel, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 110))
            self.view.addConstraint(NSLayoutConstraint(item: self.yearsLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 0.5, constant: 0))
            self.view.addConstraint(NSLayoutConstraint(item: self.yearsLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.yearsTitleLabel, attribute: .CenterY, multiplier: 1.0, constant: 75))
        } else if self.view.frame.size.height == 736 {
            self.yearsLabel.layer.cornerRadius = 72.5
            self.view.addConstraint(NSLayoutConstraint(item: self.yearsLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 145))
            self.view.addConstraint(NSLayoutConstraint(item: self.yearsLabel, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 145))
            self.view.addConstraint(NSLayoutConstraint(item: self.yearsLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 0.5, constant: 0))
            self.view.addConstraint(NSLayoutConstraint(item: self.yearsLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.yearsTitleLabel, attribute: .CenterY, multiplier: 1.2, constant: 75))
        } else {
            self.view.addConstraint(NSLayoutConstraint(item: self.yearsLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 130))
            self.view.addConstraint(NSLayoutConstraint(item: self.yearsLabel, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 130))
            self.view.addConstraint(NSLayoutConstraint(item: self.yearsLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 0.5, constant: 0))
            self.view.addConstraint(NSLayoutConstraint(item: self.yearsLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.yearsTitleLabel, attribute: .CenterY, multiplier: 1.0, constant: 85))
        }
        
        self.monthsTitleLabel.text = "Months"
        self.monthsTitleLabel.font = UIFont(name: "SFUIText-Light", size: 20)
        self.monthsTitleLabel.textColor = UIColor.blackColor()
        self.monthsTitleLabel.textAlignment = .Center
        self.view.addSubview(self.monthsTitleLabel)
        
        self.monthsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.monthsTitleLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.5, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.monthsTitleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.5, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.monthsTitleLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.yearsTitleLabel, attribute: .CenterY, multiplier: 1.0, constant: 0))
        
        
        self.monthsLabel.font = UIFont(name: "SFUIText-Light", size: 25)
        self.monthsLabel.textColor = UIColor.whiteColor()
        self.monthsLabel.backgroundColor = UIColor(red: 192/255, green: 57/255, blue: 43/255, alpha: 1.0)
        self.monthsLabel.clipsToBounds = true
        self.monthsLabel.layer.cornerRadius = 65
        self.monthsLabel.textAlignment = .Center
        self.view.addSubview(self.monthsLabel)
        
        self.monthsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        if self.view.frame.size.height == 568 {
            self.monthsLabel.layer.cornerRadius = 55
            self.view.addConstraint(NSLayoutConstraint(item: self.monthsLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 110))
            self.view.addConstraint(NSLayoutConstraint(item: self.monthsLabel, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 110))
            self.view.addConstraint(NSLayoutConstraint(item: self.monthsLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.5, constant: 0))
            self.view.addConstraint(NSLayoutConstraint(item: self.monthsLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.yearsLabel, attribute: .CenterY, multiplier: 1.0, constant: 0))
        } else if self.view.frame.size.height == 736 {
            self.monthsLabel.layer.cornerRadius = 72.5
            self.view.addConstraint(NSLayoutConstraint(item: self.monthsLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 145))
            self.view.addConstraint(NSLayoutConstraint(item: self.monthsLabel, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 145))
            self.view.addConstraint(NSLayoutConstraint(item: self.monthsLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.5, constant: 0))
            self.view.addConstraint(NSLayoutConstraint(item: self.monthsLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.yearsLabel, attribute: .CenterY, multiplier: 1.0, constant: 0))
        } else {
            self.view.addConstraint(NSLayoutConstraint(item: self.monthsLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 130))
            self.view.addConstraint(NSLayoutConstraint(item: self.monthsLabel, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 130))
            self.view.addConstraint(NSLayoutConstraint(item: self.monthsLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.5, constant: 0))
            self.view.addConstraint(NSLayoutConstraint(item: self.monthsLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.yearsLabel, attribute: .CenterY, multiplier: 1.0, constant: 0))
        }
        
        self.daysTitleLabel.text = "Days"
        self.daysTitleLabel.font = UIFont(name: "SFUIText-Light", size: 20)
        self.daysTitleLabel.textColor = UIColor.blackColor()
        self.daysTitleLabel.textAlignment = .Center
        self.view.addSubview(self.daysTitleLabel)
        
        self.daysTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.daysTitleLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.5, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.daysTitleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 0.5, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.daysTitleLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.yearsLabel, attribute: .CenterY, multiplier: 1.6, constant: 0))
        
        
        self.daysLabel.font = UIFont(name: "SFUIText-Light", size: 25)
        self.daysLabel.textColor = UIColor.whiteColor()
        self.daysLabel.backgroundColor = UIColor(red: 192/255, green: 57/255, blue: 43/255, alpha: 1.0)
        self.daysLabel.clipsToBounds = true
        self.daysLabel.layer.cornerRadius = 65
        self.daysLabel.textAlignment = .Center
        self.view.addSubview(self.daysLabel)
        
        self.daysLabel.translatesAutoresizingMaskIntoConstraints = false
        
        if self.view.frame.size.height == 568 {
            self.daysLabel.layer.cornerRadius = 55
            self.view.addConstraint(NSLayoutConstraint(item: self.daysLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 110))
            self.view.addConstraint(NSLayoutConstraint(item: self.daysLabel, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 110))
            self.view.addConstraint(NSLayoutConstraint(item: self.daysLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 0.5, constant: 0))
            self.view.addConstraint(NSLayoutConstraint(item: self.daysLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.daysTitleLabel, attribute: .CenterY, multiplier: 1.0, constant: 75))
        } else if self.view.frame.size.height == 736 {
            self.daysLabel.layer.cornerRadius = 72.5
            self.view.addConstraint(NSLayoutConstraint(item: self.daysLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 145))
            self.view.addConstraint(NSLayoutConstraint(item: self.daysLabel, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 145))
            self.view.addConstraint(NSLayoutConstraint(item: self.daysLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 0.5, constant: 0))
            self.view.addConstraint(NSLayoutConstraint(item: self.daysLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.daysTitleLabel, attribute: .CenterY, multiplier: 1.0, constant: 95))
        } else {
            self.view.addConstraint(NSLayoutConstraint(item: self.daysLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 130))
            self.view.addConstraint(NSLayoutConstraint(item: self.daysLabel, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 130))
            self.view.addConstraint(NSLayoutConstraint(item: self.daysLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 0.5, constant: 0))
            self.view.addConstraint(NSLayoutConstraint(item: self.daysLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.daysTitleLabel, attribute: .CenterY, multiplier: 1.0, constant: 85))
        }
        
        
        self.hoursTitleLabel.text = "Hours"
        self.hoursTitleLabel.font = UIFont(name: "SFUIText-Light", size: 20)
        self.hoursTitleLabel.textColor = UIColor.blackColor()
        self.hoursTitleLabel.textAlignment = .Center
        self.view.addSubview(self.hoursTitleLabel)
        
        self.hoursTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.hoursTitleLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.5, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.hoursTitleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.5, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.hoursTitleLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.daysTitleLabel, attribute: .CenterY, multiplier: 1.0, constant: 0))
        
        
        self.hoursLabel.font = UIFont(name: "SFUIText-Light", size: 25)
        self.hoursLabel.textColor = UIColor.whiteColor()
        self.hoursLabel.backgroundColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        self.hoursLabel.clipsToBounds = true
        self.hoursLabel.layer.cornerRadius = 65
        self.hoursLabel.textAlignment = .Center
        self.view.addSubview(self.hoursLabel)
        
        self.hoursLabel.translatesAutoresizingMaskIntoConstraints = false
        
        if self.view.frame.size.height == 568 {
            self.hoursLabel.layer.cornerRadius = 55
            self.view.addConstraint(NSLayoutConstraint(item: self.hoursLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 110))
            self.view.addConstraint(NSLayoutConstraint(item: self.hoursLabel, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 110))
            self.view.addConstraint(NSLayoutConstraint(item: self.hoursLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.5, constant: 0))
            self.view.addConstraint(NSLayoutConstraint(item: self.hoursLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.hoursTitleLabel, attribute: .CenterY, multiplier: 1.0, constant: 75))
        } else if self.view.frame.size.height == 736 {
            self.hoursLabel.layer.cornerRadius = 72.5
            self.view.addConstraint(NSLayoutConstraint(item: self.hoursLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 145))
            self.view.addConstraint(NSLayoutConstraint(item: self.hoursLabel, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 145))
            self.view.addConstraint(NSLayoutConstraint(item: self.hoursLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.5, constant: 0))
            self.view.addConstraint(NSLayoutConstraint(item: self.hoursLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.hoursTitleLabel, attribute: .CenterY, multiplier: 1.0, constant: 95))
        } else {
            self.view.addConstraint(NSLayoutConstraint(item: self.hoursLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 130))
            self.view.addConstraint(NSLayoutConstraint(item: self.hoursLabel, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 130))
            self.view.addConstraint(NSLayoutConstraint(item: self.hoursLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.5, constant: 0))
            self.view.addConstraint(NSLayoutConstraint(item: self.hoursLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.hoursTitleLabel, attribute: .CenterY, multiplier: 1.0, constant: 85))
        }
        
        
        self.minutesTitleLabel.text = "Minutes"
        self.minutesTitleLabel.font = UIFont(name: "SFUIText-Light", size: 20)
        self.minutesTitleLabel.textColor = UIColor.blackColor()
        self.minutesTitleLabel.textAlignment = .Center
        self.view.addSubview(self.minutesTitleLabel)
        
        self.minutesTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.minutesTitleLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.5, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.minutesTitleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 0.5, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.minutesTitleLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.daysLabel, attribute: .CenterY, multiplier: 1.3, constant: 0))
        
        
        self.minutesLabel.font = UIFont(name: "SFUIText-Light", size: 25)
        self.minutesLabel.textColor = UIColor.whiteColor()
        self.minutesLabel.backgroundColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        self.minutesLabel.clipsToBounds = true
        self.minutesLabel.layer.cornerRadius = 65
        self.minutesLabel.textAlignment = .Center
        self.view.addSubview(self.minutesLabel)
        
        self.minutesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        if self.view.frame.size.height == 568 {
            self.minutesLabel.layer.cornerRadius = 55
            self.view.addConstraint(NSLayoutConstraint(item: self.minutesLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 110))
            self.view.addConstraint(NSLayoutConstraint(item: self.minutesLabel, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 110))
            self.view.addConstraint(NSLayoutConstraint(item: self.minutesLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 0.5, constant: 0))
            self.view.addConstraint(NSLayoutConstraint(item: self.minutesLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.minutesTitleLabel, attribute: .CenterY, multiplier: 1.0, constant: 75))
        } else if self.view.frame.size.height == 736 {
            self.minutesLabel.layer.cornerRadius = 72.5
            self.view.addConstraint(NSLayoutConstraint(item: self.minutesLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 145))
            self.view.addConstraint(NSLayoutConstraint(item: self.minutesLabel, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 145))
            self.view.addConstraint(NSLayoutConstraint(item: self.minutesLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 0.5, constant: 0))
            self.view.addConstraint(NSLayoutConstraint(item: self.minutesLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.minutesTitleLabel, attribute: .CenterY, multiplier: 1.0, constant: 95))
        } else {
            self.view.addConstraint(NSLayoutConstraint(item: self.minutesLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 130))
            self.view.addConstraint(NSLayoutConstraint(item: self.minutesLabel, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 130))
            self.view.addConstraint(NSLayoutConstraint(item: self.minutesLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 0.5, constant: 0))
            self.view.addConstraint(NSLayoutConstraint(item: self.minutesLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.minutesTitleLabel, attribute: .CenterY, multiplier: 1.0, constant: 85))
        }
        
        
        self.secondsTitleLabel.text = "Seconds"
        self.secondsTitleLabel.font = UIFont(name: "SFUIText-Light", size: 20)
        self.secondsTitleLabel.textColor = UIColor.blackColor()
        self.secondsTitleLabel.textAlignment = .Center
        self.view.addSubview(self.secondsTitleLabel)
        
        self.secondsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.secondsTitleLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.5, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.secondsTitleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.5, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.secondsTitleLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.minutesTitleLabel, attribute: .CenterY, multiplier: 1.0, constant: 0))
        
        
        
        self.secondsLabel.font = UIFont(name: "SFUIText-Light", size: 25)
        self.secondsLabel.textColor = UIColor.whiteColor()
        self.secondsLabel.backgroundColor = UIColor(red: 192/255, green: 57/255, blue: 43/255, alpha: 1.0)
        self.secondsLabel.clipsToBounds = true
        self.secondsLabel.layer.cornerRadius = 65
        self.secondsLabel.textAlignment = .Center
        self.view.addSubview(self.secondsLabel)
        
        self.secondsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        if self.view.frame.size.height == 568 {
            self.secondsLabel.layer.cornerRadius = 55
            self.view.addConstraint(NSLayoutConstraint(item: self.secondsLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 110))
            self.view.addConstraint(NSLayoutConstraint(item: self.secondsLabel, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 110))
            self.view.addConstraint(NSLayoutConstraint(item: self.secondsLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.5, constant: 0))
            self.view.addConstraint(NSLayoutConstraint(item: self.secondsLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.secondsTitleLabel, attribute: .CenterY, multiplier: 1.0, constant: 75))
        } else if self.view.frame.size.height == 736 {
            self.secondsLabel.layer.cornerRadius = 72.5
            self.view.addConstraint(NSLayoutConstraint(item: self.secondsLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 145))
            self.view.addConstraint(NSLayoutConstraint(item: self.secondsLabel, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 145))
            self.view.addConstraint(NSLayoutConstraint(item: self.secondsLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.5, constant: 0))
            self.view.addConstraint(NSLayoutConstraint(item: self.secondsLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.secondsTitleLabel, attribute: .CenterY, multiplier: 1.0, constant: 95))
        } else {
            self.view.addConstraint(NSLayoutConstraint(item: self.secondsLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 130))
            self.view.addConstraint(NSLayoutConstraint(item: self.secondsLabel, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 130))
            self.view.addConstraint(NSLayoutConstraint(item: self.secondsLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.5, constant: 0))
            self.view.addConstraint(NSLayoutConstraint(item: self.secondsLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.secondsTitleLabel, attribute: .CenterY, multiplier: 1.0, constant: 85))
        }
    }
}
