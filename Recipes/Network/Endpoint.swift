//
//  Endpoint.swift
//  Recipes
//
//  Created by Andrew Shon on 6/6/24.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
}

extension Endpoint {
    var scheme: String {
        "https"
    }
    
    var host: String {
        "themealdb.com"
    }
    
    var header: [String : String]? {
        nil
    }
    
    var body: [String : String]? {
        nil
    }
}
