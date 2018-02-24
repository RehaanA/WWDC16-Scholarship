//
//  RAInterests2ViewController.swift
//  Rehaan Advani WWDC 16
//
//  Created by Rehaan Advani on 3/20/16.
//  Copyright © 2016 Rehaan Advani. All rights reserved.
//

import UIKit

class RAInterests2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView = UITableView()
    var interestsArray = ["iOS Development", "Web Development", "Math", "Science", "Tennis"]
    var imageArray = [UIImage(named: "swift5.jpg"), UIImage(named: "web3.jpg"), UIImage(named: "math2.jpg"), UIImage(named: "bio.png"), UIImage(named: "tennis.jpg")]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navBar()
        self.addTableView()

    }

    func navBar() {
        self.title = "Interests"
        //self.navigationController?.navigationBar.barStyle = .Black
        /*self.navigationController?.navigationBar.barTintColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)*/
        //self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        let navTitleFont = UIFont(name: "Avenir", size: 20)
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: navTitleFont!]
        self.navigationController?.navigationBar.shadowImage = nil
        self.view.backgroundColor = UIColor.whiteColor()
        
    }
    
    func addTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(RAInterestsTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView)
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.tableView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.tableView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.tableView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.tableView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: RAInterestsTableViewCell! = tableView.dequeueReusableCellWithIdentifier("cell") as! RAInterestsTableViewCell
        
        cell.title.text = self.interestsArray[indexPath.row]
        cell.imageView?.image = self.imageArray[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.interestsArray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

}
