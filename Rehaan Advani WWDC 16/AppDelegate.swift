//
//  AppDelegate.swift
//  Rehaan Advani WWDC 16
//
//  Created by Rehaan Advani on 1/4/16.
//  Copyright © 2016 Rehaan Advani. All rights reserved.
//

import UIKit
import MessageUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.window?.rootViewController = UINavigationController(rootViewController: RAIntroductionViewController())
        
        let pageControl = UIPageControl.appearance()
        //pageControl.pageIndicatorTintColor = UIColor.lightGrayColor()
        //pageControl.currentPageIndicatorTintColor = UIColor.blackColor()
        pageControl.pageIndicatorTintColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        pageControl.currentPageIndicatorTintColor = UIColor.whiteColor()
        pageControl.backgroundColor = UIColor.clearColor()
        
        
        
        if let font = UIFont(name: "SFUIText-Light", size: 18/*17*/) {
            UIBarButtonItem.appearance().setTitleTextAttributes([NSFontAttributeName: font], forState: .Normal)
        }
        
        //UINavigationBar.appearance().barTintColor = UIColor(red: 192/255, green: 57/255, blue: 43/255, alpha: 1.0)
        UINavigationBar.appearance().setBackgroundImage(nil, forBarMetrics: .Default)
        
        
        return true
    }
    
    func handleQuickAction(shortcutItem: UIApplicationShortcutItem) -> Bool {
        var quickActionHandled = false
        let type = shortcutItem.type.componentsSeparatedByString(".").last!
        if let shortcutType = Shortcut(rawValue: type) {
            switch shortcutType {
            case .aboutMe:
                NSNotificationCenter.defaultCenter().addObserver(RAIntroductionViewController(), selector: #selector(RAIntroductionViewController.aboutMeTap), name: "about", object: nil)
                NSNotificationCenter.defaultCenter().postNotificationName("about", object: self)
                quickActionHandled = true
            case .education:
                NSNotificationCenter.defaultCenter().addObserver(RAIntroductionViewController(), selector: #selector(RAIntroductionViewController.educationTap), name: "education", object: nil)
                NSNotificationCenter.defaultCenter().postNotificationName("education", object: self)
                quickActionHandled = true
            case .projects:
                NSNotificationCenter.defaultCenter().addObserver(RAIntroductionViewController(), selector: #selector(RAIntroductionViewController.projectsTap), name: "projects", object: nil)
                NSNotificationCenter.defaultCenter().postNotificationName("projects", object: self)
                quickActionHandled = true
            case .why:
                NSNotificationCenter.defaultCenter().addObserver(RAIntroductionViewController(), selector: #selector(RAIntroductionViewController.whyPressed(_:)), name: "why", object: nil)
                NSNotificationCenter.defaultCenter().postNotificationName("why", object: self)
                quickActionHandled = true
            }
        }
        
        return quickActionHandled
    }
    
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        completionHandler(handleQuickAction(shortcutItem))
        
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

