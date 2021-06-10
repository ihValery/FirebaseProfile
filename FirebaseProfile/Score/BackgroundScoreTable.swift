//
//  BackgroundScoreTable.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 10.06.21.
//

import SwiftUI

struct BackgroundScoreTable: View {
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blueStart, .blueEnd]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            VStack {
                BackgroundAnimation()
                    .drawingGroup()
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 350)
                Spacer()
            }
            
            ZStack {
                
                VStack {
                    Header()
                        .frame(height: getRect().height / 6)
                        .padding(.top, 30)
                    Spacer()
                }
                
                RectangleReverseAngle(startY: 125).fill(Color.white)
                    .edgesIgnoringSafeArea([.horizontal, .bottom])
                
                ScrollView {
                    LazyVStack {
                        ForEach(scoreData) { item in
                            OneCardScore(name: item.theme, result: item.score, date: item.date)
                                .padding(.vertical, 35).padding(.leading, 10)
                        }
                    }
                }
                .frame(height: getRect().height * 4 / 6)
                .offset(y: 120)
            }
        }
    }
}

struct ScoreTable_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundScoreTable()
    }
}
