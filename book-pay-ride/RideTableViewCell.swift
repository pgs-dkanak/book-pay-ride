//
//  RideTableViewCell.swift
//  book-pay-ride
//
//  Created by pgs-dkanak on 25/10/16.
//  Copyright © 2016 pgs-dkanak. All rights reserved.
//

import UIKit

class RideTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var providerLogo: UIImageView!
    @IBOutlet weak var departureAndArrivalLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var numberOfStopsLabel: UILabel!
    
    var ride = Ride() {
        didSet {
            dowlnoadProviderImage()
            populateFields()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func populateFields() {
        departureAndArrivalLabel.text = departureAndArrival()
        priceLabel.text = "\u{20AC}\(ride.price)"
        durationLabel.text = rideDuration()
        numberOfStopsLabel.text = numberOfStops()
    }
    
    func departureAndArrival() -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH:mm"
        let departure = formatter.stringFromDate(ride.departureTime)
        let arrival = formatter.stringFromDate(ride.arrivalTime)
        return departure + " - " + arrival
    }
    
    func rideDuration() -> String {
         let components = NSCalendar.currentCalendar().components([.Hour, .Minute], fromDate: ride.departureTime, toDate: ride.arrivalTime, options: [])
        let result = "\(components.hour):\(components.minute > 9 ? "" : "0")\(components.minute)h"
        return result
    }
    
    func numberOfStops() -> String {
        if ride.numberOfStops == 0 {
            return "Direct"
        } else {
            return "\(ride.numberOfStops) stop\(ride.numberOfStops>1 ? "s" : "")"
        }
    }
    
    func dowlnoadProviderImage() {
        request(.GET, ride.providerLogoUrl).responseData {
            (request: NSURLRequest?, response: NSHTTPURLResponse?, result: Result<NSData>) in
            if let error = result.error {
                print("error: \(error)")
            } else if let imageData = result.value {
                let image = UIImage(data: imageData) ?? UIImage()
                self.providerLogo.image = image
            }
        }
    }
}
