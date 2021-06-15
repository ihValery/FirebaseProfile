//
//  ImageWithURL.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 7.06.21.
//

import SwiftUI

struct ImageWithURL: View {
    @ObservedObject var imageLoader: ImageLoaderAndCache
    
    init(_ url: String) {
        imageLoader = ImageLoaderAndCache(imageURL: url)
    }
    
    var body: some View {
        Image(uiImage: UIImage(data: imageLoader.imageData) ?? UIImage())
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 120, height: 120)
            .background(BlurViewLight())
            .clipped()
            .cornerRadius(25)
    }
}
