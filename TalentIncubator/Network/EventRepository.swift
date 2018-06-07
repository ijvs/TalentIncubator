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
    typealias EventsComplenition = ((_ events: [Event], _ error: Error?) -> ())
    func getEventDetail(id: String)
    func searchEvents(geoHash: String?, keyword: String?, complenition: EventsComplenition?)
}

extension EventRepository {
    func searchEvents(geoHash: String? = nil, keyword: String? = nil, complenition: EventsComplenition? = nil) {
        self.searchEvents(geoHash: geoHash,keyword: keyword, complenition: complenition)
    }
}

class EventServer: EventRepository {
    
    func getEventDetail(id: String) {
        Alamofire.request(EventsRequest.eventDetails(id: id))
            .responseJSON { (response) in
                switch response.result {
                case .success(let data):
                    print(data)
                case .failure(let error):
                    print(error)
                }
        }
    }
    
    func searchEvents(geoHash: String?, keyword: String?, complenition: EventsComplenition? ) {
        Alamofire.request(EventsRequest.searchEvents(geoHash: geoHash, keyword: keyword))
            .responseJSON { (response) in
                switch response.result {
                case .success(let data):
                    if let data = data as? [String: [String: Any]],
                        let _embedded = data["_embedded"],
                        let events = Mapper<Event>().mapArray(JSONObject: _embedded["events"]) {
                        complenition?(events, nil)
                        print(events)
                    }
                case .failure(let error):
                    complenition?([], error)
                }
        }
    }
}
