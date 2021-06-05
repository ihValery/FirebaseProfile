//
//  ImagePreview.swift
//  testRemovetest
//
//  Created by Валерий Игнатьев on 5.06.21.
//

import SwiftUI

struct ImagePreview: View {
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()

    var body: some View {
        VStack {
            ZStack {
                Image(uiImage: self.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 300)
                    .clipped()
                    .background(BlurView())
                    .cornerRadius(25)
            }
            
//            Button(action: {
//                self.isShowPhotoLibrary = true
//            }) {
//                HStack {
//                    Image(systemName: "photo")
//                        .font(.system(size: 20))
//
//                    Text("Photo library")
//                        .font(.headline)
//                }
//                .font(.title)
//                .frame(maxWidth: .infinity, maxHeight: 48)
//                .foregroundColor(.black)
//                .background(RoundedRectangle(cornerRadius: 7).fill(Color.white))
//            }
//            .padding(.horizontal)
        }
//        .sheet(isPresented: $isShowPhotoLibrary) {
//            ImagePicker(selectedImage: self.$image, sourceType: .photoLibrary)
//        }
    }
}

struct ImagePreview_Previews: PreviewProvider {
    static var previews: some View {
        ImagePreview()
            .preferredColorScheme(.dark)
    }
}
