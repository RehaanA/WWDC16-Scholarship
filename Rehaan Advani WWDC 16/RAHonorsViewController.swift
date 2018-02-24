//
//  RAHonorsViewController.swift
//  Rehaan Advani WWDC 16
//
//  Created by Rehaan Advani on 1/15/16.
//  Copyright © 2016 Rehaan Advani. All rights reserved.
//

import UIKit

class RAHonorsViewController: UIViewController, UIPageViewControllerDataSource {
    var curl = UIImageView()
    var pageViewController = UIPageViewController()
    var imageArray = [UIImage(named: "hiq2.png"), UIImage(named: "elevate.jpeg"), UIImage(named: "twitterLogo.png"), UIImage(named: "flight.jpg")]
    var descArray = ["I have attended hiQ Labs's Elevate conference twice now. hiQ Labs is an HR Analytics start-up based in San Francisco, and aims to bring new insights about employee retention and attrition using highly advance machine learning algorithms. Their conference, Elevate, has brought together a community who is passionate about HR and applied data science. I am extremely fortunate to have been able to attend their conference twice at the age of 15.", "", "I was accepted into Twitter's Flight Developer Conference on a scholarship. It was a great experience, as I learned a lot about Twitter's developer platforms, and how they are progressing with their products. I was extremely fortunate to attend this conference and network with new people.", ""]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navBar()
        self.addPageView()
        self.addCurl()
    }
    
    func addCurl() {
        self.curl.image = UIImage(named: "curl.png")
        self.view.addSubview(self.curl)
        
        self.curl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.curl, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 75))
        self.view.addConstraint(NSLayoutConstraint(item: self.curl, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 75))
        self.view.addConstraint(NSLayoutConstraint(item: self.curl, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.85, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.curl, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.9, constant: 0))
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        self.title = "Achievements"
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
    
    func addPageView() {
        
        self.pageViewController.dataSource = self
        
        let startVC = self.viewControllerAtIndex(0)
        let viewControllers = NSArray(object: startVC)
        
        pageViewController.setViewControllers(viewControllers as! [RAHonorsDetailViewController], direction: .Forward, animated: true, completion: nil)
        pageViewController.view.frame = self.view.frame
        self.addChildViewController(self.pageViewController)
        self.pageViewController.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)

        
    }
    
    func viewControllerAtIndex(index: Int) -> RAHonorsDetailViewController {
        let vc: RAHonorsDetailViewController = RAHonorsDetailViewController()
        vc.pageIndex = index
        vc.logoImage.image = self.imageArray[index]
        vc.desc.text = descArray[index]
        
        return vc
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! RAHonorsDetailViewController
        var index = vc.pageIndex
        if index == 0 || index == NSNotFound {
            return nil
        }
    
        index -= 1
        self.curl.alpha = 1

        
        return self.viewControllerAtIndex(index)

        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! RAHonorsDetailViewController
        var index = vc.pageIndex
        
        
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == self.imageArray.count {
            return nil
        }
        
        if index == 3 {
            self.curl.alpha = 0
        }
        
        return self.viewControllerAtIndex(index)
        
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.imageArray.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }

}
