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
    
    var id              : Int = 0
    var providerLogoUrl : String = ""
    var price           : Float = 0.0
    var departureTime   : String = ""
    var arrivalTime     : String = ""
    var numberOfStops   : Int = 0
    
    func populate(dictionary: NSDictionary) {
        id              = dictionary[Key.id] as? Int ?? id
        providerLogoUrl = dictionary[Key.provider_logo] as? String ?? providerLogoUrl
        price           = dictionary[Key.price_in_euros] as? Float ?? price
        departureTime   = dictionary[Key.departure_time] as? String ?? departureTime
        arrivalTime     = dictionary[Key.arrival_time] as? String ?? arrivalTime
        numberOfStops   = dictionary[Key.number_of_stops] as? Int ?? numberOfStops
    }
}