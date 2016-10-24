//
//  APIManager.swift
//  book-pay-ride
//
//  Created by pgs-dkanak on 25/10/16.
//  Copyright © 2016 pgs-dkanak. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    
    let flightsUrl = "https://api.myjson.com/bins/w60i"
    
    func requestFlights() {
        
        request(.GET, flightsUrl).responseJSON { (request: NSURLRequest?, response: NSHTTPURLResponse?, result: Result<AnyObject>) in
            if let json = result.value {
                print(json)
//                let mapper = Mapper<Flight>()
//                let flights = mapper.mapArray(JSONObject: json)
//                print(flights)
            }
        }
        
    }
}