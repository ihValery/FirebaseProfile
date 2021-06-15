//
//  BeautifulBgUrl.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 8.06.21.
//

import SwiftUI

struct BeautifulBgUrl: View {
    @ObservedObject var imageLoader: ImageLoaderAndCache
    
    init(_ url: String) {
        imageLoader = ImageLoaderAndCache(imageURL: url)
    }
    
    var body: some View {
        ZStack {
            Image(uiImage: UIImage(data: imageLoader.imageData) ?? UIImage())
                .resizable()
        }
        .overlay(BlurViewDark())
        .ignoresSafeArea()
    }
}
