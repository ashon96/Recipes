//
//  RecipeImageView.swift
//  Recipes
//
//  Created by Andrew Shon on 6/6/24.
//

import SwiftUI

struct RecipeImageView: View {
    let imageLink: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageLink)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if phase.error != nil {
                Text("Failed to load image")
            } else {
                ProgressView()
            }
        }
    }
}

//#Preview {
//    RecipeImageView()
//}
