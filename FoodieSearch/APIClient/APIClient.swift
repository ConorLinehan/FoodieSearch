//
//  APIClient.swift
//  FoodieSearch
//
//  Created by Conor Linehan on 21/06/2015.
//  Copyright (c) 2015 Conor Linehan. All rights reserved.
//

import UIKit
import MapKit

@objc protocol ClientDelegate: class {
    optional func gotRestaurantResults(restaurants: [AnyObject])
}

class APIClient: NSObject {
    
    // Yelp Credientials
    let yelpConsumerKey = "ruenG9kAyu7o1uV4GtIzwg"
    let yelpConsumerSecret = "jVRXgd7D_zcTVoapzS4RFNqubHA"
    let yelpToken = "YcR6z-kGlorHZvQeLFBt3maRczd24q_c"
    let yelpTokenSecret = "x3NU5Wo5nZQI9zBxLgqywK8R7FE"
    
    // delegate
    var delegate:ClientDelegate?
    
    func searchCoordinate(coordinate:CLLocation){
        
        
        
    }
   
}
