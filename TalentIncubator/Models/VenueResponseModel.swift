//
//  Venue.swift
//  TalentIncubator
//
//  Created by Israel Velazquez on 6/6/18.
//  Copyright © 2018 Israel Velazquez. All rights reserved.
//

import Foundation
import ObjectMapper

public struct VenueResponseModel {
    public var name: String
    public var id: String
    public var postalCode: String
    public var city: String
    public var state: String
    public var country: String
    public var address: String
}

extension VenueResponseModel: Mappable {
    public init?(map: Map) {
        guard let name: String = map["name"].value(),
            let id: String = map["id"].value(),
            let postalCode: String = map["postalCode"].value(),
            let city: String = map["city.name"].value(),
            let state: String = map["state.name"].value(),
            let country: String = map["country.name"].value(),
            let address: String = map["address.line1"].value()
        else {
            return nil
        }
        self.name = name
        self.id = id
        self.postalCode = postalCode
        self.city = city
        self.state = state
        self.country = country
        self.address = address
    }
    
    public mutating func mapping(map: Map) {
        name <- map["name"]
        id <- map["id"]
        postalCode <- map["postalCode"]
        city <- map["city.name"]
        state <- map["state.name"]
        country <- map["country.name"]
        address <- map["address.line1"]
    }
    
}

