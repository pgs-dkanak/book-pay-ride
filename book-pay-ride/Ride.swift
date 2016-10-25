//
//  Ride.swift
//  book-pay-ride
//
//  Created by pgs-dkanak on 25/10/16.
//  Copyright © 2016 pgs-dkanak. All rights reserved.
//

import Foundation

class Ride {
    
    struct Key {
        static let id = "id"
        static let provider_logo = "provider_logo"
        static let price_in_euros = "price_in_euros"
        static let departure_time = "departure_time"
        static let arrival_time = "arrival_time"
        static let number_of_stops = "number_of_stops"
    }

    static let defaultTimeFormat = "HH:mm"
    
    let preferredImageSize = 63
    var id              : Int = 0
    var providerLogoUrl : String = ""
    var price           : Float = 0.0
    var departureTime   : NSDate = NSDate()
    var arrivalTime     : NSDate = NSDate()
    var numberOfStops   : Int = 0
    
    
    func populate(dictionary: NSDictionary) {
        id              = dictionary[Key.id] as? Int ?? id
        providerLogoUrl = insert(dictionary[Key.provider_logo] as? String ?? providerLogoUrl, size: preferredImageSize)
        price           = dictionary[Key.price_in_euros] as? Float ?? price
        departureTime   = dateFromString(dictionary[Key.departure_time] as? String ?? "")
        arrivalTime     = dateFromString(dictionary[Key.arrival_time] as? String ?? "")
        numberOfStops   = dictionary[Key.number_of_stops] as? Int ?? numberOfStops
    }
    
    func dateFromString(dateString: String) -> NSDate {
        let formatter = NSDateFormatter()
        formatter.dateFormat = Ride.defaultTimeFormat
        let result = formatter.dateFromString(dateString) ?? NSDate()
        return result
    }
    
    func insert(urlString: String, size: Int) -> String {
        var result = urlString.stringByReplacingOccurrencesOfString("{size}", withString: "\(size)")
        result = result.stringByReplacingOccurrencesOfString("http", withString: "https")
        return result
    }
}