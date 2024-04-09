//
//  AddMovieScreen.swift
//  MoviesApp
//
//  Created by Mohitkumar Gupta on 08/04/24.
//

import SwiftUI
struct AddMovieScreen: View {
    
    @StateObject private var addMovieVM = AddMovieViewModel()
    
    @Environment (\.presentationMode) private var presentationMode
    
    var body: some View {
        NavigationView {
            Form(content: {
                TextField("Name", text: $addMovieVM.name)
                    .onSubmit {
                        addMovieVM.fetchPosterByMovieName(name: addMovieVM.name.encoded())
                    }
                TextField("Year", text: $addMovieVM.year)
                GenreSelectionView(onSelected: { vm in
                    addMovieVM.genre = vm.name
                }, ignoreGenres: ["All"])
                MoviePosterGridView(posters: addMovieVM.posterVM, selectedPoster: $addMovieVM.poster)
                
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        addMovieVM.addMovie {
                            presentationMode.wrappedValue.dismiss()
                        }
                    } label: {
                        Image(systemName: "checkmark")
                    }
                }
            }
        }
        .navigationTitle("Add New Movie")
    }
}

#Preview {
    AddMovieScreen()
}
