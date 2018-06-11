//
//  TalentIncubatorTests.swift
//  TalentIncubatorTests
//
//  Created by Israel Velazquez on 6/6/18.
//  Copyright © 2018 Israel Velazquez. All rights reserved.
//

import XCTest
@testable import TalentIncubator

class TalentIncubatorTests: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testServerGetEvents() {
        fetchEvents(eventRepository: EventServer())
    }
    
    func fetchEvents(eventRepository: EventRepository) {
        let expectation = XCTestExpectation(description: "Get Events")
        eventRepository.searchEvents { (events, error) in
            XCTAssertNotNil(events, "No data receive from the repository")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
}
