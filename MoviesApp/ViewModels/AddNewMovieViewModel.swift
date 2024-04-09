//
//  AddNewMovieViewModel.swift
//  MoviesApp
//
//  Created by Mohitkumar Gupta on 09/04/24.
//

import Foundation
import MoviesAPI

class AddMovieViewModel: ObservableObject {
    @Published var posterVM : [PosterViewModel] = []
    var name: String = ""
    var year: String = ""
    @Published var poster: String = ""
    var genre: String = ""
    
    
    
    func fetchPosterByMovieName(name: String) {
        Webservice().getMovieByName(name: name) {[weak self] (result) in
            switch result {
            case .success(let movies):
                DispatchQueue.main.async {
                    self?.posterVM = movies.map(PosterViewModel.init)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func addMovie (completion: @escaping () -> Void) {
        let movie = MovieInput(title: name, year: year, genre: genre, poster: poster)
        Network.shared.apollo.perform(mutation: AddMovieMutation(movie: GraphQLNullable(movie))) { result in
            switch result {
            case .success(_):
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct PosterViewModel {
    let movie: Movie
    
    let id = UUID()
    
    var title: String {
        movie.title
    }
    
    var poster: String {
        movie.poster
    }
}
