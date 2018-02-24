//
//  SkillsCollectionViewCell.swift
//  Rehaan Advani WWDC 16
//
//  Created by Rehaan Advani on 2/21/16.
//  Copyright © 2016 Rehaan Advani. All rights reserved.
//

import UIKit
import KDCircularProgress

class SkillsCollectionViewCell: UICollectionViewCell {
    
    let progress = KDCircularProgress()
    var label = UILabel()
    var perc = UILabel()
    
    
    func drawPerc() {
        self.perc.font = UIFont(name: "SFUIText-Light", size: 15)
        self.perc.textAlignment = .Center
        self.perc.textColor = UIColor.blackColor()
        self.contentView.addSubview(self.perc)
        
        self.perc.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addConstraint(NSLayoutConstraint(item: self.perc, attribute: .CenterX, relatedBy: .Equal, toItem: self.progress, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        self.contentView.addConstraint(NSLayoutConstraint(item: self.perc, attribute: .CenterY, relatedBy: .Equal, toItem: self.progress, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
    }
    
    func drawLabel() {
        self.label.font = UIFont(name: "SFUIText-Light", size: 15)
        self.label.textAlignment = .Center
        self.label.textColor = UIColor.blackColor()
        self.contentView.addSubview(self.label)
        
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addConstraint(NSLayoutConstraint(item: self.label, attribute: .CenterX, relatedBy: .Equal, toItem: self.contentView, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        self.contentView.addConstraint(NSLayoutConstraint(item: self.label, attribute: .CenterY, relatedBy: .Equal, toItem: self.progress, attribute: .CenterY, multiplier: 1.9, constant: 0.0))
    }
    
    func drawProgress() {
        progress.startAngle = -90
        progress.progressThickness = 0.5
        progress.trackThickness = 0.5
        progress.clockwise = true
        progress.gradientRotateSpeed = 2
        progress.roundedCorners = false
        progress.trackColor = UIColor(red: 205/255, green: 201/255, blue: 201/255, alpha: 1.0)
        progress
        progress.glowAmount = 0.5
        progress.glowMode = KDCircularProgressGlowMode.Constant
        self.contentView.addSubview(progress)
        
        progress.translatesAutoresizingMaskIntoConstraints = false
        
        if self.contentView.frame.size.width == 150 {
            self.contentView.addConstraint(NSLayoutConstraint(item: progress, attribute: .Width, relatedBy: .Equal, toItem: self.contentView, attribute: .Width, multiplier: 0, constant: 130))
            self.contentView.addConstraint(NSLayoutConstraint(item: progress, attribute: .Height, relatedBy: .Equal, toItem: self.contentView, attribute: .Height, multiplier: 0, constant: 130))
            self.contentView.addConstraint(NSLayoutConstraint(item: progress, attribute: .CenterX, relatedBy: .Equal, toItem: self.contentView, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
            self.contentView.addConstraint(NSLayoutConstraint(item: progress, attribute: .CenterY, relatedBy: .Equal, toItem: self.contentView, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        } else {
            self.contentView.addConstraint(NSLayoutConstraint(item: progress, attribute: .Width, relatedBy: .Equal, toItem: self.contentView, attribute: .Width, multiplier: 0, constant: 150))
            self.contentView.addConstraint(NSLayoutConstraint(item: progress, attribute: .Height, relatedBy: .Equal, toItem: self.contentView, attribute: .Height, multiplier: 0, constant: 150))
            self.contentView.addConstraint(NSLayoutConstraint(item: progress, attribute: .CenterX, relatedBy: .Equal, toItem: self.contentView, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
            self.contentView.addConstraint(NSLayoutConstraint(item: progress, attribute: .CenterY, relatedBy: .Equal, toItem: self.contentView, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        }

    }
    
    func draw() {
        self.drawProgress()
        self.drawLabel()
        self.drawPerc()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.draw()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
