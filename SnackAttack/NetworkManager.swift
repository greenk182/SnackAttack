//
//  NetworkManager.swift
//  SnackAttack
//
//  Created by Kevin Green on 5/4/25.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://2bn6z84h04.execute-api.us-east-1.amazonaws.com/"
    private let snackURL = baseURL + "products"
    
    private init() {}
    
    func getSnacks(completed: @escaping (Result<[Snack], SNError>) -> Void) {
        guard let url = URL(string: snackURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let snacks = try decoder.decode([Snack].self, from: data)
                completed(.success(snacks))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
