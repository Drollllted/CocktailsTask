//
//  WelcomeJSON.swift
//  CocktailsApp
//
//  Created by Drolllted on 04.08.2025.
//

import Foundation

struct CocktailJSON: Codable {
    let name: String
    let ingredients: [String]
    let instructions: String
}
