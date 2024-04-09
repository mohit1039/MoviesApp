//
//  Network.swift
//  MoviesApp
//
//  Created by Mohitkumar Gupta on 08/04/24.
//

import Foundation
import Apollo
class Network {
    static let shared: Network = Network()
    
    private init() {}
    
    lazy var apollo = ApolloClient(url: URL(string: "http://localhost:4000")!)
}
