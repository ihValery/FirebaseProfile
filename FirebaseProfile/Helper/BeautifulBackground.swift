//
//  BeautifulBackground.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 6.06.21.
//

import SwiftUI

struct BeautifulBackground: View {
    @Binding var image: UIImage
    
    var body: some View {
        ZStack {
            Image("bgFon3").resizable()
            Image(uiImage: image).resizable()
        }
        .overlay(BlurViewDark())
        .ignoresSafeArea()
    }
}

struct BeautifulBackground_Previews: PreviewProvider {
    static var previews: some View {
        BeautifulBackground(image: .constant(UIImage()))
    }
}
