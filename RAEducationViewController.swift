//
//  RAEducationViewController.swift
//  Rehaan Advani WWDC 16
//
//  Created by Rehaan Advani on 1/15/16.
//  Copyright © 2016 Rehaan Advani. All rights reserved.
//

import UIKit

class RAEducationViewController: UIViewController, UIPageViewControllerDataSource {
    /*var imageArray = [UIImage(named: "paly1.JPG"), UIImage(named: "paly2.jpeg"), UIImage(named: "paly3.jpg"), UIImage(named: "paly4.jpg")]*/
    var imageArray = [UIImage(named: "front.JPG"), UIImage(named: "MAC.jpg"), UIImage(named: "quad.jpg"), UIImage(named: "paly4.jpg"), UIImage(named: "stanford.jpg")]
    var textArray = ["I am currently a rising freshman at the Palo Alto High School, and I expect to graduate in the summer of 2019.", "The courses I am currently enrolled in are: Honors Biology, Honors Geometry, World History, Object Oriented Programming, English, and Spanish. Next year, I am taking AP Computer Science, Algebra 2/Trigonometry Honors, Chemistry Honors, etc.", "I am an avid and competitive tennis player. I represent my school on the tennis team and we play against other schools in the local area.", "I am a passionate developer, and I want to pursue my career even further. I am taking multiple Computer Science courses, and I plan on majoring in it when I am in college. Additionally, see the projects page for more information about my apps.", "My dream college would have to be Stanford. The campus is beautiful, it has a solid Computer Science program, and it is well connected with the major companies and startups of Silicon Valley."]
    var imageView = UIImageView()
    var pageControl = UIPageControl()
    var pageController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options: nil)
    var label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navBar()
        self.addPageView()
        self.pageViewController(self.pageController, viewControllerBeforeViewController: RAEducationContentViewController())
    }

    
    override func willMoveToParentViewController(parent: UIViewController?) {
        super.willMoveToParentViewController(parent)
        if parent == nil {
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! RAEducationContentViewController
        var index = vc.pageIndex
        if index == 0 || index == NSNotFound {
            pageControl.currentPage = index
            pageControl.updateCurrentPageDisplay()
            return nil
        }
        
        pageControl.currentPage = index
        pageControl.updateCurrentPageDisplay()
        index -= 1
        
        if index == 0 {
            vc.blurView = UIVisualEffectView(effect: vc.darkBlur)
            vc.blurView.frame = vc.imageView.frame
            vc.imageView.addSubview(vc.blurView)
            
            vc.label.shine()
            
            UIView.animateWithDuration(0.5, animations: {
                vc.label.alpha = 1
                vc.imageView2.alpha = 0
            })
        }
        
        return self.viewControllerAtIndex(index)
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! RAEducationContentViewController
        var index = vc.pageIndex
      
        
        if index == NSNotFound {
            print("nil")
            return nil
        }
        pageControl.currentPage = vc.pageIndex
        pageControl.updateCurrentPageDisplay()
        
        index += 1
        if index == self.imageArray.count {
            return nil
        }
        
        if index == 0 {
            vc.blurView = UIVisualEffectView(effect: vc.darkBlur)
            vc.blurView.frame = vc.imageView.frame
            vc.imageView.addSubview(vc.blurView)
            
            vc.label.shine()
            
            UIView.animateWithDuration(0.5, animations: {
                vc.label.alpha = 1
                vc.imageView2.alpha = 0
            })
        }

        return self.viewControllerAtIndex(index)
    }
    
    func viewControllerAtIndex(index: Int) -> RAEducationContentViewController {
        let viewController: RAEducationContentViewController = RAEducationContentViewController()
        viewController.imageFile = self.imageArray[index]!
        viewController.labelText = self.textArray[index]
        viewController.pageIndex = index
        return viewController
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 5
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }

    
    //MARK: Navigation Bar
    func navBar() {
        self.title = "Education"
        self.navigationController?.navigationBar.barStyle = .Black
        /*self.navigationController?.navigationBar.barTintColor = UIColor(red: 192/255, green: 57/255, blue: 43/255, alpha: 1.0)*/
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
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
        self.pageController.dataSource = self
        
        let startVC = self.viewControllerAtIndex(0)
        let viewControllers = NSArray(object: startVC)
        
        pageController.setViewControllers(viewControllers as! [RAEducationContentViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        
        pageController.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height + 40)
        self.addChildViewController(self.pageController)
        self.view.addSubview(self.pageController.view)
        self.pageController.didMoveToParentViewController(self)
        self.pageController.view.bringSubviewToFront(self.view)
        
        self.pageControl.numberOfPages = 5
        self.pageControl.currentPage = 0
        self.pageControl.pageIndicatorTintColor = UIColor.darkGrayColor()
        self.pageControl.currentPageIndicatorTintColor = UIColor.whiteColor()
        self.pageControl.addTarget(self, action: #selector(self.pageValueChanged(_:)), forControlEvents: .ValueChanged)
        self.view.addSubview(self.pageControl)
        
        self.pageControl.bringSubviewToFront(self.view)
        self.pageControl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.pageControl, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.pageControl, attribute: .Height, relatedBy: .Equal
            , toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 30))
        self.view.addConstraint(NSLayoutConstraint(item: self.pageControl, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.pageControl, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.9, constant: 0.0))
        
    }
    
    func pageValueChanged(sender: UIPageControl) {
        pageControl.currentPage = sender.currentPage
        pageControl.updateCurrentPageDisplay()
    }
}
