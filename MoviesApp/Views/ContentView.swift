//
//  ContentView.swift
//  MoviesApp
//
//  Created by Mohitkumar Gupta on 08/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented = false
    
    @StateObject private var movieLVM = MovieListViewModel()
    
    private func genreSelected(vm: GenreViewModel) {
        switch vm.name {
        case "All":
            movieLVM.getAllMovies()
        default:
            movieLVM.getAllMovies(genre: vm.name)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                GenreSelectionView(onSelected: genreSelected)
                
                Spacer()
                
                if !movieLVM.movies.isEmpty {
                    MovieListView(movies: movieLVM.movies) { movieId in
                        movieLVM.deleteMovie(movieId: movieId)
                    }
                } else {
                    NoResultView(errorMessage: "No movies found")
                }
                Spacer()
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "plus") {
                        isPresented = true
                    }
                }
            })
        }
        .sheet(isPresented: $isPresented, onDismiss: {
            movieLVM.getAllMovies()
        }, content: {
            AddMovieScreen()
        })
        .onAppear(perform: {
            movieLVM.getAllMovies()
        })
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .padding()
        
    }
}

#Preview {
    ContentView()
}
