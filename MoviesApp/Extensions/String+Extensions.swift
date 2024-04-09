//
//  String+Extensions.swift
//  MoviesApp
//
//  Created by Mohitkumar Gupta on 09/04/24.
//

import Foundation
extension String {
    
    func encoded() -> String {
        self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
