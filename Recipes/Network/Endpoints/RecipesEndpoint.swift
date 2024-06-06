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
        switch self {
        case .meals:
            "/api/json/v1/1/filter.php" // ?c=Dessert
        case .mealDetail(let id):
            "/api/json/v1/1/lookup.php?i=\(id)"
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
        default:
            return nil
        }
    }
}
