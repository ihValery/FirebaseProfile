//
//  BgCardScore.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 27.06.21.
//

import SwiftUI

struct BgCardScore: View {
    var body: some View {
        VStack {
            Rectangle().fill(Color.cardScoreTwo).opacity(0.3)
                .cornerRadius(6)
                .clipShape(CustomCorners(corner: [.topLeft, .bottomRight], radius: 60))
                .frame(height: 120)
        }
        .padding()
    }
}
