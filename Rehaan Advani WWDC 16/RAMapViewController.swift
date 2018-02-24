//
//  RAMapViewController.swift
//  Rehaan Advani WWDC 16
//
//  Created by Rehaan Advani on 3/11/16.
//  Copyright © 2016 Rehaan Advani. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class RAMapViewController: UIViewController {
    var mapView = MKMapView()
    let regionRadius: CLLocationDistance = 1000

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navBar()
        self.addMapView()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: Navigation Bar
    func navBar() {
        self.title = "Palo Alto, CA"
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
        
        let close = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: #selector(RAMapViewController.close))
        self.navigationItem.leftBarButtonItem = close
        
    }
    
    func close() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func addMapView() {
        let initialLocation = CLLocation(latitude: 37.4436970, longitude: -122.1316130)
        self.centerMapOnLocation(initialLocation)
        let annotation = Location(title: "Palo Alto", desc: "This is where I live!", coordinate: initialLocation.coordinate)
        self.mapView.addAnnotation(annotation)
        self.view.addSubview(self.mapView)
        
        self.mapView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.mapView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.mapView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.mapView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.mapView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2, regionRadius * 2)
        self.mapView.setRegion(coordinateRegion, animated: true)
    }

}

class Location: NSObject, MKAnnotation {
    let title: String!
    let desc: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, desc: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.desc = desc
        self.coordinate = coordinate
        super.init()
    }
    
    var subtitle: String! {
        return self.desc
    }
}
