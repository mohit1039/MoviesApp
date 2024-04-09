//
//  URLImage.swift
//  MoviesApp
//
//  Created by Mohitkumar Gupta on 09/04/24.
//

import SwiftUI

struct URLImage: View {
    
    let url: String
    let placeholder: String
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String, placeholder: String = "placeholder") {
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.downloadImage(url: self.url)
    }
    
    var body: some View {
      
        if let data = self.imageLoader.downloadedData {
            return Image(uiImage: UIImage(data: data)!).resizable()
        } else {
            return Image("placeholder").resizable()
        }
        
    }
}


#Preview {
    URLImage(url: "https://fyrafix.files.wordpress.com/2011/08/url-8.jpg")
}
