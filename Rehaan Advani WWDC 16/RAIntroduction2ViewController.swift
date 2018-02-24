//
//  RAIntroduction2ViewController.swift
//  Rehaan Advani WWDC 16
//
//  Created by Rehaan Advani on 3/11/16.
//  Copyright © 2016 Rehaan Advani. All rights reserved.
//

import UIKit

class RAIntroduction2ViewController: UIViewController {
    var profileImage = UIImageView()
    var profileConAfter = [NSLayoutConstraint]()
    var aboutMeView = UIView()
    var aboutMeConAfter = [NSLayoutConstraint]()
    var aboutMeLabel = UILabel()
    var projectsView = UIView()
    var projectsConAfter = [NSLayoutConstraint]()
    var projectsLabel = UILabel()
    var educationView = UIView()
    var educationLabel = UILabel()
    var educationConAfter = [NSLayoutConstraint]()
    var skillsView = UIView()
    var skillsLabel = UILabel()
    var skillsConAfter = [NSLayoutConstraint]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navBar()
        self.addImageView()
        self.addAboutMe()
        self.addProjects()
        self.addEducation()
        self.addSkills()
    }

    
    //MARK: Navigation Bar
    func navBar() {
        self.title = "Rehaan Advani"
        self.navigationController?.navigationBar.barStyle = .Black
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 192/255, green: 57/255, blue: 43/255, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        let navTitleFont = UIFont(name: "Avenir", size: 20)
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: navTitleFont!]
        
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    func addImageView() {
        self.profileImage.image = UIImage(named: "IMG_4529.JPG")
        self.profileImage.clipsToBounds = true
        self.profileImage.layer.cornerRadius = 75
        self.profileImage.layer.borderWidth = 3
        self.profileImage.layer.borderColor = self.navigationController?.navigationBar.barTintColor?.CGColor
        self.profileImage.alpha = 0.0
        self.view.addSubview(self.profileImage)
        
        self.profileImage.translatesAutoresizingMaskIntoConstraints = false
        let profileConBefore = [NSLayoutConstraint(item: self.profileImage, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 150), NSLayoutConstraint(item: self.profileImage, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 150), NSLayoutConstraint(item: self.profileImage, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.profileImage, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.00000000001, constant: 0.0)]
        self.view.addConstraints(profileConBefore)
        
        profileConAfter = [NSLayoutConstraint(item: self.profileImage, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 150), NSLayoutConstraint(item: self.profileImage, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 150), NSLayoutConstraint(item: self.profileImage, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.profileImage, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.8, constant: 0.0)]
        
        self.view.layoutIfNeeded()
        UIView.animateKeyframesWithDuration(1, delay: 0, options: .AllowUserInteraction, animations: { () -> Void in
            NSLayoutConstraint.deactivateConstraints(profileConBefore)
            NSLayoutConstraint.activateConstraints(self.profileConAfter)
            self.profileImage.alpha = 1.0
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func addAboutMe() {
        self.aboutMeView.layer.cornerRadius = 50
        self.aboutMeView.alpha = 0.0
        self.aboutMeView.clipsToBounds = true
        self.aboutMeView.backgroundColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        self.view.addSubview(aboutMeView)
        
        self.aboutMeView.translatesAutoresizingMaskIntoConstraints = false
        let aboutMeConBefore = [NSLayoutConstraint(item: self.aboutMeView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.aboutMeView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.aboutMeView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.aboutMeView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.8, constant: 0)]
        self.view.addConstraints(aboutMeConBefore)
        
        self.aboutMeConAfter = [NSLayoutConstraint(item: self.aboutMeView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.aboutMeView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.aboutMeView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 0.3, constant: 0.0), NSLayoutConstraint(item: self.aboutMeView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.2, constant: 0)]
        
        self.aboutMeLabel.text = "About Me"
        self.aboutMeLabel.textColor = UIColor.whiteColor()
        self.aboutMeLabel.font = UIFont(name: "Avenir", size: 17)
        self.aboutMeLabel.textAlignment = .Center
        self.aboutMeView.addSubview(self.aboutMeLabel)
        
        self.aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.aboutMeLabel, attribute: .Width, relatedBy: .Equal, toItem: self.aboutMeView, attribute: .Width, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.aboutMeLabel, attribute: .Height, relatedBy: .Equal, toItem: self.aboutMeView, attribute: .Height, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.aboutMeLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.aboutMeView, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.aboutMeLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.aboutMeView, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        
        self.view.layoutIfNeeded()
        UIView.animateKeyframesWithDuration(1, delay: 1, options: .AllowUserInteraction, animations: { () -> Void in
            NSLayoutConstraint.deactivateConstraints(aboutMeConBefore)
            NSLayoutConstraint.activateConstraints(self.aboutMeConAfter)
            self.aboutMeView.alpha = 1.0
            self.view.layoutIfNeeded()

            }, completion: nil)
    }
    
    func addProjects() {
        self.projectsView.layer.cornerRadius = 50
        self.projectsView.clipsToBounds = true
        self.projectsView.backgroundColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        self.projectsView.alpha = 0.0
        self.view.addSubview(self.projectsView)
        
        self.projectsView.translatesAutoresizingMaskIntoConstraints = false
        let projectsConBefore = [NSLayoutConstraint(item: self.projectsView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.projectsView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.projectsView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.projectsView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.8, constant: 0)]
        
        self.view.addConstraints(projectsConBefore)
        
        self.projectsConAfter = [NSLayoutConstraint(item: self.projectsView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.projectsView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.projectsView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.projectsView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.4, constant: 0)]
        
        self.projectsLabel.text = "Projects"
        self.projectsLabel.textColor = UIColor.whiteColor()
        self.projectsLabel.font = UIFont(name: "Avenir", size: 17)
        self.projectsLabel.textAlignment = .Center
        self.projectsView.addSubview(self.projectsLabel)
        
        self.projectsLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.projectsLabel, attribute: .Width, relatedBy: .Equal, toItem: self.projectsView, attribute: .Width, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.projectsLabel, attribute: .Height, relatedBy: .Equal, toItem: self.projectsView, attribute: .Height, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.projectsLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.projectsView, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.projectsLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.projectsView, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        
        self.view.layoutIfNeeded()
        UIView.animateKeyframesWithDuration(1.0, delay: 1.5, options: UIViewKeyframeAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            NSLayoutConstraint.deactivateConstraints(projectsConBefore)
            NSLayoutConstraint.activateConstraints(self.projectsConAfter)
            self.view.sendSubviewToBack(self.projectsView)
            self.projectsView.alpha = 1.0
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func addEducation() {
        self.educationView.layer.cornerRadius = 50
        self.educationView.clipsToBounds = true
        self.educationView.backgroundColor = UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1.0)
        self.educationView.alpha = 0.0
        self.view.addSubview(self.educationView)
        
        self.educationView.translatesAutoresizingMaskIntoConstraints = false
        let educationConBefore = [NSLayoutConstraint(item: self.educationView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.educationView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.educationView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.educationView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.8, constant: 0)]
        
        self.view.addConstraints(educationConBefore)
        
        self.educationConAfter = [NSLayoutConstraint(item: self.educationView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.educationView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.educationView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.7, constant: 0.0), NSLayoutConstraint(item: self.educationView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.2, constant: 0)]
        
        self.educationLabel.text = "Education"
        self.educationLabel.textColor = UIColor.whiteColor()
        self.educationLabel.font = UIFont(name: "Avenir", size: 17)
        self.educationLabel.textAlignment = .Center
        self.educationView.addSubview(self.educationLabel)
        
        self.educationLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.educationLabel, attribute: .Width, relatedBy: .Equal, toItem: self.educationView, attribute: .Width, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.educationLabel, attribute: .Height, relatedBy: .Equal, toItem: self.educationView, attribute: .Height, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.educationLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.educationView, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.educationLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.educationView, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        
        self.view.layoutIfNeeded()
        UIView.animateKeyframesWithDuration(1.0, delay: 2.0, options: .AllowUserInteraction, animations: { () -> Void in
            NSLayoutConstraint.deactivateConstraints(educationConBefore)
            NSLayoutConstraint.activateConstraints(self.educationConAfter)
            self.view.sendSubviewToBack(self.educationView)
            self.educationView.alpha = 1.0
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "educationTap")
        self.educationView.addGestureRecognizer(tapGesture)
    }
    
    func addSkills() {
        self.skillsView.layer.cornerRadius = 50
        self.skillsView.alpha = 0.0
        self.skillsView.clipsToBounds = true
        self.skillsView.backgroundColor = UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1.0)
        self.view.addSubview(self.skillsView)
        
        self.skillsView.translatesAutoresizingMaskIntoConstraints = false
        let skillsConBefore = [NSLayoutConstraint(item: self.skillsView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.skillsView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.skillsView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: self.skillsView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.8, constant: 0)]
        
        self.view.addConstraints(skillsConBefore)
        
        self.skillsConAfter = [NSLayoutConstraint(item: self.skillsView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.skillsView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 100), NSLayoutConstraint(item: self.skillsView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.7, constant: 0.0), NSLayoutConstraint(item: self.skillsView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 0.4, constant: 0)]
        
        self.skillsLabel.text = "Skills"
        self.skillsLabel.textColor = UIColor.whiteColor()
        self.skillsLabel.font = UIFont(name: "Avenir", size: 17)
        self.skillsLabel.textAlignment = .Center
        self.skillsView.addSubview(self.skillsLabel)
        
        self.skillsLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.skillsLabel, attribute: .Width, relatedBy: .Equal, toItem: self.skillsView, attribute: .Width, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.skillsLabel, attribute: .Height, relatedBy: .Equal, toItem: self.skillsView, attribute: .Height, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.skillsLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.skillsView, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.skillsLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.skillsView, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        
        self.view.layoutIfNeeded()
        UIView.animateKeyframesWithDuration(1.0, delay: 2.5, options: .AllowUserInteraction, animations: { () -> Void in
            NSLayoutConstraint.deactivateConstraints(skillsConBefore)
            NSLayoutConstraint.activateConstraints(self.skillsConAfter)
            self.view.sendSubviewToBack(self.skillsView)
            self.view.layoutIfNeeded()
            self.skillsView.alpha = 1.0
            }, completion: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "skillsTap")
        self.skillsView.addGestureRecognizer(tapGesture)
    }


}
