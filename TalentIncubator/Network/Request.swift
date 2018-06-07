//
//  Request.swift
//  TalentIncubator
//
//  Created by Israel Velazquez on 6/6/18.
//  Copyright © 2018 Israel Velazquez. All rights reserved.
//

import Foundation

public enum DataType {
    case JSON
    case data
}

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}


public protocol Request {
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var parameters: [String:Any]? { get }
    var headers: [String:Any]? { get }
    var dataType: DataType { get }
}
