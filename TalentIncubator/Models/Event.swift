//
//  Event.swift
//  TalentIncubator
//
//  Created by Israel Velazquez on 6/6/18.
//  Copyright © 2018 Israel Velazquez. All rights reserved.
//

import Foundation
import ObjectMapper

struct Event: Mappable {
    var name: String
    var id: String
    var eventURLString: String
    var imageURL: String?
    var startDate: String
    var endDate: String?
    var info: String?
    var priceRanges: Any?
    var venues: [Venue]
    
    init?(map: Map) {
        guard let name: String = map["name"].value(),
            let id: String = map["id"].value(),
            let eventURLString: String = map["url"].value(),
            let startDate: String = map["dates.start.dateTime"].value(),
            let venues: [Venue] = Mapper<Venue>().mapArray(JSONObject: map["_embedded.venues"].value())
        else {
            return nil
        }
        self.name = name
        self.id = id
        self.eventURLString = eventURLString
        self.startDate = startDate
        self.venues = venues
    }
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        id <- map["id"]
        eventURLString <- map["url"]
        startDate <- map["dates.start.dateTime"]
        endDate <- map["dates.end.dateTime"]
        info <- map["info"]
        venues <- map["_embedded.venues"]

        
    }
    
}
