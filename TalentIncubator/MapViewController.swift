//
//  ViewController.swift
//  TalentIncubator
//
//  Created by Israel Velazquez on 6/6/18.
//  Copyright © 2018 Israel Velazquez. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    let viewModel = EventsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        viewModel.getEvents()
    }

}

