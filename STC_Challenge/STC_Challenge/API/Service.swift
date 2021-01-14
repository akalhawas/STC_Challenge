//
//  Service.swift
//  STC_Challenge
//
//  Created by ali alhawas on 14/01/2021.
//

import UIKit

class Service {
    
    static let shared   = Service()
    let cache           = NSCache<NSString, UIImage>()
    
    func downloadImage(from urlString: String, complition: @escaping (Result<UIImage, HError>) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            DispatchQueue.main.async {
                complition(.success(image))
            }
            return
        }
        
        guard let url = URL(string: urlString) else {
            complition(.failure(.unableToComplete))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard let self = self else {
                complition(.failure(.unableToComplete))
                return
            }
            
            if let _ = error {
                complition(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                complition(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                complition(.failure(.invalidData))
                return
            }
            
            guard let image = UIImage(data: data) else {
                complition(.failure(.unableToComplete))
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            DispatchQueue.main.async {
                complition(.success(image))
            }

        }
        task.resume()
    }
}
