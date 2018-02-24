//
//  RASkillsViewController.swift
//  Rehaan Advani WWDC 16
//
//  Created by Rehaan Advani on 1/15/16.
//  Copyright © 2016 Rehaan Advani. All rights reserved.
//

import UIKit
import KDCircularProgress

class RASkillsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    var percArray = [288, 270, 252, 216, 180, 90]
    var skills = ["Swift", "Objective-C", "HTML", "CSS", "Python", "JavaScript"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navBar()
        self.addCollectionView()
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
        self.title = "Skills"
        self.navigationController?.navigationBar.barStyle = .Black
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 192/255, green: 57/255, blue: 43/255, alpha: 1.0)
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
    
    //MARK: Collection View
    func addCollectionView() {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = UICollectionViewScrollDirection.Vertical
        flow.itemSize = CGSize(width: 181.25, height: 181.25)
        
        if self.view.frame.size.height == 568 {
            flow.itemSize = CGSize(width: 150, height: 160)
        } else if self.view.frame.size.height == 736 {
            flow.itemSize = CGSize(width: 200, height: 205)
        }
        
        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: flow)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.registerClass(SkillsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.collectionView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.collectionView)
        
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: collectionView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: collectionView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: collectionView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: collectionView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        
    }
    
    //MARK: Data Source
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.skills.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: SkillsCollectionViewCell! = self.collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! SkillsCollectionViewCell
        
        cell.progress.animateToAngle(percArray[indexPath.row], duration: 1.5, completion: nil)
        cell.progress.setColors(UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0))
        cell.label.text = skills[indexPath.row]
        let doublePerc = Double(cell.progress.angle)/360
        cell.perc.text = String(Int(doublePerc * 100)) + "%"
        //cell.perc.text = String((Double(cell.progress.angle)/360) * 100) + "%"
        
        return cell
    }

}
