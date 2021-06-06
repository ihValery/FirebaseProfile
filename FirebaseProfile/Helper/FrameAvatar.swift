//
//  FrameAvatar.swift
//  testRemovetest
//
//  Created by Валерий Игнатьев on 5.06.21.
//

import SwiftUI

struct FrameAvatar: View {
    @Binding var image: UIImage
    
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300)
                .clipped()
                .background(BlurViewLight())
                .cornerRadius(25)
        }
    }
}

struct ImagePreview_Previews: PreviewProvider {
    static var previews: some View {
        FrameAvatar(image: .constant(UIImage()))
            .preferredColorScheme(.dark)
    }
}
