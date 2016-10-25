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

enum SortType {
    case arrivals
    case departures
    
    func name() -> String {
        switch self {
        case .arrivals:
            return "Arrivals"
        case .departures:
            return"Departures"
        }
    }
    
    func nextType() -> SortType {
        switch self {
        case .arrivals:
            return .departures
        case .departures:
            return .arrivals
        }
    }
}

class RidesViewModel {
    private let apiManager = APIManager()
    private let disposeBag = DisposeBag()
    
    private var ridesVisibleType = RideType.train
    var sortType = SortType.departures
    
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
    
    func changeSortCriteria() {
        sortType = sortType.nextType()
        sortRides()
    }
    
    func sortRides() {
        switch sortType {
        case .arrivals:
            ridesVariable.value = rides.sort { $0.0.arrivalTime.compare($0.1.arrivalTime) == NSComparisonResult.OrderedAscending }
        case .departures:
            ridesVariable.value = rides.sort { $0.0.departureTime.compare($0.1.departureTime) == NSComparisonResult.OrderedAscending }
        }
    }
}

