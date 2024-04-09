//
//  GenreListViewModel.swift
//  MoviesApp
//
//  Created by Mohitkumar Gupta on 09/04/24.
//

import Foundation
import MoviesAPI
class GenreListViewModel: ObservableObject {
    
    @Published var genres: [GenreViewModel] = []
    
    func getAllGenres() {
        
        
        Network.shared.apollo.fetch(query: GetGenreQuery()) { [weak self] result in
            
            switch result {
            case .success(let grapghQLResult):
                guard let data = grapghQLResult.data, let genres = data.genres else {return}
                DispatchQueue.main.async {
                    self?.genres = genres.compactMap{ $0 }.map(GenreViewModel.init)
                }
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
}


struct GenreViewModel: Identifiable, Hashable {
    
    
    fileprivate let genre: GetGenreQuery.Data.Genre?
    
    let id = UUID()
    
    public static func == (lhs: GenreViewModel, rhs: GenreViewModel) -> Bool {
        return lhs.genre == rhs.genre
    }
    
    var name: String {
        genre?.name ?? "ALL"
    }
    
    static var defaultGenre: GenreViewModel {
        return GenreViewModel(genre:  GetGenreQuery.Data.Genre(_dataDict:DataDict(data: ["name":"All"], fulfilledFragments: [])))
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
}
