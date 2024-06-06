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
            "/filter.php?c=Dessert"
        case .mealDetail(let id):
            "/lookup.php?i=\(id)"
        }
    }
    
    var method: RequestMethod {
        .get
    }
}
