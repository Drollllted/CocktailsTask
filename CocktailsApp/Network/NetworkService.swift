//
//  NetworkService.swift
//  CocktailsApp
//
//  Created by Drolllted on 04.08.2025.
//

import Foundation


final class NetworkService {
    
    static let shared = NetworkService()
    let url = "https://api.api-ninjas.com/v1/cocktail?name="
    let apiKey = "er483/072QGJ8Y+cyVY9ZA==BtxTfeHFd2FLF6jx"
    
    private init(){}
    
    func fetchCocktails(name: String, completion: @escaping (Result<[CocktailJSON], Error>) -> Void) {
        guard let encodedName = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: url + encodedName) else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue(apiKey, forHTTPHeaderField: "X-Api-Key")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            do {
                let cocktails = try JSONDecoder().decode([CocktailJSON].self, from: data)
                completion(.success(cocktails))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
