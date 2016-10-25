//
//  APIManager.swift
//  book-pay-ride
//
//  Created by pgs-dkanak on 25/10/16.
//  Copyright © 2016 pgs-dkanak. All rights reserved.
//

import Foundation

class APIManager {
    let flightsUrl = "https://api.myjson.com/bins/w60i"
    let trainsUrl  = "https://api.myjson.com/bins/3zmcy"
    let busesUrl   = "https://api.myjson.com/bins/37yzm"
    
    func requestFlights() -> Observable<[Ride]> {
        return reuqestRides(flightsUrl)
    }
    func requestTrains() -> Observable<[Ride]> {
        return reuqestRides(trainsUrl)
    }
    func requestBuses() -> Observable<[Ride]> {
        return reuqestRides(busesUrl)
    }
    
    private func reuqestRides(urlString: URLStringConvertible) -> Observable<[Ride]> {
        return Observable.create({ (subscriber: AnyObserver<[Ride]>) -> Disposable in
            let req = request(.GET, urlString).responseJSON {
                (request: NSURLRequest?, response: NSHTTPURLResponse?, result: Result<AnyObject>) in
                if let error = result.error {
                    subscriber.onError(error)
                } else if let json = result.value {
                    let jsonTable = json as? NSArray ?? []
                    let rides = self.createRidesArray(jsonTable) ?? []
                    subscriber.onNext(rides)
                }
            }
            return AnonymousDisposable({
                req.cancel()
            })
        })
    }
    
    private func createRidesArray(jsonTable: NSArray) -> [Ride] {
        var rides = [Ride]()
        for element in jsonTable {
            let ride = Ride()
            let dictionary = element as? NSDictionary ?? NSDictionary()
            ride.populate(dictionary)
            rides.append(ride)
        }
        return rides
    }
    
}