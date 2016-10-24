//
//  RidesViewModel.swift
//  book-pay-ride
//
//  Created by pgs-dkanak on 24/10/16.
//  Copyright © 2016 pgs-dkanak. All rights reserved.
//

import Foundation
import UIKit

enum Ride : Int {
    case train = 0
    case bus = 1
    case flight = 2
    case unknown = 1000
    
    init(n: Int) {
        switch n {
        case 0:
            self = .train
        case 1:
            self = .bus
        case 2:
            self = .flight
        default:
            self = .unknown
        }
    }
}

class RidesViewModel {
    var ridesVisible = Ride.train
    
    
    
    
}

