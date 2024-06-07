//
//  RecipesEndpoint.swift
//  Recipes
//
//  Created by Andrew Shon on 6/6/24.
//

import Foundation

enum RecipesEndpoint {
    case meals
    case mealDetail(id: String)
}

extension RecipesEndpoint: Endpoint {
    var path: String {
        let prefix = "/api/json/v1/1/"
        switch self {
        case .meals:
            return "\(prefix)filter.php"
        case .mealDetail:
            return "\(prefix)lookup.php"
        }
    }
    
    var method: RequestMethod {
        .get
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .meals:
            return [
                .init(name: "c", value: "Dessert")
            ]
        case .mealDetail(let id):
            return [
                .init(name: "i", value: id)
            ]
        }
    }
}
