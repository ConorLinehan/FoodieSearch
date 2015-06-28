//
//  APIClient.swift
//  FoodieSearch
//
//  Created by Conor Linehan on 21/06/2015.
//  Copyright (c) 2015 Conor Linehan. All rights reserved.
//

import UIKit
import MapKit
import Alamofire
import Foundation
import SwiftyJSON

@objc protocol ClientDelegate: class {
    optional func gotRestaurantResults(restaurants: [AnyObject])
}

class YelpClient: NSObject {
    
    // Yelp Credientials
    let yelpConsumerKey = "ruenG9kAyu7o1uV4GtIzwg"
    let yelpConsumerSecret = "jVRXgd7D_zcTVoapzS4RFNqubHA"
    let yelpToken = "YcR6z-kGlorHZvQeLFBt3maRczd24q_c"
    let yelpTokenSecret = "x3NU5Wo5nZQI9zBxLgqywK8R7FE"
    let oauthSignatureType = "HMAC-SHA1"
    let oauthNounce = "UbiNiy"
    let oauthVersion = "1.0"
    let oauthSignature = "vMeqt8TPejulMZYP5ZC4Vj1yw64"
    
    var oauthTimestamp:String {
        var stamp = Int(NSDate().timeIntervalSince1970 * 1000)
        return "\(stamp)"
    }
    
    // delegate
    var delegate:ClientDelegate?
    
    func searchCoordinate(#coordinate:CLLocationCoordinate2D){
        
        let baseYelpURL = "http://api.yelp.com/v2"
        
        var params:[String:AnyObject] = [
            "term": "food",
            "ll" : "\(coordinate.longitude),\(coordinate.longitude)"
        ]
        
        params = addOAuth1(params)
        
        var req:Request = Alamofire.request(Alamofire.Method.POST, baseYelpURL, parameters: params, encoding: .JSON)
        
        req.response({ (_,_,data,error) in
            
            if error == nil && data != nil {
            
                var json = SwiftyJSON.JSON(data!)
                
                debugPrint(json)
                    
            } else {
                println("There was an error")
            }
            
        })
        
        
    }
    
//    oauth_consumer_key=ruenG9kAyu7o1uV4GtIzwg&oauth_token=YcR6z-kGlorHZvQeLFBt3maRczd24q_c&oauth_signature_method=HMAC-SHA1&oauth_timestamp=1434903200&oauth_nonce=UbiNiy&oauth_version=1.0&oauth_signature=vMeqt8TPejulMZYP5ZC4Vj1yw64=
    
     func addOAuth1(oldParams:[String:AnyObject]) -> [String:AnyObject]{
        // add auth values
        
        var params = oldParams
        
        params.updateValue(yelpConsumerKey, forKey: "oauth_consumer_key")
        params.updateValue(yelpToken, forKey: "oauth_token")
        params.updateValue(oauthSignatureType, forKey: "oauth_signature_method")
        params.updateValue(oauthTimestamp, forKey: "oauth_timestamp")
        params.updateValue(oauthNounce, forKey: "oauth_nounce")
        params.updateValue(oauthSignature, forKey: "oauth_signature")
        
        return params
    }
    
   
}
