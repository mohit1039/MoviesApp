//
//  GenreSelectionView.swift
//  MoviesApp
//
//  Created by Mohitkumar Gupta on 09/04/24.
//

import SwiftUI
import MoviesAPI

struct GenreSelectionView: View {
    let onSelected: (GenreViewModel) -> Void
    @State private var selectedGenre: GenreViewModel = GenreViewModel.defaultGenre
    @StateObject private var genreVM = GenreListViewModel()
    var ignoreGenres: [String]?
    
    func prepareGenres() -> [GenreViewModel] {
        guard let ignoreGenres = ignoreGenres else { return genreVM.genres }
        
        return genreVM.genres.filter{ !ignoreGenres.contains($0.name) }
    }
    
    
    var body: some View {
        Picker("Select", selection: $selectedGenre) {
            ForEach(prepareGenres(),id: \.id){ genre in
                Text(genre.name).tag(genre)
            }
        }.pickerStyle(.segmented)
            .onAppear(perform: {
                genreVM.getAllGenres()
            })
            .onChange(of: selectedGenre) { oldValue, newValue in
                onSelected(newValue)
            }
    }
}

#Preview {
    GenreSelectionView(onSelected: {_ in })
}
