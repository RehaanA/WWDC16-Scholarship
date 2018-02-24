//
//  RAInterestsTableViewCell.swift
//  Rehaan Advani WWDC 16
//
//  Created by Rehaan Advani on 3/20/16.
//  Copyright © 2016 Rehaan Advani. All rights reserved.
//

import UIKit

class RAInterestsTableViewCell: UITableViewCell {
    
    var background: UIImageView! = UIImageView()
    var title = UILabel()
    
    func drawTitle() {
        self.title.font = UIFont(name: "Avenir", size: 18)
        self.title.textAlignment = .Left
        self.title.textColor = UIColor.whiteColor()
        self.contentView.addSubview(self.title)
        
        self.title.translatesAutoresizingMaskIntoConstraints = false
        /*self.contentView.addConstraint(NSLayoutConstraint(item: self.title, attribute: .Width, relatedBy: .Equal, toItem: self.contentView, attribute: .Width, multiplier: 0.2, constant: 0.0))*/
        self.contentView.addConstraint(NSLayoutConstraint(item: self.title, attribute: .CenterX, relatedBy: .Equal, toItem: self.contentView, attribute: .CenterX, multiplier: 0.5, constant: 0.0))
        self.contentView.addConstraint(NSLayoutConstraint(item: self.title, attribute: .CenterY, relatedBy: .Equal, toItem: self.contentView, attribute: .CenterY, multiplier: 1.0, constant: 0.0))

        
    }
    
    func drawBackground() {
        //self.imageView!.contentMode = .ScaleAspectFill
        self.imageView!.contentMode = .ScaleToFill
        self.contentView.addSubview(self.imageView!)
        
        self.imageView!.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addConstraint(NSLayoutConstraint(item: self.imageView!, attribute: .Width, relatedBy: .Equal, toItem: self.contentView, attribute: .Width, multiplier: 1.0, constant: 0.0))
        self.contentView.addConstraint(NSLayoutConstraint(item: self.imageView!, attribute: .Height, relatedBy: .Equal, toItem: self.contentView, attribute: .Height, multiplier: 1.0, constant: 0.0))
        self.contentView.addConstraint(NSLayoutConstraint(item: self.imageView!, attribute: .CenterX, relatedBy: .Equal, toItem: self.contentView, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        self.contentView.addConstraint(NSLayoutConstraint(item: self.imageView!, attribute: .CenterY, relatedBy: .Equal, toItem: self.contentView, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
    }
    
    func draw() {
        self.drawBackground()
        self.drawTitle()
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.draw()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
