//
//  CocktailsViewModel.swift
//  CocktailsApp
//
//  Created by Drolllted on 04.08.2025.
//

import Foundation
import SwiftUI

final class CocktailsViewModel: ObservableObject {
    
    var cocktails = [CocktailJSON]()
    let networkService = NetworkService.shared
    
    func setupJSON() {
        networkService.fetchCocktails(name: "bloody mary") { result in
            switch result {
                
            case .success(let cocktails):
                self.cocktails = cocktails
                print(cocktails)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

