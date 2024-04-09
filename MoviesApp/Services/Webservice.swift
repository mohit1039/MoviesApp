//
//  Webservice.swift
//  MoviesApp
//
//  Created by Mohitkumar Gupta on 09/04/24.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

class Webservice {
    
    func getMovieByName(name: String, completion: @escaping (Result<[Movie],NetworkError>) -> Void) {
        
        guard let url = Constants.Urls.urlByMovieName(name: name)  else { completion(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url){ (data, _, error) in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
            if let movieResponse = movieResponse {
                completion(.success(movieResponse.movies))
            } else {
                completion(.failure(.decodingError))
            }
            
        }.resume()
        
    }
    
}
