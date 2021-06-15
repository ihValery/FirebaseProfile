//
//  BeautifulBackground.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 6.06.21.
//

import SwiftUI

struct BeautifulBg: View {
    @Binding var image: UIImage

    var body: some View {
        ZStack {
            Image("day").resizable()
            Image(uiImage: image).resizable()
        }
        .overlay(BlurViewDark())
        .ignoresSafeArea()
    }
}
