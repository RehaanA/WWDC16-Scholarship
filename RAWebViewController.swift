//
//  RAWebViewController.swift
//  Rehaan Advani WWDC 16
//
//  Created by Rehaan Advani on 2/21/16.
//  Copyright © 2016 Rehaan Advani. All rights reserved.
//

import UIKit

class RAWebViewController: UIViewController, UIWebViewDelegate {
    
    var type = String()
    var webView = UIWebView()
    var actInd = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navBar()
        self.addWebView()
        self.addActInd()
        
        if type == "LinkedIn" {
            let url = NSURL(string: "https://www.linkedin.com/in/rehaan-advani-ba24ba102?trk=hp-identity-name")
            let request = NSURLRequest(URL: url!)
            self.webView.loadRequest(request)
        } else if type == "Facebook" {
            let url = NSURL(string: "https://www.facebook.com/rehaan.advani.9")
            let request = NSURLRequest(URL: url!)
            self.webView.loadRequest(request)
        } else {
            let url = NSURL(string: "https://twitter.com/Rehaan_Advani")
            let request = NSURLRequest(URL: url!)
            self.webView.loadRequest(request)
        }
    }

    func navBar() {
        self.title = "\(type)"
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
        
        let close = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: #selector(RAWebViewController.cancel))
        self.navigationItem.leftBarButtonItem = close
        
    }
    
    func cancel() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func addWebView() {
        self.view.addSubview(self.webView)
        self.webView.delegate = self
        self.webView.translatesAutoresizingMaskIntoConstraints = false
        
        let con = [NSLayoutConstraint(item: webView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: webView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: webView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: webView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0.0)]
        self.view.addConstraints(con)
    }
    
    func addActInd() {
        self.actInd.activityIndicatorViewStyle = .Gray
        self.view.addSubview(self.actInd)
        
        self.actInd.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.actInd, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.actInd, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        self.actInd.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.actInd.stopAnimating()
    }

}
