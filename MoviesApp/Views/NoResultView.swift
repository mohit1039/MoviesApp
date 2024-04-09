//
//  NoResultView.swift
//  MoviesApp
//
//  Created by Mohitkumar Gupta on 08/04/24.
//

import SwiftUI

struct NoResultView: View {
    let errorMessage: String
    var body: some View {
        
        Text(errorMessage)
    }
}

#Preview {
    NoResultView(errorMessage: "No Result Found")
}
