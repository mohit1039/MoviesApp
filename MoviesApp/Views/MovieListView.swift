//
//  MovieListView.swift
//  MoviesApp
//
//  Created by Mohitkumar Gupta on 08/04/24.
//

import SwiftUI
import MoviesAPI

struct MovieListView: View {
    
    let movies : [MovieViewModel]
    var onDeleteMovie: ((String) -> Void)?
    private func deleteMovie(at indexSet: IndexSet) {
        indexSet.forEach { index in
            let movie = movies[index]
            if let onDeleteMovie = onDeleteMovie {
                onDeleteMovie(movie.Id)
            }
        }
    }
    var body: some View {
        List {
            ForEach(movies, id: \.Id) { movie in
                HStack {
                    if let url = URL(string: movie.poster) {
                        AsyncImage(url: url)
                            .frame(width: 100, height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 16.0, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                    } else {
                        Image(systemName: "video")
                    }
                    
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .padding(.top, 10)
                            .font(.headline)
                        Text(movie.year)
                            .font(.caption)
                        
                        HStack {
                            Text(movie.genre)
                                .font(.caption)
                                .foregroundColor(.black)
                                .padding(8)
                            
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 0.5)
                        )
                        
                        Spacer()
                    }
                }
            }.onDelete(perform: deleteMovie)
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    MovieListView(movies: [MovieViewModel(movie: GetAllMoviesQuery.Data.Movie(_dataDict: DataDict(data: ["title": "Title"], fulfilledFragments: [])))])
}
