//
//  RidesViewModel.swift
//  book-pay-ride
//
//  Created by pgs-dkanak on 24/10/16.
//  Copyright © 2016 pgs-dkanak. All rights reserved.
//

import Foundation
import UIKit

enum RideType : Int {
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
    private let apiManager = APIManager()
    private let disposeBag = DisposeBag()
    
    private var ridesVisibleType = RideType.train
    
    private var ridesVariable = Variable<[Ride]>([])
    var rides : [Ride] {
        return ridesVariable.value
    }
    var onRidesChanged : Observable<[Ride]>{
        return ridesVariable.asObservable()
    }
    
    func setRidesVisible(index: Int) {
        ridesVisibleType = RideType(n: index)
        requestRides(ridesVisibleType).subscribeNext {[weak self] (rides: [Ride]) in
            self?.ridesVariable.value = rides
        }.addDisposableTo(disposeBag)
    }
    
    func requestRides(type: RideType) -> Observable<[Ride]> {
        switch type {
        case .train:
            return apiManager.requestTrains()
        case .bus:
            return apiManager.requestBuses()
        case .flight:
            return apiManager.requestFlights()
        default:
            return Observable<[Ride]>()
        }
    }
}

