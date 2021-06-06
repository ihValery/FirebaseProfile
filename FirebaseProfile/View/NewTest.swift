//
//  NewTest.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 6.06.21.
//

import SwiftUI

struct NewTest: View {
    var body: some View {
        ImageWithURL("https://firebasestorage.googleapis.com:443/v0/b/usingfirebaseauthentication.appspot.com/o/avatars%2FSrjvzGeD0Fe5VczWsNqX3IiuGr12?alt=media&token=92c404c5-0c24-467b-9afa-fde471faef5d")
    }
}

struct NewTest_Previews: PreviewProvider {
    static var previews: some View {
        NewTest()
    }
}

struct ImageWithURL: View {
    @ObservedObject var imageLoader: ImageLoaderAndCache

    init(_ url: String) {
        imageLoader = ImageLoaderAndCache(imageURL: url)
    }

    var body: some View {
          Image(uiImage: UIImage(data: self.imageLoader.imageData) ?? UIImage())
              .resizable()
              .clipped()
    }
}

class ImageLoaderAndCache: ObservableObject {
    @Published var imageData = Data()
    
    init(imageURL: String) {
        let cache = URLCache.shared
        let request = URLRequest(url: URL(string: imageURL)!, cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 60.0)
        if let data = cache.cachedResponse(for: request)?.data {
            print("got image from cache")
            self.imageData = data
        } else {
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data, let response = response {
                let cachedData = CachedURLResponse(response: response, data: data)
                                    cache.storeCachedResponse(cachedData, for: request)
                    DispatchQueue.main.async {
                        print("downloaded from internet")
                        self.imageData = data
                    }
                }
            }).resume()
        }
    }
}
