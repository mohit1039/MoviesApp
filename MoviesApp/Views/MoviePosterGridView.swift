//
//  MoviePosterGridView.swift
//  MoviesApp
//
//  Created by Mohitkumar Gupta on 09/04/24.
//

import SwiftUI

struct MoviePosterGridView: View {
    let posters: [PosterViewModel]
    @Binding var selectedPoster: String
    
    func isSelectedPoster(poster: String) -> Bool {
        return selectedPoster == poster
    }
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())], content: {
            ForEach(posters, id: \.id) { poster in
                VStack {
                    URLImage(url:  poster.poster)
                        .frame(width: 100, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 16.0, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                        .onTapGesture {
                            selectedPoster = poster.poster
                        }
                        .shadow(color: .gray, radius: 6, x: 8, y: 8)
                        .shadow(color: .white, radius: 6, x: -8, y: -8)
                        .overlay(
                            
                                ZStack {
                                    
                                    Rectangle()
                                        .fill(Color(#colorLiteral(red: 0.1731345952, green: 0.2430219054, blue: 0.313616395, alpha: 1)))
                                  
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.white)
                                }
                                .frame(maxHeight: isSelectedPoster(poster: poster.poster) ? 44: 0)
                                .clipped()
                                .animation(.spring())
                               
                            
                            , alignment: .bottom)
                        
                }
            }
        })
    }
}

#Preview {
    MoviePosterGridView(posters: [PosterViewModel(movie: Movie(title: "MkG", year: "1998", poster: "plus", imdbId: "1"))], selectedPoster: .constant("S"))
}
