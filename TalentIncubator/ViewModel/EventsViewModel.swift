//
//  EventsViewModel.swift
//  TalentIncubator
//
//  Created by Israel Velazquez on 6/8/18.
//  Copyright © 2018 Israel Velazquez. All rights reserved.
//

import Foundation
import CoreLocation

public protocol EventsViewModelDelegate: class {
}

public class EventsViewModel {
    
    private let eventRepository: EventRepository
    weak var delegate: EventsViewModelDelegate?
    
    init(repository:EventRepository? = EventServer()) {
        eventRepository = repository!
    }
    
//    func getEvents()  {
//        let geocoder = CLGeocoder()
//
//        eventRepository.searchEvents { (events, error) in
//            if let error = error {
//                //call delegate with error
//                return
//            }
//
//            let venues = events.flatMap({ $0.venues })
//            venues.forEach({ (venue) in
//                geocoder.geocodeAddressString("\(venue.address), \(venue.postalCode), \(venue.city), \(venue.country)", completionHandler: { (locations, error) in
//                    if let point = locations?.first {
////                        venue.latitude = point.location?.coordinate.latitude
////                        venue.longitude = point.location?.coordinate.longitude
//                        print("\(venue.address), \(venue.postalCode), \(venue.city), \(venue.country)")
//                        print("\(point.location?.coordinate.latitude), \(point.location?.coordinate.longitude)")
//                    }
//                })
//            })
//        }
//    }
}

