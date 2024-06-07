//
//  APIClient.swift
//  Recipes
//
//  Created by Andrew Shon on 6/6/24.
//

import Foundation

protocol APIClient {
    func sendRequest<T: Decodable>(
        endpoint: Endpoint,
        responseModel: T.Type
    ) async throws -> T
}

class NetworkClient: APIClient {
    func sendRequest<T: Decodable>(
        endpoint: Endpoint,
        responseModel: T.Type
    ) async throws -> T {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        urlComponents.queryItems = endpoint.queryItems
                
        guard let url = urlComponents.url else {
            throw RequestError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header

        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
        guard let response = response as? HTTPURLResponse else {
            throw RequestError.noResponse
        }
        switch response.statusCode {
        case 200...299:
            guard let processedRes = try? JSONDecoder().decode(responseModel, from: data) else {
                throw RequestError.decode
            }
            return processedRes
        case 401:
            throw RequestError.unauthorized
        default:
            throw RequestError.unexpectedStatusCode
        }

    }
}


class MockAPIClient: APIClient {
    func sendRequest<T>(endpoint: Endpoint, responseModel: T.Type) async throws -> T where T : Decodable {
        switch endpoint {
        case RecipesEndpoint.meals:
            let meals = [
                Meal(strMeal: "test 1", strMealThumb: "image 1", idMeal: "1"),
                Meal(strMeal: "test 2", strMealThumb: "image 2", idMeal: "2")
            ]
            return MealContainer(meals: meals) as! T
        case let RecipesEndpoint.mealDetail(id: id):
            // Mocked meal detail data
            let mealDetail = MealDetail(idMeal: "1", strMeal: "test 1", strDrinkAlternate: "", strCategory: "", strArea: "", strInstructions: "", strMealThumb: "", strTags: "", strYoutube: "", strIngredient1: "", strIngredient2: "", strIngredient3: "", strIngredient4: "", strIngredient5: "", strIngredient6: "", strIngredient7: "", strIngredient8: "", strIngredient9: "", strIngredient10: "", strIngredient11: "", strIngredient12: "", strIngredient13: "", strIngredient14: "", strIngredient15: "", strIngredient16: "", strIngredient17: "", strIngredient18: "", strIngredient19: "", strIngredient20: "", strMeasure1: "", strMeasure2: "", strMeasure3: "", strMeasure4: "", strMeasure5: "", strMeasure6: "", strMeasure7: "", strMeasure8: "", strMeasure9: "", strMeasure10: "", strMeasure11: "", strMeasure12: "", strMeasure13: "", strMeasure14: "", strMeasure15: "", strMeasure16: "", strMeasure17: "", strMeasure18: "", strMeasure19: "", strMeasure20: "", strSource: "", strImageSource: "", strCreativeCommonsConfirmed: "", dateModified: "")
            let mealContainer = MealContainer(meals: [mealDetail])
            return mealContainer as! T
        default:
            fatalError("Unhandled endpoint")
        }
    }
}
