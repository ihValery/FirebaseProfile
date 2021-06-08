//
//  FrameAvatar.swift
//  testRemovetest
//
//  Created by Валерий Игнатьев on 5.06.21.
//

import SwiftUI

struct FrameAvatar: View {
    var sideSquare: CGFloat { getRect().width - 40 }
    @Binding var image: UIImage
    
    var body: some View {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: sideSquare, maxHeight: sideSquare)
                .background(BlurViewLight())
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 1))
    }
}
