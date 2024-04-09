//
//  MovieListViewModel.swift
//  MoviesApp
//
//  Created by Mohitkumar Gupta on 08/04/24.
//

import Foundation
import MoviesAPI
class MovieListViewModel: ObservableObject {
    
    @Published var movies: [MovieViewModel] = []
    
    
    
    func deleteMovie(movieId: String) {
        Network.shared.apollo.perform(mutation: DeleteMovieMutation(movieId: movieId)){ [weak self] result in
            switch result {
            case .success(let grapghQLResult):
                self?.getAllMovies()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func getAllMovies(genre: String? = nil) {
        
        
        Network.shared.apollo.fetch(query: GetAllMoviesQuery(genre: GraphQLNullable(stringLiteral: genre ?? "")), cachePolicy: .fetchIgnoringCacheData) { [weak self] result in
            
            switch result {
            case .success(let grapghQLResult):
                guard let data = grapghQLResult.data, let movies = data.movies else {return}
                DispatchQueue.main.async {
                    self?.movies = movies.compactMap{ $0 }.map(MovieViewModel.init)
                }
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
}


struct MovieViewModel {
    
    let movie: GetAllMoviesQuery.Data.Movie
    
    var Id: String {
        movie.id
    }
    
    var title: String {
        movie.title
    }
    
    var year: String {
        movie.year
    }
    
    var genre: String {
        movie.genre
    }
    var poster: String {
        movie.poster
    }
    
}
