//
//  ImageWithURL.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 7.06.21.
//

import SwiftUI

struct ImageWithURL: View {
    var sideSquare: CGFloat { getRect().width - 40 }
    @ObservedObject var imageLoader: ImageLoaderAndCache
    
    init(_ url: String) {
        imageLoader = ImageLoaderAndCache(imageURL: url)
    }
    
    var body: some View {
        Image(uiImage: UIImage(data: imageLoader.imageData) ?? UIImage())
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: sideSquare, maxHeight: sideSquare)
            .clipped()
            .background(BlurViewLight())
            .cornerRadius(25)
    }
}
