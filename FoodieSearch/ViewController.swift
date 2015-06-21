//
//  ViewController.swift
//  FoodieSearch
//
//  Created by Conor Linehan on 21/06/2015.
//  Copyright (c) 2015 Conor Linehan. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate{
    
    
    @IBOutlet var mapView: MKMapView!
    
    // Tells how long map is idle
    var displayCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.mapView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(mapView: MKMapView!, regionDidChangeAnimated animated: Bool) {
        
        let thisLocation = CLLocation (latitude: self.mapView.centerCoordinate.latitude, longitude: self.mapView.centerCoordinate.longitude)
        
        // schedule timer
        if displayCount == 0 {
            NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "displayInfoOnIdle:", userInfo: nil, repeats: true)
        } else {
            // reset displayCount
            displayCount = 0
        }
        
    }
    
    func displayInfoOnIdle(timer:NSTimer){
        
        if displayCount < 3{
            displayCount++
        } else {
            println("Idle and rested")
            displayCount = 0
            timer.invalidate()
        }
        
    }


}

