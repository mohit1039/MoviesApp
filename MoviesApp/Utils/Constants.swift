//
//  Constants.swift
//  MoviesApp
//
//  Created by Mohitkumar Gupta on 09/04/24.
//

import Foundation

struct Constants {
    
    struct Keys {
        static let apiKey = "25402691"
    }
    
    struct Urls {
        
        static func urlByMovieName(name: String) -> URL? {
            return URL(string: "http://www.omdbapi.com/?s=\(name)&page=2&apikey=\(Keys.apiKey)")
        }
    }
}
