//
//  ViewController.swift
//  TalentIncubator
//
//  Created by Israel Velazquez on 6/6/18.
//  Copyright © 2018 Israel Velazquez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let eventServer = EventServer()
            eventServer.searchEvents()
            eventServer.getEventDetail(id: "G5vYZ4d2JzEA-", completion: nil)
    }

}

