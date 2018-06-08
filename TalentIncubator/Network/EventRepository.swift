//
//  EventRepository.swift
//  TalentIncubator
//
//  Created by Israel Velazquez on 6/6/18.
//  Copyright © 2018 Israel Velazquez. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

protocol EventRepository {
    typealias EventsCompletion = ((_ events: [EventResponseModel], _ error: Error?) -> ())
    typealias EventDetailCompletion = ((_ events: EventResponseModel?, _ error: Error?) -> ())

    func getEventDetail(id: String, completion: EventDetailCompletion?)
    func searchEvents(geoHash: String?, keyword: String?, completion: EventsCompletion?)
}

extension EventRepository {
    func searchEvents(geoHash: String? = nil, keyword: String? = nil, completion: EventsCompletion? = nil) {
        self.searchEvents(geoHash: geoHash,keyword: keyword, completion: completion)
    }
}

class EventServer: EventRepository {
    
    func getEventDetail(id: String, completion: EventDetailCompletion?) {
        Alamofire.request(EventsRequest.eventDetails(id: id))
            .responseJSON { (response) in
                switch response.result {
                case .success(let data):
                    if let event = Mapper<EventResponseModel>().map(JSONObject: data) {
                        completion?(event, nil)
                    }
                case .failure(let error):
                    completion?(nil, error)
                }
        }
    }
    
    func searchEvents(geoHash: String?, keyword: String?, completion: EventsCompletion? ) {
        Alamofire.request(EventsRequest.searchEvents(geoHash: geoHash, keyword: keyword))
            .responseJSON { (response) in
                switch response.result {
                case .success(let data):
                    if let data = data as? [String: [String: Any]],
                        let _embedded = data["_embedded"],
                        let events = Mapper<EventResponseModel>().mapArray(JSONObject: _embedded["events"]) {
                        completion?(events, nil)
                        print(events)
                    }
                case .failure(let error):
                    completion?([], error)
                }
        }
    }
}
