//
//  NetworkService.swift
//  Quilix-cs-ios
//
//  Created by Алексей Авдейчик on 1.02.22.
//

import UIKit

class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    func getPosts(completion: @escaping (Result<[Post], Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/photos"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let obj = try JSONDecoder().decode([Post].self, from: data!)
                completion(.success(obj))
                
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
