//
//  EventsRequest.swift
//  TalentIncubator
//
//  Created by Israel Velazquez on 6/6/18.
//  Copyright © 2018 Israel Velazquez. All rights reserved.
//

import Foundation
import Alamofire

public enum EventsRequest: URLRequestConvertible {

    case eventDetails(id: String)
    case searchEvents(geoHash: String?, keyword: String?)
    
    public var baseURL: URL {
        return URL(string: "https://app.ticketmaster.com/discovery/v2")!
    }
    
    public var path: String {
        var path = ""
        switch self {
        case .eventDetails(id: let id):
            path = "/events/" + id + ".json"
        case .searchEvents(geoHash: _, keyword: _):
            path = "/events.json"
        }
        return path
    }
    
    public var httpMethod: HTTPMethod {
        return .get
    }
    
    public var parameters: [String:Any]? {
        var params = [String:Any]()
        switch self {
        case .eventDetails(id: _):
            break
        case .searchEvents(geoHash: let geoHash, keyword: let keyword):
            if let geoHash =  geoHash {
                params["geoPoint"] = geoHash
            }
            if let keyword = keyword {
                params["keyword"] = keyword
            }
        }
        params["apikey"] = "snAkE6OaeSX8y1DUyDeiGJBMGrO5AvLk"
        return params
    }
    
    public func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        let encoding: ParameterEncoding = URLEncoding.default
        
        return try encoding.encode(urlRequest, with: self.parameters)
    }

}
