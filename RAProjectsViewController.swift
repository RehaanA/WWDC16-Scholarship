//
//  RAProjectsViewController.swift
//  Rehaan Advani WWDC 16
//
//  Created by Rehaan Advani on 1/15/16.
//  Copyright © 2016 Rehaan Advani. All rights reserved.
//

import UIKit

class RAProjectsViewController: UIViewController, UIPageViewControllerDataSource {
    let imageView = UIImageView()
    var pageViewController = UIPageViewController(transitionStyle: UIPageViewControllerTransitionStyle.Scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options: nil)
    var imageArray = [UIImage(named: "screen.png"), UIImage(named: "screen2.PNG"), UIImage(named: "screenShot2.PNG"), UIImage(named: "screenShot3.PNG"), UIImage(named: "screenShot4.PNG"), UIImage(named: "s1.png"), UIImage(named: "s2.png"), UIImage(named: "s3.png")]
    var titleArray = ["Performance+", "Performance+", "Performance+", "Performance+", "Performance+", "WWDC 2015", "WWDC 2015", "WWDC 2015"]
    var currentTitle = String()
    var arrow1 = UIImageView()
    var arrow2 = UIImageView()
    let vc = RAProjectsContentViewController()
    var currentIndex = Int()
    
    let darkBlur = UIBlurEffect(style: UIBlurEffectStyle.Light)
    var blurView = UIVisualEffectView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navBar()
        self.addPhone()
        self.addPageView()
        self.addArrows()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func willMoveToParentViewController(parent: UIViewController?) {
        super.willMoveToParentViewController(parent)
        if parent == nil {
            //self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
            //self.navigationController?.navigationBar.tintColor = UIColor.lightGrayColor()
        }
    }
    
    func addArrows() {
        self.arrow1.image = UIImage(named: "arrow3.png")
        self.arrow1.contentMode = .ScaleAspectFit
        self.arrow1.userInteractionEnabled = true
        self.view.addSubview(self.arrow1)
        
        self.arrow1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.arrow1, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.1, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.arrow1, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.1, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.arrow1, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.85, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.arrow1, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        
        self.arrow2.image = UIImage(named: "arrow4.png")
        self.arrow2.contentMode = .ScaleAspectFit
        self.arrow2.userInteractionEnabled = true
        self.view.addSubview(self.arrow2)
        
        self.arrow2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.arrow2, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.1, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.arrow2, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.1, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.arrow2, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 0.15, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.arrow2, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
    }
    
    //MARK: Navigation Bar
    func navBar() {
        self.title = "Projects"
        self.navigationController?.navigationBar.barStyle = .Black
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        var navTitleFont = UIFont(name: "SFUIText-Light", size: 20)
        
        if self.view.frame.size.height == 568 {
            navTitleFont = UIFont(name: "SFUIText-Light", size: 19)
        } else if self.view.frame.size.height == 736 {
            navTitleFont = UIFont(name: "SFUIText-Light", size: 21)
        }
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: navTitleFont!]
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "test5.jpg")!)
        
        self.blurView = UIVisualEffectView(effect: darkBlur)
        blurView.frame = self.view.frame
        self.view.addSubview(blurView)
        
        let info = UIButton(type: UIButtonType.InfoLight)
        info.addTarget(self, action: #selector(RAProjectsViewController.infoTapped(_:)), forControlEvents: .TouchUpInside)
        
        let barButton = UIBarButtonItem(customView: info)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    func infoTapped(sender: UIButton) {
        let infoPage = RAProjectsInfoViewController()
        infoPage.appName = self.currentTitle
        self.presentViewController(UINavigationController(rootViewController: infoPage), animated: true, completion: nil)
    }
    
    func addPhone() {
        self.imageView.image = UIImage(named: "iPhone.png")
        self.imageView.contentMode = .ScaleAspectFill
        self.view.addSubview(self.imageView)
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.imageView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.8, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.imageView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.8, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.imageView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.imageView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.1, constant: 0.0))
    }
    
    func addPageView() {
        self.pageViewController.dataSource = self
        
        let startVC = self.viewControllerAtIndex(0)
        self.currentTitle = startVC.titleText
        let viewControllers = NSArray(object: startVC)
        
        pageViewController.setViewControllers(viewControllers as! [RAProjectsContentViewController], direction: .Forward, animated: true, completion: nil)
        pageViewController.view.frame = self.view.frame
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! RAProjectsContentViewController
        var index = vc.pageIndex
        if index == 0 || index == NSNotFound {
            return nil
        }
        
        index -= 1
        self.vc.pageIndex -= 1
        self.currentTitle = vc.titleText
        return self.viewControllerAtIndex(index)
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! RAProjectsContentViewController
        var index = vc.pageIndex
        
        if index == NSNotFound {
            return nil
        }
        index += 1
        self.vc.pageIndex += 1
        self.currentTitle = vc.titleText
        if index == self.imageArray.count {
            return nil
        }
        //self.currentTitle = pageViewController.pa
        return self.viewControllerAtIndex(index)
    }
    
    func viewControllerAtIndex(index: Int) -> RAProjectsContentViewController {
        let vc: RAProjectsContentViewController = RAProjectsContentViewController()
        
        vc.imageFile = self.imageArray[index]!
        vc.titleText = self.titleArray[index]
        //print(vc.titleText)
        //self.currentTitle = vc.titleText
        vc.pageIndex = index
        
        return vc
        
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.imageArray.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return vc.pageIndex
    }

}
